CREATE TABLE tbl_reviewboard (
	rev_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
    rev_category VARCHAR(50) NOT NULL,
    rev_title VARCHAR(50) NOT NULL,
    rev_writer VARCHAR(50) NOT NULL,
    rev_readcnt INT(11),
    rev_content VARCHAR(2000) NOT NULL,
    rev_filename VARCHAR(200) NOT NULL,
    rev_good INT(11),
    rev_hate INT(11),
    rev_regdate TIMESTAMP DEFAULT NOW(),
    rev_updatedate TIMESTAMP DEFAULT NOW(),
    rev_replycnt INT(11)
);

DESC tbl_reviewboard;

SELECT * FROM tbl_reviewboard;