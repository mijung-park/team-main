CREATE TABLE tbl_pro_file (
	id INT PRIMARY KEY AUTO_INCREMENT,
    seq INT,
    FOREIGN KEY (seq) REFERENCES tbl_product(product_seq),
    fileName VARCHAR(200) NOT NULL
);

DESC tbl_pro_file;
