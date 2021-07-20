package org.zerock.domain;

import java.time.temporal.ChronoUnit;
import java.util.Date;

import lombok.Data;

@Data
public class CsReplyVO {

//	CREATE TABLE tbl_reply (
//			reply_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
//		    reply_content VARCHAR(1000) NOT NULL,
//		    reply_writer VARCHAR(30) NOT NULL,
//		    reply_regdate TIMESTAMP DEFAULT NOW(),
//		    reply_updatedate TIMESTAMP DEFAULT NOW(),
//		    reply_boardname VARCHAR(10) NOT NULL,
//		    reply_boardseq INT(11) NOT NULL,
//		    reply_filename VARCHAR(500)
//		);

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
