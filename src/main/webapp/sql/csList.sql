
CREATE TABLE tbl_cslist (
	cs_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
    cs_category VARCHAR(50) NOT NULL,
    cs_title VARCHAR(50) NOT NULL,
    cs_writer VARCHAR(30) NOT NULL,
    cs_readcnt INT(11) DEFAULT 0,
    cs_content VARCHAR(2000) NOT NULL,
    cs_secret VARCHAR(50) DEFAULT '모두에게',
    cs_status VARCHAR(50) DEFAULT '답변 대기중',
    cs_filename VARCHAR(50),
    cs_replycnt INT(11) DEFAULT 0,
    cs_regdate TIMESTAMP DEFAULT NOW(),
    cs_updatedate TIMESTAMP DEFAULT NOW()
);

ALTER TABLE tbl_cslist MODIFY cs_filename VARCHAR(500);

DESC tbl_cslist;

CREATE TABLE tbl_reply (
	reply_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
    reply_content VARCHAR(1000) NOT NULL,
    reply_writer VARCHAR(30) NOT NULL,
    reply_regdate TIMESTAMP DEFAULT NOW(),
    reply_updatedate TIMESTAMP DEFAULT NOW(),
    reply_boardname VARCHAR(10) NOT NULL,
    reply_boardseq INT(11) NOT NULL,
    reply_filename VARCHAR(500)
);

DESC tbl_reply;

CREATE TABLE tbl_user (
	private
