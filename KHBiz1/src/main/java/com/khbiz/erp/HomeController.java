package com.khbiz.erp;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.khbiz.member.MemberDTO;
import com.khbiz.schedule.ScheduleDTO;
import com.khbiz.schedule.ScheduleService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	private ScheduleService scheduleService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpServletRequest request) {
		request.getSession().setAttribute("member", null);
		
		return "index";

	}
	@RequestMapping(value="/home")
	public void index(HttpServletRequest request){
	}
	@RequestMapping(value="/dash")
	public String dashboard(HttpServletRequest request){
		String path ="dashboard/dashboard";
		if(request.getSession().getAttribute("member") ==null){
			path ="redirect:/";
		}else{
			MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
			List<ScheduleDTO> list = scheduleService.getToday(memberDTO);
			List<ScheduleDTO> tomorrow = scheduleService.getTomorrow(memberDTO);
			request.setAttribute("list", list);
			request.setAttribute("tomorrow", tomorrow);
		}
		return path;
	}
	
}
