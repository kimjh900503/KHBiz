package com.khbiz.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MemberService {

	
	@Autowired
	MemberDAO memberDAO;
	
	//회원 리스트 
	public void MemberList(String type,String str,Model model){
		
	}
}
