CREATE TABLE tbl_productoption (
	product_seq INT(11),
    po_name VARCHAR(200) NOT NULL,
    po_quantity INT(11) NOT NULL,
    po_price INT(11) NOT NULL,
    productoption_seq INT(11) PRIMARY KEY AUTO_INCREMENT
);

DESC tbl_productoption;

SELECT * FROM tbl_productoption;