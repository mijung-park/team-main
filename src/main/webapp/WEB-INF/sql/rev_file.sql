CREATE TABLE tbl_rev_file (
	id INT PRIMARY KEY AUTO_INCREMENT,
    seq INT,
    FOREIGN KEY (seq) REFERENCES tbl_reviewboard(rev_seq),
    fileName VARCHAR(200) NOT NULL
);

DESC tbl_rev_file;
