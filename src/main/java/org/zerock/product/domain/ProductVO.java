package org.zerock.product.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	//등록시하드코딩컬럼
	private int product_seq; //물품 시퀀스
	//업데이트시 수정안되는컬럼
	private int product_price; //물품 가격
	private int product_quantity; //물품 수량
	private int product_seller; // 제품 판매자
	//업데이트시 수정되는컬럼(+updatedate하드코딩)
	private String product_name; //제품 이름
	private String user_nickname; //유저 닉네임
	private String product_filename; //제품 파일 이름
	private String product_info; //제품 설명
	private int category_seq; //카테고리 시퀀스
	//default가 정해져있는 컬럼
	private int product_readcnt; // 조회수
	private int product_status; //
	private Date product_regdate;
	private Date product_updatedate;
	private int product_like;

}