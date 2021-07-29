CREATE TABLE tbl_user (
	user_seq INT(30) PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(20) UNIQUE NOT NULL,
    user_name VARCHAR(30) NOT NULL,
    user_password VARCHAR(100) NOT NULL,
    user_nickname VARCHAR(24) UNIQUE NOT NULL,
    user_address VARCHAR(255) NOT NULL,
    user_addresscode varchar(20) NOT NULL,
    user_phone VARCHAR(255) UNIQUE NOT NULL,
    user_birth VARCHAR(30) NOT NULL,
    user_grade INT(10) NOT NULL DEFAULT 1,
    user_point INT(30) DEFAULT 100000,
    user_regdate TIMESTAMP DEFAULT NOW(),
    eventcheck INT(2)
);

DESC tbl_user;

SELECT * FROM tbl_user;