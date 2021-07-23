CREATE TABLE tbl_freeboard (
	free_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
    free_title VARCHAR(50) NOT NULL,
    free_content VARCHAR(2000) NOT NULL,
    free_writer VARCHAR(50) NOT NULL,
    free_notice INT(11),
    free_regdate timestamp DEFAULT NOW(),
    free_updatedate timestamp DEFAULT NOW(),
    free_nickname VARCHAR(50),
    free_replycnt int(11)
);

DESC tbl_freeboard;

SELECT * FROM tbl_freeboard;