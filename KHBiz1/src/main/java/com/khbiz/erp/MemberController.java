package com.khbiz.erp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.khbiz.attend.AttendService;
import com.khbiz.member.MemberDTO;
import com.khbiz.member.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private AttendService attendService;
	
	//회원가입(admin) form
	@RequestMapping(value="/memberJoin",method=RequestMethod.GET)
	public void memberJoin(){}
	
	//회원가입(admin)
	@RequestMapping(value="/memberJoin",method=RequestMethod.POST)
	public String memberJoin(MemberDTO memberDTO,RedirectAttributes rd){
		int result=0;
		String path="";
		String message="";
		try {
			result =memberService.memberJoin(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			path="redirect:/";
			message="회원 가입 성공";
		}else{
			path="redirect:/";
			message="사원번호가 중복됩니다";
		}
		rd.addFlashAttribute("message", message);
		return path;
	}
	
	//로그인 form
	@RequestMapping(value="/memberLogin",method=RequestMethod.GET)
	public String memberLogin(){
		
		return "redirect:/";
	}
	
	
	//로그인
	@RequestMapping(value="/memberLogin",method=RequestMethod.POST)
	public String memberLogin(MemberDTO memberDTO,Model model,RedirectAttributes rd, HttpServletRequest request){
		String message="";
		try {
			memberDTO= memberService.memberLogin(memberDTO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			memberDTO=null;
		}
		
		if(memberDTO ==null){
			message="아이디나 비밀번호를 확인해주세요";
			rd.addFlashAttribute("message", message);
			return "redirect:/";
			
		}else if(memberDTO.getName() ==null){
			model.addAttribute("member", memberDTO);
			model.addAttribute("message", message);
			return "member/memberFirstMod";
		}
		else{
			request.getSession().setAttribute("member", memberDTO);
			attendService.checkIn(memberDTO);
			return "dashboard/dashboard";
		}
		
	}
	
	
	//개인정보 form
	@RequestMapping(value="/memberFirstMod",method=RequestMethod.GET)
	public void memberFirstMod(){}
	

	//개인정보 넣기
	@RequestMapping(value="/memberFirstMod",method=RequestMethod.POST)
	public String memberFirstMod(MemberDTO memberDTO,@RequestParam String id_1,@RequestParam String id_2,
			@RequestParam String year,@RequestParam String month,	@RequestParam String day,
			@RequestParam String phone1,@RequestParam String phone2, 
			HttpServletRequest request,RedirectAttributes rd){
		String message="";	
		String id=id_1+"@"+id_2;
		memberDTO.setId(id);
		String birth=year+"년"+month+"월"+day+"일";
		memberDTO.setBirth(birth);
		String phone="010-"+phone1+"-"+phone2;
		memberDTO.setPhone(phone);
		int result=0;
		try {
			result=memberService.memberFirstMod(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			message="개인정보 등록 완료";
			rd.addFlashAttribute("message", message);
			request.getSession().setAttribute("member", memberDTO);
			
		}else{
			message="개인정보 등록 실패";
			rd.addFlashAttribute("message", message);
		}
		return "redirect:/";
	}
		
	//id중복확인
	@RequestMapping(value="/memberIdCheck")
	public String memberIdCheck(@RequestParam String id,MemberDTO memberDTO,Model model){
		int result=0;
		
		try {
			result =memberService.memberIdCheck(id, memberDTO);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("result", result);
		return "member/memberIdCheck";
		
	}
	
	//로그아웃
	@RequestMapping(value="/memberLogout")
	public String memberLogout(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	//회원정보
	@RequestMapping(value="/memberView")
	public void memberView(){}
	
	
	
	//회원수정 form
	@RequestMapping(value="/memberMod",method=RequestMethod.GET)
	public void memberMod(){}
	
	//회원수정
	@RequestMapping(value="/memberMod",method=RequestMethod.POST)
	public String memberMod(MemberDTO memberDTO,@RequestParam String phone1, @RequestParam String phone2,HttpServletRequest request,Model model){
		String phone="010-"+phone1+"-"+phone2;
		memberDTO.setPhone(phone);
		int result =0;
		String message="";
		System.out.println(memberDTO.getAddress1());
		try {
			result =memberService.memberMod(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			message="수정 성공";
			model.addAttribute("message", message);
			request.getSession().setAttribute("member", memberDTO);
			
		}else{
			message="수정 실패";
			model.addAttribute("message", message);
			
		}
		return "member/memberView";
	}
	@RequestMapping(value="/memberDelete",method=RequestMethod.GET)
	public void memberDelete(){}
	
	
	//회원탈퇴
	@RequestMapping(value="/memberDelete",method=RequestMethod.POST)
	public String memberDelete(MemberDTO memberDTO,RedirectAttributes rd,HttpSession session){
		int result =0;
		String message="";
		
		
		try {
			result =memberService.memberDelete(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			message="삭제 성공";
			rd.addFlashAttribute("message", message);
			session.invalidate();
			
			
		}else{
			message="삭제 실패";
			rd.addFlashAttribute("message", message);
			
		}
		return "redirect:/";
	}
	
	
	

	
}
