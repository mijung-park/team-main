desc tbl_category;

select * from tbl_category;

insert into tbl_category (category_main, category_sub)
values ('키워드추천', '진단키트');

DROP TABLE tbl_category;

CREATE TABLE tbl_category (
	category_seq INT(11) primary key auto_increment,
    category_main varchar(50) NOT NULL,
    category_sub varchar(50) NOT NULL
);

insert INTO tbl_category (category_main, category_sub)
values ('자가진단키트', '진단키트');

select * FROM tbl_category;