package com.khbiz.erp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.khbiz.member.MemberService;

@Controller
public class BroadCastController {
	
	@Autowired 
	MemberService memberService;
	
	//broadcast
	@RequestMapping(value="/broadcast")
	public String broadcast(){
		return "chatting/broadcast";
	}
	//chatromm (채팅방) 
	/*@RequestMapping(value="/chatroom")
	public String chatroom(){
		return "chatting/chatroom";
	}*/
	
	//chat 시작페이지 (memberList가져오기) 
	@RequestMapping(value="/chat")
	public String chat(@RequestParam(value="type",required=false) String type,@RequestParam(value="str",required=false) String str,Model model,HttpSession session){
		String code =(String)session.getAttribute("code");
		System.out.println("session code : "+code);
		memberService.memberList(type, str, model,code);
		return "chatting/chat";
	}
	
	//ajax로 memberList 가져오기 
	@RequestMapping(value="/memberList")
	public String memberList(@RequestParam(value="type",required=false) String type,@RequestParam(value="str",required=false) String str,Model model,@RequestParam(value="codes" ,required=false) List<String> codes,HttpSession session){
		String code = (String)session.getAttribute("code");
		System.out.println("session code : "+code);
		memberService.memberList2(type, str, model, codes,code);
		return "chatting/result";
	}
}
