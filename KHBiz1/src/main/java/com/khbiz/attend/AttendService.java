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
		
			attendDAO.checkIn(memberDTO);			
	
	}
	//퇴근
	//회원가입
}
