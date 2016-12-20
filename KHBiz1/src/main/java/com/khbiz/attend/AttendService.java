package com.khbiz.attend;

import java.util.HashMap;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.khbiz.attendmanage.AttendManageDAO;
import com.khbiz.member.MemberDTO;

@Service
public class AttendService {
	@Inject
	private AttendDAO attendDAO;
	@Inject
	private AttendManageDAO attendManageDAO;
	//출근
	public void checkIn(MemberDTO memberDTO){
		int result = attendDAO.checking(memberDTO);
		//금일 재로그인 체크
		if(-0.6<result && result<0 || result<-1){
			attendDAO.checkIn(memberDTO);						
		}
	}
	//퇴근
	public void checkOut(MemberDTO memberDTO){
		attendDAO.checkOut(memberDTO);
		int workingtime = 0;
		try {
			workingtime = attendDAO.workingtime(memberDTO);
		} catch (Exception e) {
			// TODO: handle exception
		}
		//분단위 제거
		workingtime = workingtime/100;
		//점심,저녁 2시간 제외 근무시간 8시간 초과근무
		if(workingtime>10){
			int overtime = workingtime-10;
			String over = String.valueOf(overtime);
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("overtime", over);
			map.put("code", memberDTO.getCode());
			attendDAO.overtime(map);
			attendManageDAO.over(memberDTO);
		}
	}
	//회원가입
	public void memberIn(MemberDTO memberDTO){
		attendDAO.memberIn(memberDTO);
	}
	
	//삭제
	public void memberDel(MemberDTO memberDTO){
		attendDAO.memberDel(memberDTO);
	}
}
