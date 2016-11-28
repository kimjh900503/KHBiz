package com.khbiz.attend;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.khbiz.member.MemberDTO;

@Service
public class AttendService {
	@Inject
	private AttendDAO attendDAO; 
	//출근
	public void checkIn(MemberDTO memberDTO){
		int result = attendDAO.checking(memberDTO);
		if(-0.6<result && result<0){
			attendDAO.checkIn(memberDTO);			
		}
	}
	//퇴근
	//회원가입
}
