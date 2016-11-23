package com.erp.draft;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Service
public class DraftService {

	@Inject
	private DraftDAO draftDAO;

	//sheet_code 부여 
	private void sheet_code(DraftDTO draftDTO,Draft_1DTO draft_1dto) throws Exception{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddkkmmss");
		String sheet_kind = draftDTO.getSheet_kind();
		String code = "";
		if(sheet_kind.equals("기안문")){
			code="apd_" +sdf.format(new Date());
		}else if(sheet_kind.equals("지출서")){
			code="exp_" +sdf.format(new Date());;
		}else if(sheet_kind.equals("휴가서")){
			code="leave_" +sdf.format(new Date());
		}else {
			String sheet_code=null;
		}
		draftDTO.setSheet_code(code);
		draft_1dto.setSheet_code(code);
	}
	

	
	//write
	public String draftWrite(DraftDTO draftDTO, Model model,Draft_1DTO draft_1dto) throws Exception{
		this.sheet_code(draftDTO, draft_1dto);
		int result = draftDAO.draftWrite(draftDTO);
		String message = "";
		String path = "";
		if (result>0){
			message = "성공적으로 상신하였습니다.";
			path ="redirect:/";
		}else {
			message = "상신을 실패하였습니다.";
			path = "redirect:/";
		} 
		model.addAttribute("message", message);
		return path;
	}

/*	//draft_1 Write
	public String draft_1Write(DraftDTO draftDTO, Draft_1DTO draft_1dto, Model model) throws Exception{
		int result = draftDAO.draft_1Write(draft_1dto);
		String message = "";
		String path = "";
		if (result>0){
			message = "성공적으로 상신하였습니다.";
			path ="redirect:/";
		}else {
			message = "상신을 실패하였습니다.";
			path = "redirect:/";
		} 
		model.addAttribute("message", message);
		return path;		
	}*/
	
	
	//outbox(임시보관함) list
	public String outboxList(Model model) throws Exception{
		List<DraftDTO> ar = draftDAO.outboxList();
		model.addAttribute("outboxList", ar);
		return "draft/draftOutBoxList";
	}

	//reportbox(상신함) list
	public String reportboxList(Model model) throws Exception{
		List<DraftDTO> ar = draftDAO.reportboxList();
		model.addAttribute("reportboxList", ar);
		return "draft/draftReportBox";
	}
	

}
