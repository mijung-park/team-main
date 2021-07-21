CREATE TABLE tbl_product (
	product_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    product_price INT(50) NOT NULL,
    product_seller VARCHAR(50) NOT NULL,
    product_info VARCHAR(200) NOT NULL,
    product_filename VARCHAR(200) NOT NULL,
    product_readcnt INT(11) NOT NULL,
    product_status INT(11) NOT NULL,
	product_regdate TIMESTAMP DEFAULT NOW(),
    product_quantity INT(11) NOT NULL,
    product_updatedate TIMESTAMP DEFAULT NOW(),
    category_seq INT(11) NOT NULL,
    user_nickname VARCHAR(50) NOT NULL,
    product_like INT(11)
);

DESC tbl_product;

SELECT * FROM tbl_product;