package org.zerock.qaboard.domain;

import java.time.temporal.ChronoUnit;
import java.util.Date;

import lombok.Data;

@Data
public class QaVO {
	
	private int qa_seq;	
	private String qa_category;
	private String qa_title;
	private String qa_writer;
	private int qa_readcnt;
	private String qa_content;
	private String qa_secret;
	private String qa_status;
	private String qa_filename;
	private Date qa_regdate;
	private Date qa_updatedate;	
	private int qa_replycnt;
	private int qa_replycnt_admin;
	private String qa_password;
	

}