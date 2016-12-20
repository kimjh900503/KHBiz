package com.khbiz.schedule;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.khbiz.member.MemberDTO;
@Repository
public class ScheduleDAO {
	@Inject
	private SqlSession sqlSession;
	private String namespace="ScheduleMapper.";
	//등록
	public int setSchedule(ScheduleDTO scheduleDTO){
		return sqlSession.insert(namespace+"setSchedule", scheduleDTO);
	}
	//보기
	public ScheduleDTO getSchdule(int s_num){
		return null;
	}
	//리스트
	public List<ScheduleDTO> getScheduleList(MemberDTO memberDTO){
		return sqlSession.selectList(namespace+"getScheduleList", memberDTO);
	}
	//수정
	public int modiSchedule(ScheduleDTO scheduleDTO){
		return sqlSession.update(namespace+"modiSchedule", scheduleDTO);
	}
	//삭제
	public int delSchedule(int s_num){
		return sqlSession.delete(namespace+"delSchedule", s_num);
	}
	//오늘리스트
	public List<ScheduleDTO> getToday(MemberDTO memberDTO){
		return sqlSession.selectList(namespace+"getToday", memberDTO);
	}
	//내일리스트
	public List<ScheduleDTO> getTomorrow(MemberDTO memberDTO){
		return sqlSession.selectList(namespace+"getTomorrow", memberDTO);
	}
	//휴가등록
	public void setVacation(String sheet_code){
		sqlSession.insert(namespace+"setVacation", sheet_code);
	}

}
