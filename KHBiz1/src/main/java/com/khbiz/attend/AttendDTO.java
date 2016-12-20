package com.khbiz.attend;
import java.sql.Date;

public class AttendDTO {
	private String code; //회원코드
	private Date startTime; //출근시간
	private Date endTime; //퇴근시간
	private Date overTime; //OT
	private int vacation; //유급휴가
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

	public int getVacation() {
		return vacation;
	}
	public void setVacation(int vacation) {
		this.vacation = vacation;
	}

	

}
