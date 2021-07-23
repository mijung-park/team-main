CREATE TABLE tbl_category (
	category_seq INT(11) primary KEY AUTO_INCREMENT,
    category_main VARCHAR(200) NOT NULL,
    category_sub VARCHAR(200)
);

DESC tbl_category;

SELECT * FROM tbl_category;