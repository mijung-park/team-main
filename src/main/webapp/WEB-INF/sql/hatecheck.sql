CREATE TABLE tbl_hatecheck (
	hateno INT(5) PRIMARY KEY AUTO_INCREMENT,
    rev_seq INT(5) NOT NULL,
    user_seq INT(6) NOT NULL,
    hate_check INT(5) DEFAULT 0,
	FOREIGN KEY (rev_seq) REFERENCES tbl_reviewboard(rev_seq),
    FOREIGN KEY (user_seq) REFERENCES tbl_user(user_seq)
);

DESC tbl_hatecheck;

SELECT * FROM tbl_hatecheck;

