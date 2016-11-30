package com.khbiz.erp;




import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.khbiz.member.MemberDTO;
import com.khbiz.schedule.ScheduleDTO;
import com.khbiz.schedule.ScheduleService;

@Controller
@RequestMapping(value="/schedule")
public class ScheduleController {
	@Inject
	private ScheduleService scheduleService;
	
	@RequestMapping(value="/scheduler")
	public String scheduler(HttpServletRequest request){
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		if(memberDTO ==null){
			return "redirect:/";
		}else{
			List<ScheduleDTO> list = scheduleService.getToday(memberDTO);
			request.setAttribute("list", list);
			return "schedule/scheduler";
		}
	}
	@RequestMapping(value="/delSchedule")
	public String delSchedule(@RequestParam int s_num,RedirectAttributes rd){
		int result = scheduleService.delSchedule(s_num);
		if(result >0){
			rd.addFlashAttribute("message", "삭제");
		}else{
			rd.addFlashAttribute("message", "에러");
		}
		return "redirect:/schedule/scheduler";
	}
	@RequestMapping(value="/modiSchedule")
	public String modiSchedule(ScheduleDTO scheduleDTO,RedirectAttributes rd){
		int result = scheduleService.modiSchedule(scheduleDTO);
		if(result >0){
			rd.addFlashAttribute("message", "수정");
		}else{
			rd.addFlashAttribute("message", "에러");
		}
		return "redirect:/schedule/scheduler";
	}
}
