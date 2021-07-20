package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.CsVO;

public interface CsMapper {

	
	public CsVO read(int seq);
	public CsVO read_secret(int seq);
	
	public int getTotalCount(Criteria cri);
	
	public List<CsVO> getList();
	
	public List<CsVO> getListWithPaging(Criteria cri);
	
	public void insert(CsVO board);
	
	public void insertSelectKey(CsVO board);

	
	public int delete(int seq);
	
	public int update(CsVO board);
	
	public void updateReplyCnt(
			@Param("cs_seq") int cs_seq, 
			@Param("amount") int amount);
	
	public void updateReplyCnt_admin(
			@Param("cs_seq") int cs_seq, 
			@Param("amount") int amount);

	public void addCnt(int cs_seq);
	
	public int readCnt(int cs_seq);
}
