package com.khbiz.schedule;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.khbiz.member.MemberDTO;
@Service
public class ScheduleService {
	@Inject
	private ScheduleDAO scheduleDAO;
	//등록
	public int setSchedule(ScheduleDTO scheduleDTO){
		int result = scheduleDAO.setSchedule(scheduleDTO);
		return result;
	}
	//보기
	public ScheduleDTO getSchdule(int s_num){
		return null;
	}
	//리스트
	public List<ScheduleDTO> getScheduleList(String code){
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setCode(code);
		return scheduleDAO.getScheduleList(memberDTO);
	}
	//수정
	public int modiSchedule(ScheduleDTO scheduleDTO){
		return scheduleDAO.modiSchedule(scheduleDTO);
	}
	//삭제
	public int delSchedule(int s_num){
		return scheduleDAO.delSchedule(s_num);
	}
	//오늘리스트
	public List<ScheduleDTO> getToday(MemberDTO memberDTO){
		return scheduleDAO.getToday(memberDTO);
	}

}
