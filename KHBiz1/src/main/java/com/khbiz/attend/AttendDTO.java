package com.khbiz.attend;
import java.sql.Date;

public class AttendDTO {
	private String code; //회원코드
	private Date startTime; //출근시간
	private Date endTime; //퇴근시간
	private Date overTime; //OT
	private int absence; //결근
	private int businessTrip; //출장
	private int vacation; //유급휴가
	private int breaking; //무급휴가
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Date getOverTime() {
		return overTime;
	}
	public void setOverTime(Date overTime) {
		this.overTime = overTime;
	}
	public int getAbsence() {
		return absence;
	}
	public void setAbsence(int absence) {
		this.absence = absence;
	}
	public int getBusinessTrip() {
		return businessTrip;
	}
	public void setBusinessTrip(int businessTrip) {
		this.businessTrip = businessTrip;
	}
	public int getVacation() {
		return vacation;
	}
	public void setVacation(int vacation) {
		this.vacation = vacation;
	}
	public int getBreaking() {
		return breaking;
	}
	public void setBreaking(int breaking) {
		this.breaking = breaking;
	}
	

}
