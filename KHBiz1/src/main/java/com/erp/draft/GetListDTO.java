package com.erp.draft;

import java.util.Date;

public class GetListDTO {

	private int d_num;
	private String code;
	private String title;
	private String contents;
	private Date up_date;
	private String due_date;
	private String kind;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getD_num() {
		return d_num;
	}
	public void setD_num(int d_num) {
		this.d_num = d_num;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	private int kind2;
	private String sheet_code;
	private String sheet_kind;
	private String code2;
	private String due_per_date;
	private int ranking;
	
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getUp_date() {
		return up_date;
	}
	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}
	public String getDue_date() {
		return due_date;
	}
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}
	public int getKind2() {
		return kind2;
	}
	public void setKind2(int kind2) {
		this.kind2 = kind2;
	}
	public String getSheet_code() {
		return sheet_code;
	}
	public void setSheet_code(String sheet_code) {
		this.sheet_code = sheet_code;
	}
	public String getSheet_kind() {
		return sheet_kind;
	}
	public void setSheet_kind(String sheet_kind) {
		this.sheet_kind = sheet_kind;
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
	public int getRanking() {
		return ranking;
	}
	public void setRanking(int ranking) {
		this.ranking = ranking;
	}

	
}
