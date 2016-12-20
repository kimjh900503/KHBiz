package com.khbiz.notice;

import java.sql.Date;

public class NoticeDTO {
	private int notice_num;
	private String notice_writer;
	private String notice_title;
	private String notice_contents;
	private Date notice_date;
	private int notice_counts;
	private String notice_code;
	
	
	
	
	
	public String getNotice_code() {
		return notice_code;
	}
	public void setNotice_code(String notice_code) {
		this.notice_code = notice_code;
	}
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
	}
	public String getNotice_writer() {
		return notice_writer;
	}
	public void setNotice_writer(String notice_writer) {
		this.notice_writer = notice_writer;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}
	
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_counts() {
		return notice_counts;
	}
	public void setNotice_counts(int notice_counts) {
		this.notice_counts = notice_counts;
	}
	
	
	
	

}
