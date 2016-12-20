package com.khbiz.attendmanage;

public class AttendListDTO {
	private String code;
	private int vacation;
	private int used;
	private int late;
	private int early;
	private int absence;
	private int over;
	private String department;
	private String position;
	private String name;
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
	public int getOver() {
		return over;
	}
	public void setOver(int over) {
		this.over = over;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
