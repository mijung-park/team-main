CREATE TABLE tbl_qa_file (
	id INT PRIMARY KEY AUTO_INCREMENT,
    seq INT,
    FOREIGN KEY (seq) REFERENCES tbl_qaboard(qa_seq),
    fileName VARCHAR(200) NOT NULL
);

DESC tbl_qa_file;
