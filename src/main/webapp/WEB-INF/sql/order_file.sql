CREATE TABLE tbl_order_file (
	id INT PRIMARY KEY AUTO_INCREMENT,
    seq INT,
    FOREIGN KEY (seq) REFERENCES tbl_order(order_seq),
    fileName VARCHAR(200) NOT NULL
);

DESC tbl_order_file;
