package com.khbiz.erp;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.khbiz.attendmanage.AttendManageDTO;
import com.khbiz.attendmanage.AttendManageService;
import com.khbiz.member.MemberDTO;

@Controller
@RequestMapping(value="/attendmanage")
public class AttendManageController {
	@Autowired
	private AttendManageService attendManageService;
	
	@RequestMapping(value="/attendmanage")
	public String attendManageList(HttpServletRequest request, Model model,RedirectAttributes rd){
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		int lastNum = 20;
		String path = "redirect:/";
		String message = "잘못된 접근입니다";
		try {
			lastNum = Integer.valueOf(request.getParameter("perPage"));
		} catch (Exception e) {
			lastNum = 20;
		}
		if(memberDTO != null){
			if(memberDTO.getDepartment().equals("인사팀")){
				path = attendManageService.attendList(lastNum, model);
			}else{
				rd.addFlashAttribute("message", message);
			}			
		}else{
			rd.addFlashAttribute("message", message);
		}
		return path;
	}
	@RequestMapping(value="/attendmanageAjax")
	public String attendManageAjaxList(HttpServletRequest request, Model model,RedirectAttributes rd){
		this.attendManageList(request, model, rd);
		return "attendmanage/attendmanageAjax";
	}
	@RequestMapping(value="/attenddepartmentmanage")
	public String attendDepartmentList(HttpServletRequest request,@RequestParam String department, Model model){
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		int lastNum = 20;
		String path = "redirect:/";
		String message = "잘못된 접근입니다";
		try {
			lastNum = Integer.valueOf(request.getParameter("perPage"));
		} catch (Exception e) {
			lastNum = 20;
		}
		if(memberDTO.getDepartment().equals("인사팀")){
			path = attendManageService.attendDepartmentList(lastNum,department, model);
		}else{
			model.addAttribute("message", message);
		}
		return path;
	}
	@RequestMapping(value="/attenddepartmentmanageAjax")
	public String attendDepartmentManageAjaxList(HttpServletRequest request,@RequestParam String department, Model model){
		this.attendDepartmentManageAjaxList(request, department, model);
		return "attendmanage/attenddepartmentmanageAjax";
	}
	
	@RequestMapping(value="/attendsearch")
	public String attendsearch(HttpServletRequest request,@RequestParam String search, Model model,RedirectAttributes rd){
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		int lastNum = 20;
		String path = "redirect:/";
		String message = "잘못된 접근입니다";
		try {
			lastNum = Integer.valueOf(request.getParameter("perPage"));
		} catch (Exception e) {
			lastNum = 20;
		}
		if(memberDTO != null){
			if(memberDTO.getDepartment().equals("인사팀")){
				path = attendManageService.attendsearch(lastNum,search, model);
			}else{
				rd.addFlashAttribute("message", message);
			}			
		}else{
			rd.addFlashAttribute("message", message);
		}
		return path;
	}
	@RequestMapping(value="/attendmodi")
	public String attendmodi(AttendManageDTO attendManageDTO,RedirectAttributes rd){
		int result = attendManageService.attendmodi(attendManageDTO);
		if(result>0){
			rd.addFlashAttribute("message", "수정 완료");
		}else{
			rd.addFlashAttribute("message", "에러");
		}
		return "redirect:/attendmanage/attendmanage";
	}
	
}
