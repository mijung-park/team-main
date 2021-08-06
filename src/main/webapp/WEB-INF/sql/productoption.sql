DROP TABLE tbl_productoption;

CREATE TABLE tbl_productoption (
	product_seq INT(20) NOT NULL,
    FOREIGN KEY (product_seq) REFERENCES tbl_product(product_seq),
    po_name VARCHAR(255) NOT NULL,
    po_quantity INT(20) NOT NULL,
    po_price INT(20) NOT NULL,
    productoption_seq INT(20) PRIMARY KEY AUTO_INCREMENT
);