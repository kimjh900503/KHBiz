package com.khbiz.erp;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erp.draft.DraftDTO;
import com.erp.draft.DraftService;
import com.erp.draft.GetListDTO;
import com.khbiz.attend.AttendService;
import com.khbiz.attendmanage.AttendManageService;
import com.khbiz.member.MemberDTO;
import com.khbiz.member.MemberService;
import com.khbiz.schedule.ScheduleDTO;
import com.khbiz.schedule.ScheduleService;

@Controller
@RequestMapping(value="/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private AttendService attendService;
	@Autowired
	private AttendManageService attendManageService;
	@Inject
	private ScheduleService scheduleService;
	@Inject
	private DraftService draftService;


	   //회원가입(admin)
	   @RequestMapping(value="/memberJoin",method=RequestMethod.POST)
	   public String memberJoin(MemberDTO memberDTO,RedirectAttributes rd,HttpServletRequest request){
	      int result=0;
	      String path="";
	      String message="";
	      List<MemberDTO> ar=null;
	       SimpleDateFormat sdf = new SimpleDateFormat("yy");
	       Random random = new Random();
	       int codeCh=0;
	       int r = random.nextInt(10000)+1000;
	       if(r>10000){
	           r = r - 1000;
	       }
	       String code=sdf.format(new Date());
	       String code2=sdf.format(new Date());
	       code=code+r;
	       
	       try {
	          codeCh=memberService.memberCodeCheck(code, memberDTO);
	      } catch (Exception e1) {
	         // TODO Auto-generated catch block
	         e1.printStackTrace();
	      }
	      int lastNum=20;
	      try {
	         lastNum=Integer.valueOf(request.getParameter("perPage"));
	      } catch (Exception e) {
	         lastNum=20;
	      }
	       if(codeCh>0){
	          int r2 = random.nextInt(10000)+1000;
	          if(r2>10000){
	               r2 = r2 - 1000;
	           }
	          code2=code2+r2;
	       
	          memberDTO.setCode(code2);
	       }else{
	          memberDTO.setCode(code);
	          
	       }
	         
	      if(memberDTO.getPosition().equals("사장")){
	         memberDTO.setPosition_Rank(1);
	      }else if(memberDTO.getPosition().equals("팀장")){
	         memberDTO.setPosition_Rank(2);
	      }else if(memberDTO.getPosition().equals("차장")){
	         memberDTO.setPosition_Rank(3);
	      }else if(memberDTO.getPosition().equals("과장")){
	         memberDTO.setPosition_Rank(4);
	      }else if(memberDTO.getPosition().equals("대리")){
	         memberDTO.setPosition_Rank(5);
	      }else {
	         memberDTO.setPosition_Rank(6);
	      }
	      try {
	         result =memberService.memberJoin(memberDTO);
	         ar= memberService.memberOriginList(lastNum);
	         attendService.memberIn(memberDTO);
			attendManageService.memberIn(memberDTO);
	      } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      if(result>0){
	   
	         message="코드번호는"+memberDTO.getCode()+"입니다";
	      }else{
	         
	         message="사원등록이 실패했습니다";
	      }
	      rd.addFlashAttribute("message", message);
	      rd.addFlashAttribute("memberList", ar);
	      
	      return "redirect:memberOriginList";
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
			List<ScheduleDTO> list = scheduleService.getToday(memberDTO);
			List<ScheduleDTO> tomorrow = scheduleService.getTomorrow(memberDTO);
			List<GetListDTO> getDueList = null;
			List<DraftDTO> reportDueList = null;
			try {
				getDueList = draftService.dueTime(memberDTO.getCode(), model);
				reportDueList = draftService.dueTimeSend(memberDTO.getCode(), model);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getSession().setAttribute("getDueList", getDueList);
			request.getSession().setAttribute("reportDueList", reportDueList);
			request.setAttribute("list", list);
			request.setAttribute("tomorrow", tomorrow);
			return "dashboard/dashboard";
		}

	}


	//개인정보 form
	@RequestMapping(value="/memberFirstMod",method=RequestMethod.GET)
	public String memberFirstMod(){
		
		return "redirect:/";
	}


	//개인정보 넣기
	@RequestMapping(value="/memberFirstMod",method=RequestMethod.POST)
	public String memberFirstMod(MultipartHttpServletRequest multi,
			HttpServletRequest request,RedirectAttributes rd,HttpSession session){

		MemberDTO memberDTO=new MemberDTO();
		String message="";	

		String id=multi.getParameter("id_1")+"@"+multi.getParameter("id_2");
		memberDTO.setId(id);
		String birth=multi.getParameter("year")+"년"+multi.getParameter("month")+"월"+multi.getParameter("day")+"일";
		memberDTO.setBirth(birth);
		String phone="010-"+multi.getParameter("phone1")+"-"+multi.getParameter("phone2");
		memberDTO.setPhone(phone);
		memberDTO.setName(multi.getParameter("name"));
		memberDTO.setPw(multi.getParameter("pw"));
		memberDTO.setAddress1(multi.getParameter("address1"));
		memberDTO.setAddress2(multi.getParameter("address2"));
		memberDTO.setCode(multi.getParameter("code"));
		memberDTO.setDepartment(multi.getParameter("department"));
		memberDTO.setPosition(multi.getParameter("position"));

		memberDTO.setGender(multi.getParameter("gender"));


		/*String savePath="C:/Users/Administrator/git/KHBiz/KHBiz1/src/main/webapp/resources/upload";*/
		String savePath=session.getServletContext().getRealPath("resources/upload");
		MultipartFile mf=multi.getFile("pic");
		UUID uid=UUID.randomUUID();
		String saveName=uid.toString()+"_"+mf.getOriginalFilename();
		memberDTO.setPic(saveName);
		byte[] filedata;
		try {
			filedata = mf.getBytes();
			File f = new File(savePath,saveName);
			FileCopyUtils.copy(filedata,f);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


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
	@RequestMapping(value="/memberView")
	public String memberView(Model model,HttpServletRequest request){
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		if(memberDTO != null){
			try {
				model.addAttribute("memberView", attendManageService.memberView(memberDTO.getCode())); 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return "member/memberView";	
		}else{
			return "redirect:/";
		}

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
	public String memberLogout(HttpSession session,RedirectAttributes rd){
		MemberDTO memberDTO =null;
		try {
			memberDTO = (MemberDTO) session.getAttribute("member");
			attendService.checkOut(memberDTO);
			session.invalidate();
		} catch (Exception e) {
			rd.addFlashAttribute("message", "세션이 만료되었습니다.");
		}
		return "redirect:/";
	}

	//회원수정 form
	@RequestMapping(value="/memberMod",method=RequestMethod.GET)
	public String memberMod(Model model, @RequestParam String code){
		try {
			model.addAttribute("memberView", memberService.memberView(code)); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "member/memberMod";
	}
	//회원수정
    @RequestMapping(value="/memberMod",method=RequestMethod.POST)
    public String memberMod(MultipartHttpServletRequest multi,
          HttpServletRequest request,RedirectAttributes rd,HttpSession session){

       MemberDTO memberDTO=new MemberDTO();
       String phone="010-"+multi.getParameter("phone1")+"-"+multi.getParameter("phone2");
       memberDTO.setPhone("phone");
       memberDTO.setName(multi.getParameter("name"));
       memberDTO.setPw(multi.getParameter("pw"));
       memberDTO.setAddress1(multi.getParameter("address1"));
       memberDTO.setAddress2(multi.getParameter("address2"));
       memberDTO.setCode(multi.getParameter("code"));
       String code=memberDTO.getCode();

       String saveName="";
       int result =0;
       String message="";
       String savePath=session.getServletContext().getRealPath("resources/upload");
       MultipartFile mf=multi.getFile("pic");
       System.out.println(savePath);
       UUID uid=UUID.randomUUID();
       String imgName=mf.getOriginalFilename();
       if(imgName==""){
          imgName=null;
       }
       if(imgName!=null){
    
          File f2=new File(savePath+"/"+multi.getParameter("originalPic"));
          f2.delete();
          saveName=uid.toString()+"_"+mf.getOriginalFilename();
          memberDTO.setPic(saveName);
          byte[] filedata;
          try {
             filedata = mf.getBytes();
             File f = new File(savePath,saveName);
             FileCopyUtils.copy(filedata,f);
          } catch (IOException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }
       }else{
          saveName=multi.getParameter("originalPic");
          memberDTO.setPic(saveName);   
       }
       try {
          result =memberService.memberMod(memberDTO);
       } catch (Exception e) {
          // TODO Auto-generated catch block
          e.printStackTrace();
       }
       if(result>0){
          message="수정 성공";
          try {
             memberDTO=memberService.memberView(code);
          } catch (Exception e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }
          rd.addFlashAttribute("message",message);
          session.setAttribute("member", memberDTO);
       }else{
          message="수정 실패";
          rd.addFlashAttribute("message",message);
       }
       
       return "redirect:memberView?code="+code;
    }



	//회원탈퇴
	@RequestMapping(value="/memberDelete")
	public String memberDelete(MemberDTO memberDTO,Model model,HttpSession session,HttpServletRequest request){
		int result =0;
		String message="";
		List<MemberDTO> ar=null;
		int lastNum=20;
		try {
			lastNum=Integer.valueOf(request.getParameter("perPage"));
		} catch (Exception e) {
			lastNum=20;
		}

		try {
			attendService.memberDel(memberDTO);
			attendManageService.memberDel(memberDTO);
			result =memberService.memberDelete(memberDTO);
			ar= memberService.memberOriginList(lastNum);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			message="삭제 성공";
			model.addAttribute("memberList", ar);
		}else{
			message="삭제 실패";
			model.addAttribute("message", message);
			model.addAttribute("memberList", ar);
		}
		return "member/memberList";
	}
	//회원 리스트
	@RequestMapping(value="/memberOriginList")
	public String memberOriginList(Model model,HttpSession session, RedirectAttributes rd,HttpServletRequest request){
		MemberDTO m =null;
		try {
			m =(MemberDTO)session.getAttribute("member");			
		} catch (Exception e) {
			m = null;
		}
		if(m !=null){
			//사장, 인사팀
			if(m.getDepartment().equals("인사팀") && m.getPosition_Rank()<3 || m.getPosition_Rank()==1){
				List<MemberDTO> ar=null;
				int lastNum=20;
				try {
					lastNum=Integer.valueOf(request.getParameter("perPage"));
				} catch (Exception e) {
					lastNum=20;
				}
				try {
					ar= memberService.memberOriginList(lastNum);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				model.addAttribute("memberList", ar);
				return "member/memberList";
			}
			else
			{
				rd.addFlashAttribute("message", "잘못된 경로입니다");
				return "redirect:/";
			}			
		}else{
			rd.addFlashAttribute("message", "잘못된 경로입니다");
			return "redirect:/";
		}
	}
	@RequestMapping(value="/memberAjaxList")
	public String memberOriginAjaxList(Model model,HttpSession session, RedirectAttributes rd,HttpServletRequest request){
		this.memberOriginList(model, session, rd, request);
		return "member/memberAjaxList";
	}
	//회원 리스트(수정불가)
	@RequestMapping(value="/memberContactList")
	public String memberContactList(HttpServletRequest request,Model model,HttpSession session){
		MemberDTO m =null;
		try {
			m =(MemberDTO)session.getAttribute("member");			
		} catch (Exception e) {
			m = null;
		}
		String path = "redirect:/";
		if(m !=null){
			List<MemberDTO> ar=null;
			int lastNum=20;
			try {
				lastNum=Integer.valueOf(request.getParameter("perPage"));
			} catch (Exception e) {
				lastNum=20;
			}
			try {
				ar= memberService.memberContactList(lastNum);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.addAttribute("memberContact", ar);
			path ="member/memberContactList";
		}
		return path;
	}
	@RequestMapping(value="/memberContactAjaxList")
	public String memberContactAjaxList(HttpServletRequest request,Model model,HttpSession session){
		this.memberContactList(request, model, session);
		return "member/memberContactAjaxList";
	}

	//부서별 회원 리스트
	@RequestMapping(value="/memberDepartmentList")
	public String memberDepartmentList(MemberDTO memberDTO,Model model,HttpServletRequest request){
		List<MemberDTO> ar=null;
		int last=20;
		try {
			last=Integer.valueOf(request.getParameter("perPage"));
		} catch (Exception e) {
			last=20;
		}
		String lastNum = String.valueOf(last);
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("lastNum", lastNum);
		hm.put("department", memberDTO.getDepartment());
		
		try {
			ar =memberService.memberDepartmentList(hm);
			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("memberDepartList", ar);
		return "member/memberDepartList";
	}
	@RequestMapping(value="/memberDepartmentAjaxList")
	public String memberDepartmentAjaxList(MemberDTO memberDTO,Model model,HttpServletRequest request){
		this.memberDepartmentList(memberDTO, model, request);
		return "member/memberDepartAjaxList";
	}
	//부서별 회원 리스트(수정불가)		
	@RequestMapping(value="/memberContactDepartmentList")
	public String memberContactDepartmentList(HttpServletRequest request,MemberDTO memberDTO,Model model){
		List<MemberDTO> ar=null;
		int last=20;
		try {
			last=Integer.valueOf(request.getParameter("perPage"));
		} catch (Exception e) {
			last=20;
		}
		String lastNum = String.valueOf(last);
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("lastNum", lastNum);
		hm.put("department", memberDTO.getDepartment());
		try {
			ar =memberService.memberContactDepartmentList(hm);

					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					model.addAttribute("memberContactDepartList", ar);
					return "member/memberContactDepartList";
				}
	@RequestMapping(value="/memberContactDepartmentAjaxList")
	public String memberContactDepartmentAjaxList(HttpServletRequest request,MemberDTO memberDTO,Model model){
		this.memberContactDepartmentList(request, memberDTO, model);
		return "member/memberContactDepartAjaxList";
	}

	//부서이동
	@RequestMapping(value="/memberDepartmentMod", method=RequestMethod.POST)
	public String memberDepartmentMod(MemberDTO memberDTO,Model model, HttpServletRequest request){
		List<MemberDTO> ar=null;
		int lastNum=20;
		try {
			lastNum=Integer.valueOf(request.getParameter("perPage"));
		} catch (Exception e) {
			lastNum=20;
		}
		try {
			memberService.memberDepartmentMod(memberDTO);
			ar= memberService.memberOriginList(lastNum);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		model.addAttribute("memberList", ar);

		return "member/memberList";
	}

	//직급 변경
	@RequestMapping(value="/memberPositionMod",method=RequestMethod.POST)
	public String memberPositionMod(MemberDTO memberDTO,Model model, HttpServletRequest request){
		
		List<MemberDTO> ar=null;
		if(memberDTO.getPosition().equals("사장")){
			memberDTO.setPosition_Rank(1);
		}else if(memberDTO.getPosition().equals("팀장")){
			memberDTO.setPosition_Rank(2);
		}else if(memberDTO.getPosition().equals("차장")){
			memberDTO.setPosition_Rank(3);
		}else if(memberDTO.getPosition().equals("과장")){
			memberDTO.setPosition_Rank(4);
		}else if(memberDTO.getPosition().equals("대리")){
			memberDTO.setPosition_Rank(5);
		}else {
			memberDTO.setPosition_Rank(6);
		}
		int lastNum=20;
		try {
			lastNum=Integer.valueOf(request.getParameter("perPage"));
		} catch (Exception e) {
			lastNum=20;
		}
		try {
			memberService.memberPositonMod(memberDTO);
			ar= memberService.memberOriginList(lastNum);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		model.addAttribute("memberList", ar);

		return "member/memberList";
	}


	//id,pw찾기 form
	@RequestMapping(value="/memberFind")
	public String memberFind(){
		
		return "redirect:/";
	}

	//id 찾기
	@RequestMapping(value="/memberIdFind",method=RequestMethod.POST)
	public String memberIdFind(MemberDTO memberDTO,@RequestParam String year,@RequestParam String month,@RequestParam String day,RedirectAttributes rd,
			@RequestParam String phone1,@RequestParam String phone2,Model model){
		String birth=year+"년"+month+"월"+day+"일";
		memberDTO.setBirth(birth);
		String phone="010-"+phone1+"-"+phone2;
		memberDTO.setPhone(phone);
		String message="";
		try {
			memberDTO=memberService.memberIdFind(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(memberDTO !=null){
			message="아이디는[ "+memberDTO.getId()+" ]입니다";
			rd.addFlashAttribute("message", message);
		}else{
			message="개인정보를 다시 확인하세요";
			rd.addFlashAttribute("message", message);
		}
		return "redirect:/";
	}

	//id 찾기
	@RequestMapping(value="/memberPwFind",method=RequestMethod.POST)
	public String memberPwFind(MemberDTO memberDTO, @RequestParam String phone1,@RequestParam String phone2,
			@RequestParam String id_1,@RequestParam String id_2,
			RedirectAttributes rd, Model model ){
		String id=id_1+"@"+id_2;
		memberDTO.setId(id);
		String phone="010-"+phone1+"-"+phone2;
		memberDTO.setPhone(phone);
		String message="";
		try {
			memberDTO=memberService.memberPwFind(memberDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(memberDTO !=null){

			rd.addFlashAttribute("memberDTO",memberDTO);
			return "redirect:/email/send";

		}else{
			message="개인정보를 다시 확인하세요";
			rd.addFlashAttribute("message", message);
			return "redirect:/";
		}
	}
	//사원검색
	@RequestMapping(value="/memberHumanFind")
	public String memberHumanFind(@RequestParam String code,Model model,HttpServletRequest request){
		code="%"+code+"%";
		List<MemberDTO> ar =null;
		HashMap<String, String>hm=new HashMap<String, String>();
		int last=20;
		try {
			last=Integer.valueOf(request.getParameter("perPage"));
		} catch (Exception e) {
			last=20;
		}
		String lastNum = String.valueOf(last);
		hm.put("code", code);
		hm.put("lastNum", lastNum);
		
		try {
			ar= memberService.memberHumanFind(hm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("HumanFind", ar);
		return "member/memberHumanFind";
	}


		
		//사원검색(수정불가)
		@RequestMapping(value="/memberContactHumanFind")
		public String memberContactHumanFind(@RequestParam String code,Model model,HttpServletRequest request){
			code="%"+code+"%";
			List<MemberDTO> ar =null;
			HashMap<String, String>hm=new HashMap<String, String>();
			int last=20;
			try {
				last=Integer.valueOf(request.getParameter("perPage"));
			} catch (Exception e) {
				last=20;
			}
			String lastNum = String.valueOf(last);
			hm.put("code", code);
			hm.put("lastNum", lastNum);
			
			try {
				ar= memberService.memberContactHumanFind(hm);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("ContactHumanFind", ar);
			return "member/memberContactHumanFind";
		}
		@RequestMapping(value="/memberContactHumanFindAjax")
		public String memberContactHumanFindAjax(@RequestParam String code,Model model,HttpServletRequest request){
			this.memberContactHumanFind(code, model, request);
			return "member/memberContactHumanFindAjax";
		}




}
