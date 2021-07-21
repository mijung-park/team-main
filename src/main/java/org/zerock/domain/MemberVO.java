package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_nickName;
	private Date member_birth;
	private String member_phoneNum;
	private String member_mail;
	private String member_addNum; // 우편번호
	private String member_addCity; // 주소
	private String member_gender;
	private int member_grade;
	private int member_point;
	private Date member_regdate;
	private int eventCheck;
	private int enabled;
	
	private List<AuthVO> authList;
	
}
