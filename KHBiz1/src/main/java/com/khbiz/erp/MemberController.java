package com.khbiz.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.khbiz.member.MemberService;

@Controller
public class MemberController {

	@Autowired 
	MemberService memberService;
	
	@RequestMapping(value="/memberList")
	public String memberList(String type,String str,Model model){
		return null;
	}
}
