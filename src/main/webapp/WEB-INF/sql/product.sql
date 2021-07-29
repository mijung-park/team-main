CREATE TABLE tbl_product (
	product_seq INT(20) PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    product_price INT(20) NOT NULL,
    product_seller VARCHAR(30) NOT NULL,
    product_info VARCHAR(255) NOT NULL,
    product_filename VARCHAR(255) NOT NULL,
    product_readcnt INT(10) NOT NULL DEFAULT 0,
    product_status INT(1) NOT NULL DEFAULT 0,
	product_regdate TIMESTAMP DEFAULT NOW() NOT NULL,
    product_quantity INT(10) NOT NULL,
    product_updatedate TIMESTAMP DEFAULT NOW() NOT NULL,
    category_seq INT(10) NOT NULL DEFAULT 0,
    user_nickname VARCHAR(24) NOT NULL,
    product_like INT(10) DEFAULT 0
);

DESC tbl_product;

SELECT * FROM tbl_product;