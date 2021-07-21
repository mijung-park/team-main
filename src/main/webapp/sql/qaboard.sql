CREATE TABLE tbl_qaboard (
	qa_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
    qa_category VARCHAR(50) NOT NULL,
    qa_title VARCHAR(50) NOT NULL,
    qa_writer VARCHAR(50) NOT NULL,
    qa_readcnt INT(11) DEFAULT 0,
    qa_content VARCHAR(2000) NOT NULL,
    qa_secret VARCHAR(50) NOT NULL,
    qa_status VARCHAR(50) DEFAULT '답변 대기중',
    qa_filename VARCHAR(200),
    qa_regdate TIMESTAMP DEFAULT NOW(),
    qa_updatedate TIMESTAMP DEFAULT NOW(),
    qa_replycnt INT(11) DEFAULT 0,
    qa_replycnt_admin INT(11) DEFAULT 0
);

DESC tbl_qaboard;

SELECT * FROM tbl_qaboard;