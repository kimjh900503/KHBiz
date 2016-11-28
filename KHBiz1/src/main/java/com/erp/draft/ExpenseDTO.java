package com.erp.draft;

import java.util.Date;

public class ExpenseDTO {
	private String sheet_code;
	private String code;
	private String price;
	private String contents2;
	private Date reg_date;
	public String getSheet_code() {
		return sheet_code;
	}
	public void setSheet_code(String sheet_code) {
		this.sheet_code = sheet_code;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getContents2() {
		return contents2;
	}
	public void setContents2(String contents2) {
		this.contents2 = contents2;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

}
