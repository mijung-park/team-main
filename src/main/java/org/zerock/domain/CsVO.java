package org.zerock.domain;

import java.time.temporal.ChronoUnit;
import java.util.Date;

import lombok.Data;

@Data
public class CsVO {

	
//	CREATE TABLE tbl_cslist (
//			cs_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
//		    cs_category VARCHAR(50) NOT NULL,
//		    cs_title VARCHAR(50) NOT NULL,
//		    cs_writer VARCHAR(30) NOT NULL,
//		    cs_readcnt INT(11) DEFAULT 0,
//		    cs_content VARCHAR(2000) NOT NULL,
//		    cs_secret VARCHAR(50) DEFAULT '모두에게',
//		    cs_status VARCHAR(50) DEFAULT '답변 대기중',
//		    cs_filename VARCHAR(50),
//		    cs_replycnt INT(11) DEFAULT 0,
//		    cs_regdate TIMESTAMP DEFAULT NOW(),
//		    cs_updatedate TIMESTAMP DEFAULT NOW()
//		);

	
	private int cs_seq;	
	private String cs_category;
	private String cs_title;
	private String cs_writer;
	private int cs_readcnt;
	private String cs_content;
	private String cs_secret;
	private String cs_status;
	private String cs_filename;
	private int cs_replycnt;
	private Date cs_regdate;
	private Date cs_updatedate;	
	
	private int cs_replycnt_admin;
	private String cs_password;
	
//	public Date getCs_regdateKST() {
//		return Date.from(cs_regdate.toInstant().plus(9, ChronoUnit.HOURS));
//	}
//	
//	public Date getCa_updatedateKST() {
//		return Date.from(cs_updatedate.toInstant().plus(9, ChronoUnit.HOURS));
//	}
	
}
