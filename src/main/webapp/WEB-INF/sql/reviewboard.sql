CREATE TABLE tbl_reviewboard (
	rev_seq INT(10) PRIMARY KEY AUTO_INCREMENT,
    rev_category VARCHAR(50) NOT NULL,
    rev_title VARCHAR(150) NOT NULL,
    rev_writer VARCHAR(30) NOT NULL,
    rev_readcnt INT(10) DEFAULT 0,
    rev_content VARCHAR(3000) NOT NULL,
    rev_filename VARCHAR(3000) NULL,
    rev_good INT(10) DEFAULT 0,
    rev_hate INT(10) DEFAULT 0,
    rev_regdate TIMESTAMP DEFAULT NOW(),
    rev_updatedate TIMESTAMP DEFAULT NOW(),
    rev_replycnt INT(5) DEFAULT 0
);

DESC tbl_reviewboard;

SELECT * FROM tbl_reviewboard;

ALTER TABLE tbl_reviewboard MODIFY rev_regdate TIMESTAMP DEFAULT NOW() NOT NULL;