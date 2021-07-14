CREATE DATABASE untact;
use untact;

CREATE TABLE csList (
	bno INT PRIMARY KEY AUTO_INCREMENT,
    sort VARCHAR(255) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    writer VARCHAR(50) NOT NULL,
    wrdate TIMESTAMP DEFAULT NOW()
);

DESC csList;

INSERT INTO csList
(sort, content, writer)
VALUES ('주문', '냥냥냥', '미정');

select * From csLbnoist;

DESC csList;

SELECT * FROM csList;

ALTER TABLE csList add nickName VARCHAR(50);

CREATE TABLE reply_list (
	rno INT PRIMARY KEY AUTO_INCREMENT,
    bno INT NOT NULL,
    reply VARCHAR(2000) NOT NULL,
    replyer VARCHAR(50) NOT NULL,
    replyDate TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY (bno) REFERENCES cs_list(bno)
);

RENAME TABLE csList TO cs_list;