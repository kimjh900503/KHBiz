package com.khbiz.erp;

import javax.activation.CommandMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.erp.draft.DraftDTO;
import com.erp.draft.DraftService;
import com.erp.draft.Draft_1DTO;

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
	
	@RequestMapping(value="/draftWrite", method = RequestMethod.POST) 
	public String write (Model model, DraftDTO draftDTO, Draft_1DTO draft_1dto) throws Exception{	
		return dService.draftWrite(draftDTO, model, draft_1dto);
	}
	
	/*@RequestMapping(value="/draftWrite", method = RequestMethod.POST) 
	public String d_1write (Model model, DraftDTO draftDTO, Draft_1DTO draft_1dto) throws Exception{	
		return dService.draft_1Write(draftDTO, draft_1dto, model);
	}*/
	
}
