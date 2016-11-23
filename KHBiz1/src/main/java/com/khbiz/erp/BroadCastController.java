package com.khbiz.erp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BroadCastController {
	
	@RequestMapping(value="/broadcast")
	public String broadcast(){
		return "chatting/broadcast";
	}
	

}
