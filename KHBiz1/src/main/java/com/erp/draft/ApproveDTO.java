package com.erp.draft;

public class ApproveDTO {

	private String code;
	private String code2;
	private String due_per_date;
	private String ranking;
	private String sheet_code;
	private String approve_date;
	private String a_or_b;
	
	public String getApprove_date() {
		return approve_date;
	}
	public void setApprove_date(String approve_date) {
		this.approve_date = approve_date;
	}
	public String getA_or_b() {
		return a_or_b;
	}
	public void setA_or_b(String a_or_b) {
		this.a_or_b = a_or_b;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getCode2() {
		return code2;
	}
	public void setCode2(String code2) {
		this.code2 = code2;
	}
	public String getDue_per_date() {
		return due_per_date;
	}
	public void setDue_per_date(String due_per_date) {
		this.due_per_date = due_per_date;
	}
	public String getRanking() {
		return ranking;
	}
	public void setRanking(String ranking) {
		this.ranking = ranking;
	}
	public String getSheet_code() {
		return sheet_code;
	}
	public void setSheet_code(String sheet_code) {
		this.sheet_code = sheet_code;
	}
	
}
