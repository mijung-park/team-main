  
CREATE TABLE tbl_user (
	user_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(50) NOT NULL,
    user_name VARCHAR(50) NOT NULL,
    user_password VARCHAR(100) NOT NULL,
    user_nickname VARCHAR(50) NOT NULL,
    user_address VARCHAR(200) NOT NULL,
    user_addresscode INT(11) NOT NULL,
    user_phone VARCHAR(50) NOT NULL,
    user_birth VARCHAR(50) NOT NULL,
    user_grade INT(11) NOT NULL DEFAULT 1,
    user_point INT(50) DEFAULT 100000,
    user_regdate TIMESTAMP DEFAULT NOW(),
    eventcheck INT(11)
);

DESC tbl_user;

SELECT * FROM tbl_user;

ALTER TABLE tbl_user CHANGE COLUMN user_addresscodd user_addresscode INT(11) NOT NULL;

ALTER TABLE tbl_user MODIFY COLUMN user_password VARCHAR(100) NOT NULL;

ALTER TABLE tbl_order CHANGE COLUMN order_useseq order_userseq INT(11) NOT NULL;