package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.CsVO;

public interface CsService {

	
	public void register(CsVO board);
	
//	public List<BoardVO> getlist();
	
	public List<CsVO> getList(Criteria cri);
	
	public CsVO get(int seq);
	
	public CsVO get_secret(int seq);
	
	public boolean remove (int seq);
	
	public boolean modify (CsVO board);
	
	public int getTotal(Criteria cri);

	public void addCnt(int qa_seq);
		
	public int readCnt(int qa_seq);	
	
}
