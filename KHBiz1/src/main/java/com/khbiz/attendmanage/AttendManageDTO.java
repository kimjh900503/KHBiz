package com.khbiz.attendmanage;

public class AttendManageDTO {
	private String code;
	private int vacation;
	private int used;
	private int late;
	private int early;
	private int absence;
	private int business;
	private int over;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getVacation() {
		return vacation;
	}
	public void setVacation(int vacation) {
		this.vacation = vacation;
	}
	public int getUsed() {
		return used;
	}
	public void setUsed(int used) {
		this.used = used;
	}
	public int getLate() {
		return late;
	}
	public void setLate(int late) {
		this.late = late;
	}
	public int getEarly() {
		return early;
	}
	public void setEarly(int early) {
		this.early = early;
	}
	public int getAbsence() {
		return absence;
	}
	public void setAbsence(int absence) {
		this.absence = absence;
	}
	public int getBusiness() {
		return business;
	}
	public void setBusiness(int business) {
		this.business = business;
	}
	public int getOver() {
		return over;
	}
	public void setOver(int over) {
		this.over = over;
	}
	
}
