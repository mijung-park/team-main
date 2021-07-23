CREATE TABLE tbl_order (
	order_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
    order_productseq INT(11) NOT NULL,
    order_date timestamp DEFAULT NOW(),
    order_status INT(11) NOT NULL,
    order_poseq INT(11) NOT NULL,
    order_poname VARCHAR(50) NOT NULL,
    order_poprice INT(11) NOT NULl,
    order_quantity INT(11) NOT NULL,
    order_useseq INT(11) NOT NULL,
    order_username VARCHAR(50) NOT NULL,
    order_useraddress VARCHAR(200) NOT NULL,
    order_userphone INT(100) NOT NULL,
    order_filename VARCHAR(200)
);

DESC tbl_order;

SELECT * FROM tbl_order;
    