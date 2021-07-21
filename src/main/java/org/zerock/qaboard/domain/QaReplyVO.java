package org.zerock.qaboard.domain;

import java.time.temporal.ChronoUnit;
import java.util.Date;

import lombok.Data;

@Data
public class QaReplyVO {

	private int reply_seq;
	private int reply_boardseq;
	private String reply_content;
	private String reply_writer;
	private Date reply_regdate;
	private Date reply_updatedate;
	private String reply_boardname;
	private String reply_filename;
	
	public Date getReply_regdateKST() {
		return Date.from(reply_regdate.toInstant().plus(9, ChronoUnit.HOURS));
	}

}