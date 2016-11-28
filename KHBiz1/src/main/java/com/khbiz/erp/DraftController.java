package com.khbiz.erp;

import java.util.Calendar;
import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erp.draft.ApproveDTO;
import com.erp.draft.DraftDTO;
import com.erp.draft.DraftService;
import com.erp.draft.ExpenseDTO;
import com.erp.draft.GianDTO;
import com.erp.draft.LeaveDTO;
import com.khbiz.member.MemberDTO;

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
	public void draftMain(){}

	@RequestMapping(value="/draftWriteForm", method=RequestMethod.GET)
	public void draftWriteForm(){}
	
	//임시보관함이동
	@RequestMapping(value="/draftOutBox", method = RequestMethod.GET)
	public String draftList(Model model) throws Exception{
		String path = dService.outboxList(model);
		return path;
	}
	//상신함이동
	@RequestMapping(value="/draftReportBox", method = RequestMethod.GET)
	public String reportboxList(Model model) throws Exception{
		String path = dService.reportboxList(model);
		return path;
	}
	
	//approverList
	@RequestMapping(value="/approverList", method=RequestMethod.GET)
	public String approverList(Model model) throws Exception{
		String path = dService.approverList(model);
		return path;
	}
	//write1. gian
	@RequestMapping(value="/gian", method = {RequestMethod.GET, RequestMethod.POST})
	public String gian (DraftDTO draftDTO, RedirectAttributes rd,ApproveDTO approveDTO,ExpenseDTO expenseDTO,LeaveDTO leaveDTO,GianDTO gianDTO) throws Exception{	
		System.out.println("들어와");
		return dService.gianWrite(draftDTO, rd, approveDTO, expenseDTO, leaveDTO, gianDTO);
	}
	//write2. expense
	@RequestMapping(value="/expense", method =  {RequestMethod.GET, RequestMethod.POST}) 
	public String expense (DraftDTO draftDTO, RedirectAttributes rd,ApproveDTO approveDTO,ExpenseDTO expenseDTO,LeaveDTO leaveDTO,GianDTO gianDTO) throws Exception{	
		return dService.expenseWrite(draftDTO, rd, approveDTO, expenseDTO, leaveDTO, gianDTO);
	}
	//write3. leave
	@RequestMapping(value="/leave", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String leave (DraftDTO draftDTO, RedirectAttributes rd,ApproveDTO approveDTO,ExpenseDTO expenseDTO,LeaveDTO leaveDTO,GianDTO gianDTO) throws Exception{	
		return dService.leaveWrite(draftDTO, rd, approveDTO, expenseDTO, leaveDTO, gianDTO);
	}
	
	//outboxView Modal
	@RequestMapping(value="/outboxView", method=RequestMethod.GET)
	public String testForm(HttpServletRequest request,@RequestParam Map<String, Object> param,  @RequestParam int d_num, Model model) throws Exception {
		String path = dService.outboxView(model, d_num);
	    return path;
	}
	//reportboxView Modal
	@RequestMapping(value="/reportboxView", method=RequestMethod.GET)
	public String reportboxView(HttpServletRequest request,@RequestParam Map<String, Object> param,  @RequestParam int d_num, Model model) throws Exception {
		String path = dService.reportboxView(model, d_num);
	    return path;
	}
	//outboxDelete
	@RequestMapping(value="/outboxDelete")
	public String outboxDelete(Model model, @RequestParam int d_num){
		String path ="";
		try {
			path = dService.outboxDelete(model, d_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return path;
	}
	//reportboxDelete
	@RequestMapping(value="/reportboxDelete")
	public String reportboxDelete(Model model, @RequestParam int d_num){
		String path ="";
		try {
			path = dService.reportboxDelete(model, d_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return path;
	}
	//outboxReport
	@RequestMapping(value="/outboxReport")
	public String outboxReport(Model model, @RequestParam int d_num){
		String path ="";
		try {
			path = dService.outboxReport(model, d_num);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return path;
	}
	
	@RequestMapping(value="/test")
	public String test(){
		return "redirect:/";
	}
	
	//fileUpload
	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	 public String fileUpload(Model model, MultipartRequest multipartRequest) throws Exception{
	  MultipartFile file = multipartRequest.getFile("upload");   //뷰에서 form으로 넘어올 때 name에 적어준 이름입니다.
	  Calendar cal = Calendar.getInstance();
	  String fileName = file.getOriginalFilename();
	  String fileType = fileName.substring(fileName.lastIndexOf("."), fileName.length());
	  String replaceName = cal.getTimeInMillis() + fileType;  //파일 이름의 중복을 막기 위해서 이름을 재설정합니다.
	  
	  String path = "/upload"; 
	  dService.fileUpload(file, path, replaceName);
	  return "redirect:/";
	 }
	
	/*@RequestMapping(value="/draftWrite", method = RequestMethod.POST) 
	public String d_1write (Model model, DraftDTO draftDTO, Draft_1DTO draft_1dto) throws Exception{	
		return dService.draft_1Write(draftDTO, draft_1dto, model);
	}*/
	
}
