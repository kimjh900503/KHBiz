package com.khbiz.erp;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChatController {
	
	@RequestMapping(value="/createchat")
	public String createchat(@RequestParam String group, @RequestParam String name,@RequestParam(value="detail",required=false) String detail,HttpServletRequest request){
		System.out.println("그룹명은 : "+group);
		System.out.println("채팅방 이름은 : "+name);
		System.out.println("채팅방 설명은 : "+detail);
		String codes[] = request.getParameterValues("codes");
		for(String s : codes){
			System.out.println("초대할 멤버 코드 : "+s);
		}
		return "chatting/chatroom";
	}
}
