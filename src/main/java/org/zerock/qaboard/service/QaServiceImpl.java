package org.zerock.qaboard.service;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Path;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.zerock.qaboard.domain.Criteria;
import org.zerock.qaboard.domain.QaFileVO;
import org.zerock.qaboard.domain.QaVO;
import org.zerock.qaboard.mapper.QaFileMapper;
import org.zerock.qaboard.mapper.QaMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;
import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.core.sync.RequestBody;
import software.amazon.awssdk.profiles.ProfileFile;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ObjectCannedACL;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;

@Service
@AllArgsConstructor
@Log4j
public class QaServiceImpl implements QaService {
	private String bucketName;
	private String profileName;
	private S3Client s3;
	
	@Setter (onMethod_ =@Autowired)
	private QaMapper mapper;
	
	@Setter (onMethod_ = @Autowired)
	private QaFileMapper fileMapper;
	
//	@Autowired
//	public BoardServiceImpl(BoardMapper mapper) {
//		this.mapper = mapper;
//	}
	
	public QaServiceImpl() {
		this.bucketName = "choongang-mezzang"; 
		this.profileName = "spring1"; 
		
		/*  
		 * create
		 *  /home/tomcat/.aws/credentials
		 */
		
		Path contentLocation = new File(System.getProperty("user.home") + "/.aws/credentials").toPath();
		ProfileFile pf = ProfileFile.builder()
				.content(contentLocation)
				.type(ProfileFile.Type.CREDENTIALS)
				.build();
		ProfileCredentialsProvider pcp = ProfileCredentialsProvider.builder()
				.profileFile(pf)
				.profileName(profileName)
				.build();
		
		this.s3 = S3Client.builder()
				.credentialsProvider(pcp)
				.build();
	}
	
	@Override
	public void register(QaVO board) {
		mapper.insertSelectKey(board);
	}	
	
	@Override
	@Transactional
	public void register(QaVO board, MultipartFile file) {
		register(board);
		
		if (file != null && file.getSize() > 0) {
			QaFileVO vo = new QaFileVO();
			vo.setSeq(board.getQa_seq());
			vo.setFileName(file.getOriginalFilename());
			
			fileMapper.insert(vo);
			upload(board, file);
		}
	}
	
	
	private void upload(QaVO board, MultipartFile file) {
		
		try(InputStream is = file.getInputStream()) {
		
		PutObjectRequest objectRequest = PutObjectRequest.builder()
				.bucket(bucketName)
				.key(board.getQa_seq() + "/" +file.getOriginalFilename())
				.contentType(file.getContentType())
				.acl(ObjectCannedACL.PUBLIC_READ)
				.build();
		
		s3.putObject(objectRequest, 
				RequestBody.fromInputStream(is, file.getSize()));
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		
	}

	
	@Override
	public List<QaVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public QaVO get(int seq) {
		return mapper.read(seq);
	}
	@Override
	public QaVO get_secret(int seq) {
		return mapper.read_secret(seq);
	}
	
	@Override
	public boolean remove(int seq) {
		
		return mapper.delete(seq) == 1;
	}
	
	@Override
	public boolean modify(QaVO board) {
		
		return mapper.update(board) == 1;
	}
	
	@Override
	public int getTotal(Criteria cri) {		
		return mapper.getTotalCount(cri);
	}
	
	@Override
	public void addCnt(int qa_seq) {
		mapper.addCnt(qa_seq);		
	}
	
	@Override
	public int readCnt(int qa_seq) {
		return mapper.readCnt(qa_seq);
	}


	
}