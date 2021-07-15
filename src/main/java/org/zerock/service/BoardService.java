package org.zerock.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

public interface BoardService {

	public List<BoardVO> getList(Criteria cri);
	
	public void write(BoardVO board, MultipartFile file);
}
