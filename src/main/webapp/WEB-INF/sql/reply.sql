CREATE TABLE tbl_reply (
	reply_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
    reply_content VARCHAR(2000) NOT NULL,
    reply_writer VARCHAR(50) NOT NULL,
    reply_regdate TIMESTAMP DEFAULT NOW(),
    reply_updatedate TIMESTAMP DEFAULT NOW(),
    reply_boardname VARCHAR(50) NOT NULL,
    reply_boardseq INT(11) NOT NULL,
    reply_filename VARCHAR(200) NOT NULL
);

DESC tbl_reply;

SELECT * FROM tbl_reply;