package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private long bno;
	private String sort;
	private String title;
	private String content;
	private String writer;
	private String nickName;
	private Date wrdate;
	private int replyCnt;
}
