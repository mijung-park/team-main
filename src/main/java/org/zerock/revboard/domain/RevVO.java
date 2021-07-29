package org.zerock.revboard.domain;

import java.time.temporal.ChronoUnit;
import java.util.Date;

import lombok.Data;

@Data
public class RevVO {
	private int rev_seq;
	private String rev_category;
	private String rev_title;
	private String rev_content;
	private String rev_writer;
	private int rev_readcnt;
	private String rev_filename;
	private int rev_good;
	private int rev_hate;
	private Date rev_regdate;
	private Date rev_updatedate;
	private int rev_replycnt;

}