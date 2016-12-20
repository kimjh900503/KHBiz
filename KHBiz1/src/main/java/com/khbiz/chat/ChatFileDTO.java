package com.khbiz.chat;

import java.sql.Date;

public class ChatFileDTO {
	
	private int num;
	private int cnum;
	private String originName;
	private String fileName;
	private String mName;
	private Date reg_Date;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getmName() {
		return mName;
	}
	public void setmName(String mName) {
		this.mName = mName;
	}
	public Date getReg_Date() {
		return reg_Date;
	}
	public void setReg_Date(Date reg_Date) {
		this.reg_Date = reg_Date;
	} 
	

}
