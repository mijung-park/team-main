package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService{

	@Setter (onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	public List<BoardVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return null;
	}

}
