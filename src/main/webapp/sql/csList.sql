
CREATE TABLE tbl_cslist (
	cs_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
    cs_category VARCHAR(50) NOT NULL,
    cs_title VARCHAR(50) NOT NULL,
    cs_writer VARCHAR(30) NOT NULL,
    cs_readcnt INT(11) DEFAULT 0,
    cs_content VARCHAR(2000) NOT NULL,
    cs_secret VARCHAR(50) DEFAULT '모두에게',
    cs_status VARCHAR(50) DEFAULT '답변 대기중',
    cs_filename VARCHAR(50),
    cs_replycnt INT(11) DEFAULT 0,
    cs_regdate TIMESTAMP DEFAULT NOW(),
    cs_updatedate TIMESTAMP DEFAULT NOW()
);

ALTER TABLE tbl_cslist MODIFY cs_filename VARCHAR(500);

DESC tbl_cslist;

CREATE TABLE tbl_reply (
	reply_seq INT(11) PRIMARY KEY AUTO_INCREMENT,
    reply_content VARCHAR(1000) NOT NULL,
    reply_writer VARCHAR(30) NOT NULL,
    reply_regdate TIMESTAMP DEFAULT NOW(),
    reply_updatedate TIMESTAMP DEFAULT NOW(),
    reply_boardname VARCHAR(10) NOT NULL,
    reply_boardseq INT(11) NOT NULL,
    reply_filename VARCHAR(500)
);

DESC tbl_reply;

CREATE TABLE tbl_member(
  member_id  VARCHAR(50) PRIMARY KEY, -- 아이디
  member_pw VARCHAR(100) NOT NULL, -- 비밀번호
  member_name VARCHAR(30) NOT NULL, -- 이름
  member_nickName VARCHAR(30) NOT NULL, -- 닉네임
  member_birth DATE NOT NULL, -- 생일
  member_phoneNum VARCHAR(30) NOT NULL, -- 폰번호
  member_mail VARCHAR(100) NOT NULL, -- 이메일
  member_addNum VARCHAR(100) NOT NULL, -- 우편번호
  member_addCity VARCHAR(100) NOT NULL, -- 주소
  regDate TIMESTAMP DEFAULT NOW(), -- 가입날짜
  enabled TINYINT(1) DEFAULT 1
);

ALTER TABLE tbl_member Add member_grade VARCHAR(30);

SELECT * FROM tbl_member;

   	SELECT c.cs_seq cs_seq,
   		   c.cs_category cs_category,
   		   c.cs_title cs_title,
   		   c.cs_writer cs_writer,
   		   c.cs_readcnt cs_readcnt,
   		   c.cs_content cs_content,
   		   c.cs_secret cs_secret,
   		   c.cs_status cs_status,
   		   c.cs_filename cs_filename,
   		   c.cs_replycnt cs_replycnt,
   		   c.cs_regdate cs_regdate,
   		   c.cs_updatedate cs_updatedate
   	FROM tbl_cslist c LEFT JOIN tbl_reply r ON c.cs_seq = r.reply_seq
   						   JOIN tbl_member m ON c.cs_writer = m.member_id
	  	GROUP BY c.cs_seq
   	ORDER BY c.cs_seq DESC;
    
    INSERT INTO tbl_cslist (
      cs_seq, cs_category, cs_title, cs_content, cs_writer, cs_secret, cs_regdate, cs_filename) 
      VALUES ((SELECT * FROM (SELECT MAX(cs_seq)+1 FROM tbl_cslist) next), 
      		  3, 2, 43, 2, 3, NOW(), 3);
              
SELECT * FROM tbl_cslist;

   UPDATE tbl_cslist SET 
   		cs_replycnt = cs_replycnt + 6
	WHERE cs_seq = 2;


