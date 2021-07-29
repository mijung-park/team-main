
CREATE TABLE tbl_category (
	category_seq INT(20) primary key auto_increment,
    category_main varchar(100) NOT NULL,
    category_sub varchar(100) NOT NULL
);

INSERT INTO tbl_category (category_main, category_sub)
values ('마스크', 'KF-94');

INSERT INTO tbl_category (category_main, category_sub)
values ('마스크', 'KF-80');

INSERT INTO tbl_category (category_main, category_sub)
values ('마스크', 'KF-AD');

INSERT INTO tbl_category (category_main, category_sub)
values ('마스크', 'KF-99');

INSERT INTO tbl_category (category_main, category_sub)
values ('악세사리', '마스크가드');

INSERT INTO tbl_category (category_main, category_sub)
values ('악세사리', '이어가드');

INSERT INTO tbl_category (category_main, category_sub)
values ('악세사리', '마스크스트랩');

INSERT INTO tbl_category (category_main, category_sub)
values ('소독제', '젤형');

INSERT INTO tbl_category (category_main, category_sub)
values ('소독제', '스프레이형');

INSERT INTO tbl_category (category_main, category_sub)
values ('진단키트', '자가진단키트');

INSERT INTO tbl_category (category_main, category_sub)
values ('마스크', '덴탈마스크');

select * FROM tbl_category;