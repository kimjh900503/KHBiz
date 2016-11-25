package com.khbiz.erp;

import java.util.Map;

import javax.activation.CommandMap;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.erp.draft.DraftDTO;
import com.erp.draft.DraftService;
import com.erp.draft.Draft_1DTO;
import com.khbiz.member.MemberDTO;

@Controller
@RequestMapping(value = "/draft")
public class DraftController {
	
	@Autowired
	private DraftService dService;
	
	@RequestMapping(value="draftForm1")
	public void go_Form1(){}
	
	@RequestMapping(value="draftForm2")
	public void go_Form2(){}
	
	@RequestMapping(value="draftForm3")
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
	
	@RequestMapping(value="/draftWrite", method = RequestMethod.POST) 
	public String write (Model model, DraftDTO draftDTO, Draft_1DTO draft_1dto) throws Exception{	
		return dService.draftWrite(draftDTO, model, draft_1dto);
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
	
	
	/*@RequestMapping(value="/draftWrite", method = RequestMethod.POST) 
	public String d_1write (Model model, DraftDTO draftDTO, Draft_1DTO draft_1dto) throws Exception{	
		return dService.draft_1Write(draftDTO, draft_1dto, model);
	}*/
	
}
