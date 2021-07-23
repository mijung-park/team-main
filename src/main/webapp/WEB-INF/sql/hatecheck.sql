CREATE TABLE tbl_hatecheck (
	hateno INT(11) NOT NULL PRIMARY KEY,
    rev_seq INT(11) NOT NULL,
    user_seq INT(11) NOT NULL,
    hate_check INT(11) DEFAULT 0,
	FOREIGN KEY (rev_seq) REFERENCES tbl_reviewboard(rev_seq),
    FOREIGN KEY (user_seq) REFERENCES tbl_user(user_seq)
);

DESC tbl_hatecheck;

SELECT * FROM tbl_hatecheck;

