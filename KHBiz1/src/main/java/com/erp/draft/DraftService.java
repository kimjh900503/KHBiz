package com.erp.draft;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.khbiz.member.MemberDTO;


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
	//outboxView
	public String outboxView(Model model, int d_num)throws Exception{
		DraftDTO draftDTO = draftDAO.outboxView(d_num);
		System.out.println(draftDTO.getD_num());
		model.addAttribute("outboxView", draftDTO);
		return "draft/outboxView";
	}
	//reportboxView
	public String reportboxView(Model model, int d_num)throws Exception{
		DraftDTO draftDTO = draftDAO.reportboxView(d_num);
		model.addAttribute("reportboxView", draftDTO);
		return "draft/reportboxView";
	}

	//approverList
	public String approverList(Model model) throws Exception{
		List<MemberDTO> ar = draftDAO.approverList();
		System.out.println(ar.get(0).getCode());
		model.addAttribute("approverList", ar);
		return "draft/approverList";
	}
	
	//outboxDelete
	public String outboxDelete(Model model, int d_num) throws Exception{
		int result = draftDAO.outboxDelete(d_num);
		String message = "";
		String path = "";
		if (result>0){
			message = "성공적으로 삭제하였습니다.";
			path ="redirect:/";
		}else {
			message = "삭제를 실패하였습니다.";
			path = "redirect:/";
		} 
		model.addAttribute("message", message);
		return path;		
		}
	//reportboxDelete
	public String reportboxDelete(Model model, int d_num) throws Exception{
		int result = draftDAO.reportboxDelete(d_num);
		String message = "";
		String path = "";
		if (result>0){
			message = "성공적으로 삭제하였습니다.";
			path ="redirect:/";
		}else {
			message = "삭제를 실패하였습니다.";
			path = "redirect:/";
		} 
		model.addAttribute("message", message);
		return path;		
		}
	//outboxReport
	public String outboxReport(Model model, int d_num) throws Exception{
		int result = draftDAO.outboxReport(d_num);
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
}
