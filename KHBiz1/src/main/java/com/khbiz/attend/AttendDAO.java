package com.khbiz.attend;

import java.util.HashMap;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;

import com.khbiz.member.MemberDTO;

@Repository
public class AttendDAO {
	@Inject
	private SqlSession sqlSession;
	private String namespace="AttendMapper.";
	//출근
	public void checkIn(MemberDTO memberDTO){
		sqlSession.update(namespace+"checkIn", memberDTO);
	}
	//출근제한 출근 체크가 -0.6< result < 0 사이일 경우 출근x
	public int checking(MemberDTO memberDTO){
		return sqlSession.selectOne(namespace+"checking", memberDTO);
	}
	//퇴근
	public void checkOut(MemberDTO memberDTO){
		String code = memberDTO.getCode();
		sqlSession.update(namespace+"checkOut", code);
	}
	//근무시간 확인
	public int workingtime(MemberDTO memberDTO){
		return sqlSession.selectOne(namespace+"workingtime", memberDTO);
	}
	//OT
	public void overtime(HashMap<String, String> map){
		sqlSession.update(namespace+"overtime", map);
	}
	//회원가입
	public void memberIn(MemberDTO memberDTO){
		sqlSession.insert(namespace+"memberIn", memberDTO);
	}
	//휴가
	@Scheduled(cron="0 0 08 * * MON-FRI")
	public void vacation(){
		sqlSession.update(namespace+"vacation");
	}
	//삭제
	public void memberDel(MemberDTO memberDTO){
		sqlSession.delete(namespace+"memberDel", memberDTO);
	}

}
