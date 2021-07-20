package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.Criteria;
import org.zerock.domain.CsVO;
import org.zerock.mapper.CsMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class CsServiceImpl implements CsService {

	@Setter (onMethod_ = @Autowired)
	private CsMapper mapper;
	

	@Override
	public void register(CsVO board) {
		mapper.insertSelectKey(board);
	}	

	
	@Override
	public List<CsVO> getList(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public CsVO get(int seq) {
		return mapper.read(seq);
	}
	@Override
	public CsVO get_secret(int seq) {
		return mapper.read_secret(seq);
	}
	
	@Override
	public boolean remove(int seq) {
		
		return mapper.delete(seq) == 1;
	}
	
	@Override
	public boolean modify(CsVO board) {
		
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
