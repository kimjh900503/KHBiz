package com.khbiz.erp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/attend")
public class AttendController {
	public String attend(){
		return "test";
	}

}
