package com.khbiz.erp;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.activation.CommandMap;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileUpload;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erp.draft.ApproveDTO;
import com.erp.draft.DraftDTO;
import com.erp.draft.DraftService;
import com.erp.draft.ExpenseDTO;
import com.erp.draft.FilesDTO;
import com.erp.draft.GetListDTO;
import com.erp.draft.GianDTO;
import com.erp.draft.LeaveDTO;
import com.khbiz.member.MemberDTO;

import oracle.net.aso.a;
import oracle.net.aso.f;

@Controller
@RequestMapping(value = "/draft")
public class DraftController {
	
	@Autowired
	private DraftService dService;
	
	@RequestMapping(value="gianForm")
	public void go_Form1(){}
	
	@RequestMapping(value="expenseForm")
	public void go_Form2(){}
	
	@RequestMapping(value="leaveForm")
	public void go_Form3(){}
	
	@RequestMapping(value="approverList")
	public void ap_list(){}
	
	@RequestMapping(value="/draft_main", method =RequestMethod.GET )
	public String draftMain(HttpSession session,Model model){
		MemberDTO memberDTO = null;
		String path = "redirect:/";
		try {
			memberDTO = (MemberDTO)session.getAttribute("member");			
			dService.reportWaitBox10(memberDTO.getCode(), model);
			dService.reportFinBox10(memberDTO.getCode(), model);
			dService.reportBackBox10(memberDTO.getCode(), model);
		} catch (Exception e) {
			memberDTO = null;
		}
		if(memberDTO !=null){
			path = "draft/draft_main";
		}
		return path;
	}

	@RequestMapping(value="/draftWriteForm", method=RequestMethod.GET)
	public String draftWriteForm(HttpSession session){
		String path="redirect:/";
		MemberDTO memberDTO = null;
		try {
			memberDTO = (MemberDTO)session.getAttribute("member");
		} catch (Exception e) {
			memberDTO = null;
		}
		if(memberDTO !=null){
			path = "draft/draftWriteForm";
		}
		
		return path;
	}
	
	@RequestMapping(value="/draft_main2",method = RequestMethod.GET)
	public String draftMain2(HttpSession session,Model model){
		MemberDTO memberDTO = null;
		String path = "redirect:/";
		try {
			memberDTO = (MemberDTO)session.getAttribute("member");			
			dService.getWaitBox10(memberDTO.getCode(), model);
		} catch (Exception e) {
			memberDTO = null;
		}
		try {
			dService.getFinBox10(memberDTO.getCode(), model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			dService.getBackBox10(memberDTO.getCode(), model);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(memberDTO !=null){
			path = "draft/draft_main2";
		}
		return path;
	}
	
	//write1. gian
		@RequestMapping(value="/gian", method = {RequestMethod.GET, RequestMethod.POST})
		public String gian (FilesDTO filesDTO,DraftDTO draftDTO, RedirectAttributes rd,String code, String [] code2,String [] due_per_date,String [] ranking,GianDTO gianDTO,MultipartHttpServletRequest request) throws Exception{	
			ArrayList<ApproveDTO> ar = new ArrayList<ApproveDTO>();
			
			for(int i=0;i<code2.length;i++){
				
				ApproveDTO approveDTO = new ApproveDTO();
				approveDTO.setCode2(code2[i]);
				approveDTO.setDue_per_date(due_per_date[i]);
				approveDTO.setRanking(ranking[i]);
				approveDTO.setCode(code);
				ar.add(approveDTO);
			}
			return dService.gianWrite(draftDTO, rd, ar, gianDTO, request);

		}
		//write2. expense
		@RequestMapping(value="/expense", method =  {RequestMethod.GET, RequestMethod.POST}) 
		public String expense (FilesDTO filesDTO,DraftDTO draftDTO, RedirectAttributes rd,String code, String [] code2,String [] due_per_date,String [] ranking,ExpenseDTO expenseDTO,MultipartHttpServletRequest request) throws Exception{	
	ArrayList<ApproveDTO> ar = new ArrayList<ApproveDTO>();
			
			for(int i=0;i<code2.length;i++){
				ApproveDTO approveDTO = new ApproveDTO();
				approveDTO.setCode2(code2[i]);
				approveDTO.setDue_per_date(due_per_date[i]);
				approveDTO.setRanking(ranking[i]);
				approveDTO.setCode(code);
				ar.add(approveDTO);
			}
			return dService.expenseWrite(draftDTO, rd, ar, expenseDTO, request);
		}
		
		//write3. leave
		@RequestMapping(value="/leave", method = {RequestMethod.GET, RequestMethod.POST}) 
		public String leave (FilesDTO filesDTO,DraftDTO draftDTO, RedirectAttributes rd,String code, String [] code2,String [] due_per_date,String [] ranking,LeaveDTO leaveDTO,MultipartHttpServletRequest request) throws Exception{	
			ArrayList<ApproveDTO> ar = new ArrayList<ApproveDTO>();
			
			for(int i=0;i<code2.length;i++){
				ApproveDTO approveDTO = new ApproveDTO();
				approveDTO.setCode2(code2[i]);
				approveDTO.setDue_per_date(due_per_date[i]);
				approveDTO.setRanking(ranking[i]);
				approveDTO.setCode(code);
				ar.add(approveDTO);
			}
			return dService.leaveWrite(draftDTO, rd, ar, leaveDTO, request);
		}
		
		
	//****************전체 List **********************************
	//1. 보낸 대기 리스트
	@RequestMapping(value="/reportWaitList", method = RequestMethod.GET)
	public String reportWaitList(Model model, String code,HttpSession session) throws Exception{
		String path="redirect:/";
		MemberDTO memberDTO = null;
		try {
			memberDTO = (MemberDTO)session.getAttribute("member");
			path = dService.reportWaitList(model,memberDTO.getCode());
		} catch (Exception e) {
			memberDTO = null;
		}
		
		return path;
	}
	
	//2. 보낸 완료 리스트
	@RequestMapping(value="/reportFinList", method = RequestMethod.GET)
	public String reportFinList(Model model, String code,HttpSession session) throws Exception{
		String path="redirect:/";
		MemberDTO memberDTO = null;
		try {
			memberDTO = (MemberDTO)session.getAttribute("member");	
			path = dService.reportFinList(model,memberDTO.getCode());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return path;
	}
	
	//3. 보낸 반려 리스트 
	@RequestMapping(value="/reportBackList", method = RequestMethod.GET)
	public String reportBackList(Model model, String code,HttpSession session) throws Exception{
		String path="redirect:/";
		MemberDTO memberDTO = null;
		try {
			memberDTO = (MemberDTO)session.getAttribute("member");
			path = dService.reportBackList(model,memberDTO.getCode());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return path;
	}

	//받은 1. getWaitList
		@RequestMapping(value="/getWaitList")
		public String getWaitList( Model model, String code2,HttpSession session){
			String path="redirect:/";
			MemberDTO memberDTO = null;
			try {
				memberDTO = (MemberDTO)session.getAttribute("member");
				path =dService.getWaitList(memberDTO.getCode(), model);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return path;
		}

		
		//받은 2. getFinList
			@RequestMapping(value="/getFinList")
			public String getFinList( Model model, String code2,HttpSession session){
				String path="redirect:/";
				MemberDTO memberDTO = null;
				try {
					memberDTO = (MemberDTO)session.getAttribute("member");
					path =dService.getFinList(memberDTO.getCode(), model);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return path;
			}
			
			//받은 3. getBackList
			@RequestMapping(value="/getBackList")
			public String getBackList( Model model, String code2,HttpSession session){
				String path="redirect:/";
				MemberDTO memberDTO = null;
				try {
					memberDTO = (MemberDTO)session.getAttribute("member");
					path =dService.getBackList(memberDTO.getCode(), model);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return path;
			}
			
	//******************10개씩 띄우는 리스트 *******************

	//보낸1. 결재대기 reportWaitBox10
	@RequestMapping(value="/reportWaitBox10" ,method=RequestMethod.GET)
	public String reportbox7(@RequestParam String code, Model model)throws Exception{
		return dService.reportWaitBox10(code, model);
	}

	//보낸2. 결완 reportFinBox10
	@RequestMapping(value="/reportFinBox10" ,method=RequestMethod.GET)
	public String reportFinBox10(@RequestParam String code, Model model)throws Exception{
		return dService.reportFinBox10(code, model);
	}
	
	//보낸3. 반려함 reportBackBox10		
	@RequestMapping(value="/reportBackBox10" ,method=RequestMethod.GET)
	public String reportBackBox10(@RequestParam String code, Model model)throws Exception{
		return dService.reportBackBox10(code, model);
	}
	
	//받은1. 결재대기 getWaitBox10
	@RequestMapping(value="/getWaitBox10",method=RequestMethod.GET)
	public String getWaitBox10(@RequestParam String code2,Model model) throws Exception{
		return dService.getWaitBox10(code2, model);
	}
	//받은2. 결재완료 getFinBox10
	@RequestMapping(value="/getFinBox10",method=RequestMethod.GET)
	public String getFinBox10(@RequestParam String code2,Model model,HttpServletRequest request) throws Exception{
		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		return dService.getFinBox10(code2, model);
	}
	
	//받은3. 반려 getBackBox10
	@RequestMapping(value="/getBackBox10",method=RequestMethod.GET)
	public String getBackBox10(@RequestParam String code2,Model model) throws Exception{
		return dService.getBackBox10(code2, model);
	}
	
	//********* VIEW*************
	//1. 대기 view Modal reportWaitView 	Modal
		@RequestMapping(value="/reportWaitView", method=RequestMethod.GET)
		public String reportWaitView(HttpServletRequest request,@RequestParam Map<String, Object> param,  @RequestParam int d_num, Model model) throws Exception {
			String path = dService.reportWaitView(model, d_num);
		    return path;
		}
	
	//2. 완료 reportFinView 	Modal
		@RequestMapping(value="/reportFinView", method=RequestMethod.GET)
		public String reportFinView(HttpServletRequest request,@RequestParam Map<String, Object> param,  @RequestParam int d_num, Model model) throws Exception {
			String path = dService.reportFinView(model, d_num);
		    return path;
		}
	//3.  반려 reportBackView 	Modal
		@RequestMapping(value="/reportBackView", method=RequestMethod.GET)
		public String reportBackView(HttpServletRequest request,@RequestParam Map<String, Object> param,  @RequestParam int d_num, Model model) throws Exception {
			String path = dService.reportBackView(model, d_num);
		    return path;
		}
		
	//approverList
	@RequestMapping(value="/approverList", method=RequestMethod.GET)
	public String approverList(Model model) throws Exception{
		String path = dService.approverList(model);
		return path;
	}
	
	
	
	//reportboxDelete
	@RequestMapping(value="/delete")
	public String reportboxDelete(RedirectAttributes ra, @RequestParam int d_num){
		int result=0;
		try {
			result = dService.delete(ra, d_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String message = "";
		String path = "";
		if (result>0){
			message = "성공적으로 삭제하였습니다.";
			path="redirect:/draft/draft_main";
		}else {
			message = "삭제를 실패하였습니다.";
			path="redirect:/draft/draft_main";
		}
		ra.addFlashAttribute("message", message);		
		return path;
	}
	

	
		
		
		//getWaitView Modal
		@RequestMapping(value="/getWaitView", method=RequestMethod.GET)
		public String getWaitView(HttpServletRequest request, @RequestParam int d_num, Model model)throws Exception{
			System.out.println("num : "+d_num);
			MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
			String path= dService.getWaitView(model, d_num,memberDTO.getCode());
		    return path;
		}
	
		//getFinView
		@RequestMapping(value="/getFinView", method=RequestMethod.GET)
		public String getFinView(HttpServletRequest request, @RequestParam int d_num, Model model)throws Exception{
			MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
			String path= dService.getFinView(model, d_num,memberDTO.getCode());
		    return path;
		}
		
		//getBackView
		@RequestMapping(value="/getBackView", method=RequestMethod.GET)
		public String getBackView(HttpServletRequest request, @RequestParam int d_num, Model model)throws Exception{
			MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
			String path= dService.getBackView(model, d_num,memberDTO.getCode());
		    return path;
		}
	
		//getBack Action
		@RequestMapping(value="/back", method=RequestMethod.GET)
		public String back(@RequestParam String code2, @RequestParam String sheet_code, RedirectAttributes ra,HttpServletRequest request) throws Exception{
			MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
			return dService.back(ra, code2, sheet_code);
		}
		
		//getApproval Action
		@RequestMapping(value="/approval")
		public String approval(@RequestParam String code2, @RequestParam String sheet_code, RedirectAttributes ra,HttpServletRequest request,Model model) throws Exception{
			MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
			String path = dService.approval(ra, code2, sheet_code);
			List<GetListDTO> getDueList = null;
			List<DraftDTO> reportDueList = null;
			try {
				getDueList = dService.dueTime(memberDTO.getCode(), model);
				reportDueList = dService.dueTimeSend(memberDTO.getCode(), model);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.getSession().setAttribute("getDueList", getDueList);
			request.getSession().setAttribute("reportDueList", reportDueList);
			return path;
		}
		
		//callGian
		@RequestMapping(value="/callGian")
		public String callGian(@RequestParam String sheet_code, Model model)throws Exception{
			return dService.callGian(model, sheet_code);
		}
		
		//callExpense
		@RequestMapping(value="/callExpense")
		public String callExpense(@RequestParam String sheet_code, Model model)throws Exception{
			return dService.callExpense(model, sheet_code);
		}
		
		//callLeave
		@RequestMapping(value="/callLeave")
		public String callLeave(@RequestParam String sheet_code, Model model)throws Exception{
			return dService.callLeave(model, sheet_code);
		}
		
		//callFile
		@RequestMapping(value="/callFile")
		public String callFile(@RequestParam String sheet_code, Model model) throws Exception{
			return dService.callFile(model, sheet_code);
		}
	
		//********************************************************************************
		@RequestMapping(value="/downForm")
		public void downForm(){};
		
		 @RequestMapping("down")
	     public String down (String fileName , Model model , HttpSession session){
	           						
	           String path= "C:/Users/안지/Desktop/1206_16시/KHBiz/src/main/webapp/upload";
	           File f = new File( path, fileName);
	           System. out.println( "controller");
	            model.addAttribute( "downloadFile", f);
	            return "download";
	            /*return new ModelAndView("download", "downloadFile", f);*/
	     }
		 
		 
		//***********************************************************************************
	
		 //검색1
		 
		 @RequestMapping(value="/reportWaitSearch",method = RequestMethod.POST)
		 public String reportWaitSearch(Model model,  @RequestParam String search,HttpServletRequest request)throws Exception{
			 System.out.println("으악");
		  		MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		  		dService.reportWaitSearch(model, memberDTO.getCode(), search);
		  		return "draft/reportWaitSearch";
		 }
			
	  	//검색2
		 @RequestMapping(value="/reportFinSearch",method = RequestMethod.POST)
		 public String reportFinSearch(Model model,  @RequestParam String search,HttpServletRequest request)throws Exception{
				MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		  		dService.reportFinSearch(model, memberDTO.getCode(), search);
		  		return "draft/reportFinSearch";
		 }
			
	  	//검색3 reportBackSearch
		 @RequestMapping(value="/reportBackSearch",method = RequestMethod.POST)
		 public String reportBackSearch(Model model,  @RequestParam String search,HttpServletRequest request)throws Exception{
			 	MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		  		dService.reportBackSearch(model, memberDTO.getCode(), search);
		  		return "draft/reportBackSearch";
		 }
		 
	  	//검색4 getWaitSearch
		 @RequestMapping(value="/getWaitSearch",method = RequestMethod.POST)
		 public String getWaitSearch(Model model,  @RequestParam String search,HttpServletRequest request)throws Exception{
			 	MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		  		dService.getWaitSearch(model, memberDTO.getCode(), search);
		  		return "draft/getWaitSearch";
		 }
	  	//검색5 getFinSearch
		 @RequestMapping(value="/getFinSearch",method = RequestMethod.POST)
		 public String getFinSearch(Model model,  @RequestParam String search,HttpServletRequest request)throws Exception{
			 	MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		  		dService.getFinSearch(model, memberDTO.getCode(), search);
		  		return "draft/getFinSearch";
		 }
	  	//검색6 getBackSearch
		 @RequestMapping(value="/getBackSearch",method = RequestMethod.POST)
		 public String getBackSearch(Model model,  @RequestParam String search,HttpServletRequest request)throws Exception{
			 	MemberDTO memberDTO = (MemberDTO) request.getSession().getAttribute("member");
		  		dService.getBackSearch(model, memberDTO.getCode(), search);
		  		return "draft/getBackSearch";
		 }
		 

}
