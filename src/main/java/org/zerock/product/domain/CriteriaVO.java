package org.zerock.product.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CriteriaVO {

	private int pageNum;
	private int amount;

	private String type;
	private String keyword;
	private String array;
	private String categoryNum;
	private String categoryMain;
	private String categorySub;
	
	public CriteriaVO() {
		this(1, 8);
	}

	public CriteriaVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {
		if (this.type == null) {
			return new String[] {};
		} else {
			return type.split("");
		}
	}

}