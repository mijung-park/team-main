CREATE TABLE tbl_reply (
	reply_seq INT(10) PRIMARY KEY AUTO_INCREMENT,
    reply_content VARCHAR(3000) NOT NULL,
    reply_writer VARCHAR(30) NOT NULL,
    reply_regdate TIMESTAMP DEFAULT NOW(),
    reply_updatedate TIMESTAMP DEFAULT NOW(),
    reply_boardname VARCHAR(10) NOT NULL,
    reply_boardseq INT(10) NOT NULL,
    reply_filename VARCHAR(3000) NULL
);

DESC tbl_reply;

SELECT * FROM tbl_reply;