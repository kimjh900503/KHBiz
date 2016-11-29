package com.erp.draft;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.khbiz.member.MemberDTO;


@Service
public class DraftService {

	@Inject
	private DraftDAO draftDAO;

	//sheet_code 부여 
	private void sheet_code(DraftDTO draftDTO, ApproveDTO approveDTO,ExpenseDTO expenseDTO,LeaveDTO leaveDTO,GianDTO gianDTO) throws Exception{
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
		approveDTO.setSheet_code(code);
		expenseDTO.setSheet_code(code);
		leaveDTO.setSheet_code(code);
		gianDTO.setSheet_code(code);
		
	}
	//gian_write
	public String gianWrite(DraftDTO draftDTO, RedirectAttributes rd,ApproveDTO approveDTO,ExpenseDTO expenseDTO,LeaveDTO leaveDTO,GianDTO gianDTO){
		
		String kind = draftDTO.getKind();
		
		try {
			this.sheet_code(draftDTO, approveDTO, expenseDTO, leaveDTO, gianDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int result = draftDAO.draftWrite(draftDTO);			
	
		int result2 = draftDAO.gian(gianDTO);
		int result3 = draftDAO.approve(approveDTO);
		
		String message = "";
		String path ="draft/draft_main";
		if (result>0 && result2>0&&result3>0){
			message = "성공적으로 상신하였습니다.";
		}else {
			message = "상신을 실패하였습니다.";
		} 
		rd.addFlashAttribute("message", message);
		return path;
	}
	
	//expense
	public String expenseWrite(DraftDTO draftDTO, RedirectAttributes rd,ApproveDTO approveDTO,ExpenseDTO expenseDTO,LeaveDTO leaveDTO,GianDTO gianDTO){

		String kind = draftDTO.getKind();
		try {
			this.sheet_code(draftDTO, approveDTO, expenseDTO, leaveDTO, gianDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
			int result = draftDAO.draftWrite(draftDTO);			
		
		int result2 = draftDAO.expense(expenseDTO);
		int result3 = draftDAO.approve(approveDTO);
		
		String message = "";
		String path ="draft/draft_main";
		if (result>0 && result2>0&&result3>0){
			message = "성공적으로 상신하였습니다.";
			
		}else {
			message = "상신을 실패하였습니다.";
			
		} 
		rd.addFlashAttribute("message", message);
		return path;
	}
	
	//leave
	public String leaveWrite(DraftDTO draftDTO,RedirectAttributes rd,ApproveDTO approveDTO,ExpenseDTO expenseDTO,LeaveDTO leaveDTO,GianDTO gianDTO){

		String kind = draftDTO.getKind();

		try {
			this.sheet_code(draftDTO, approveDTO, expenseDTO, leaveDTO, gianDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		int result = draftDAO.draftWrite(draftDTO);			
		int result2 = draftDAO.leave(leaveDTO);
		int result3 = draftDAO.approve(approveDTO);
		
		String message = "";
		String path ="draft/draft_main";
		if (result>0 && result2>0&&result3>0){
			message = "성공적으로 상신하였습니다.";
			
		}else {
			message = "상신을 실패하였습니다.";
			
		} 
		rd.addFlashAttribute("message", message);
		
		return path;
	}
	
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
		
		/*받은-결재대기 LIst*/
		public String getWaitList(String code2, Model model)throws Exception{
			List<GetListDTO> ar =  draftDAO.getWaitList(code2);	
			model.addAttribute("getWaitList",ar);
			return "draft/getWaitList";
		}
		
		/*받은-결재완료 LIst*/
		public String getFinList(String code2, Model model)throws Exception{
			List<GetListDTO> ar =  draftDAO.getFinList(code2);	
			model.addAttribute("getFinList",ar);
			return "draft/getFinList";
		}
	
		/*받은- 반려함 LIst*/
		public String getBackList(String code2, Model model)throws Exception{
			List<GetListDTO> ar =  draftDAO.getBackList(code2);	
			model.addAttribute("getBackList",ar);
			return "draft/getBackList";
		}
		
		//getWaitView
		public String getWaitView(Model model, int d_num)throws Exception{
			GetListDTO getListDTO = draftDAO.getWaitView(d_num);
			model.addAttribute("getWaitView", getListDTO);
			return "draft/getWaitView";
		}
		//getFinView
		public String getFinView(Model model, int d_num)throws Exception{
			GetListDTO getListDTO = draftDAO.getFinView(d_num);
			model.addAttribute("getFinView", getListDTO);
			return "draft/getFinView";
		}
		
		//getBackView
		public String getBackView(Model model, int d_num)throws Exception{
			GetListDTO getListDTO = draftDAO.getBackView(d_num);
			model.addAttribute("getBackView", getListDTO);
			return "draft/getBackView";
		}
		
		
		
		
		
		
		
		
		
		
/*	//getAllList 받은 결재함 전체 list 페이징한거
		public void getAllList(DraftDTO draftDTO, int curPage, int perPage,Model model) throws Exception {
		// TODO Auto-generated method stub
		int totalCount = draftDAO.getAllCount();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCurPage(curPage);
		pageMaker.setPerPage(perPage);
		pageMaker.makeRow();
		pageMaker.makePage(totalCount);
		
		model.addAttribute("boardList",draftDAO.getAllList(draftDTO, pageMaker));
		model.addAttribute("pageMaker", pageMaker);
	}*/

	
	
	
	
	
	
	
	
	
	
	
	
	//file upload
	public static void fileUpload(MultipartFile fileData, String path, String fileName) throws Exception {
		  String originalFileName = fileData.getOriginalFilename();
		  String contentType = fileData.getContentType();
		  long fileSize = fileData.getSize();
		/*
		  System.out.println("file Info");
		  System.out.println("fileName " + fileName);
		  System.out.println("originalFileName :" + originalFileName);
		  System.out.println("contentType :" + contentType);
		  System.out.println("fileSize :" + fileSize);
		*/
		  InputStream is = null;
		  OutputStream out = null;
		  try {
		   if (fileSize > 0) {
		    is = fileData.getInputStream();
		    File realUploadDir = new File(path);
		    if (!realUploadDir.exists()) {             //경로에 폴더가 존재하지 않으면 생성합니다.
		     realUploadDir.mkdirs();
		    }
		    out = new FileOutputStream(path +"/"+ fileName);
		    FileCopyUtils.copy(is, out);            //InputStream에서 온 파일을 outputStream으로 복사
		   }else{
		    new Exception("잘못된 파일을 업로드 하셨습니다.");
		   }
		  } catch (Exception e) {
		   e.printStackTrace();
		   new Exception("파일 업로드에 실패하였습니다.");
		  }finally{
		   if(out != null){out.close();}
		   if(is != null){is.close();}
		  }
		 }

}
