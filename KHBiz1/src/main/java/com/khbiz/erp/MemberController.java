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

import com.khbiz.member.MemberDTO;
import com.khbiz.member.MemberService;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	//joinform
	@RequestMapping(value="/memberJoin",method=RequestMethod.GET)
	public void memberJoin(){}
	
	//join(admin)
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
			message="회원 가입 실패";
		}
		rd.addFlashAttribute("message", message);
		return path;
	}
	
	//loginform
	@RequestMapping(value="/memberLogin",method=RequestMethod.GET)
	public void memberLogin(){}
	
	
	//login
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
			message="개인정보를 입력하세요";
			model.addAttribute("member", memberDTO);
			model.addAttribute("message", message);
			return "member/memberFirstModForm";
		}
		else{
			message=memberDTO.getName()+"님";
			rd.addFlashAttribute("message", message);
			request.getSession().setAttribute("member", memberDTO);
			return "redirect:/";
		}
		
	}
	
	
	//firstModForm
	@RequestMapping(value="/memberFirstModForm")
	public void memberMod(){}
	

	//firstMod (사원이 코드받고 처음 로그인했을때 개인정보 넣는곳)
	@RequestMapping(value="/memberFirstMod",method=RequestMethod.POST)
	public String memberMod(MemberDTO memberDTO,@RequestParam String id_1,@RequestParam String id_2,
			@RequestParam String year,@RequestParam String month,	@RequestParam String day,
			@RequestParam String phone1,@RequestParam String phone2, 
			HttpServletRequest request,RedirectAttributes rd){
		String message="";	
		String id=id_1+"@"+id_2;
		memberDTO.setId(id);
		String birth=year+"/"+month+"/"+day;
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
		System.out.println(memberDTO.getId());
		System.out.println(memberDTO.getPhone());
		System.out.println(memberDTO.getPw());
		System.out.println(memberDTO.getAddress1());
		
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
		
	//아이디중복확인
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
	
	@RequestMapping(value="/memberView")
	public void memberView(){}
	
	@RequestMapping(value="/memberList")
	public String memberList(String type,String str,Model model){
		return null;
	}
	

	
}
