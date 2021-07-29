CREATE TABLE tbl_qaboard (
	qa_seq INT(10) PRIMARY KEY AUTO_INCREMENT,
    qa_category VARCHAR(50) NOT NULL,
    qa_title VARCHAR(1000) NOT NULL,
    qa_writer VARCHAR(30) NOT NULL,
    qa_readcnt INT(10) DEFAULT 0,
    qa_content VARCHAR(3000) NOT NULL,
    qa_secret VARCHAR(50) NOT NULL,
    qa_status VARCHAR(50) DEFAULT '답변 대기중',
    qa_filename VARCHAR(3000),
    qa_regdate TIMESTAMP DEFAULT NOW(),
    qa_updatedate TIMESTAMP DEFAULT NOW(),
    qa_replycnt INT(10) DEFAULT 0,
    qa_replycnt_admin INT(10) DEFAULT 0
);

DESC tbl_qaboard;

SELECT * FROM tbl_qaboard;
