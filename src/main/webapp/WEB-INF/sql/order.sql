CREATE TABLE tbl_order (
	order_seq INT(20) PRIMARY KEY AUTO_INCREMENT,
    order_productseq INT(20) NOT NULL,
    order_date timestamp DEFAULT NOW(),
    order_status INT(1) DEFAULT 0 NOT NULL,
    order_poseq INT(20) NOT NULL,
    order_poname VARCHAR(255) NOT NULL,
    order_poprice INT(10) NOT NULl,
    order_quantity INT(10) NOT NULL,
    order_userseq INT(20) NOT NULL,
    order_username VARCHAR(255) NOT NULL,
    order_useraddress VARCHAR(255) NOT NULL,
    order_userphone VARCHAR(255) NOT NULL,
    order_filename VARCHAR(30)
);

DESC tbl_order;

SELECT * FROM tbl_order;
