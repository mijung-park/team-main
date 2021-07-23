CREATE TABLE tbl_goodcheck (
	goodno INT(11) NOT NULL PRIMARY KEY,
    rev_seq INT(11) NOT NULL,
    user_seq INT(11) NOT NULL,
    like_check INT(11) DEFAULT 0,
	FOREIGN KEY (rev_seq) REFERENCES tbl_reviewboard(rev_seq),
    FOREIGN KEY (user_seq) REFERENCES tbl_user(user_seq)
);

DESC tbl_goodcheck;

SELECT * FROM tbl_goodcheck;


