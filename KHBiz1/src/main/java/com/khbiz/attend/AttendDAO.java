package com.khbiz.attend;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
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
		
		sqlSession.update(namespace+"checkOut", memberDTO);
	}
	//근무시간 확인
	public void workingtime(MemberDTO memberDTO){
		
	}
	//회원가입
	public void memberIn(){
		
	}
	//출장
	//휴가
	//무급
	//결근

}
