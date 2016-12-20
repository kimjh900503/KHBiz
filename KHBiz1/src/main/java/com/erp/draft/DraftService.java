package com.erp.draft;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.khbiz.member.MemberDTO;
import com.khbiz.schedule.ScheduleDAO;


@Service
public class DraftService {

	@Inject
	private DraftDAO draftDAO;
	@Inject
	private ScheduleDAO scheduleDAO;
	//sheet_code 부여 
	private String sheet_code(DraftDTO draftDTO) throws Exception{
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
		FilesDTO filesDTO= new FilesDTO();
		ApproveDTO approveDTO = new ApproveDTO();
		ExpenseDTO expenseDTO = new ExpenseDTO();
		LeaveDTO leaveDTO = new LeaveDTO();
		GianDTO gianDTO = new GianDTO();
		
		filesDTO.setSheet_code(code);
		draftDTO.setSheet_code(code);
		approveDTO.setSheet_code(code);
		expenseDTO.setSheet_code(code);
		leaveDTO.setSheet_code(code);
		gianDTO.setSheet_code(code);
		
		return code;
	}
	//gian_write
	public String gianWrite(DraftDTO draftDTO, RedirectAttributes rd,ArrayList<ApproveDTO> approveDTO,GianDTO gianDTO,MultipartHttpServletRequest request){
		HttpSession session = request.getSession();		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String code = memberDTO.getCode();
		
		String savePath = "C:/Users/안지/Desktop/1206_16시/KHBiz/src/main/webapp/upload";
		List<MultipartFile> mf = request.getFiles("files");
		String sheet_code="";
		try {
			sheet_code = this.sheet_code(draftDTO);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		for(int i =0;i<mf.size();i++){
		UUID uid = UUID.randomUUID();
		String originalName = mf.get(i).getOriginalFilename(); // 올라올 때 이름 내가 올린 이름 
		String saveName = uid.toString()+"_"+mf.get(i).getOriginalFilename(); // 중복 x 저장이름  
		
		try {
		byte [] fileData = mf.get(i).getBytes();
			FilesDTO filesDTO = new FilesDTO();
			File fi = new File(savePath,saveName);
			
			FileCopyUtils.copy(fileData,fi);
			this.sheet_code(draftDTO);	
			filesDTO.setFileName(saveName);
			filesDTO.setOriginalFileName(originalName);
			filesDTO.setSheet_code(sheet_code);
			filesDTO.setCode(code);
			int result4 =	draftDAO.fileUp(filesDTO);
			System.out.println(filesDTO.getCode());
			System.out.println(filesDTO.getSheet_code());
			System.out.println(filesDTO.getOriginalFileName());
			System.out.println(filesDTO.getFileName());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}//for 문 끝 
		
	
		String kind = draftDTO.getKind();
		int result3 = 0;
	
		for(int i=0;i<approveDTO.size();i++){
	
		try {
			
			approveDTO.get(i).setSheet_code(sheet_code);
			result3= draftDAO.approve(approveDTO.get(i));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}	
		draftDTO.setSheet_code(sheet_code);
		gianDTO.setSheet_code(sheet_code);

		int result = draftDAO.draftWrite(draftDTO);			
	
		int result2 = draftDAO.gian(gianDTO);
		String message = "";
		String path ="redirect:/draft/draft_main";
		if (result>0 && result2>0&&result3>0){
			message = "성공적으로 상신하였습니다.";
		}else {
			message = "상신을 실패하였습니다.";
		} 
		rd.addFlashAttribute("message", message);
		
		return path;
		
		
		
	}
	
	//expense
	public String expenseWrite(DraftDTO draftDTO, RedirectAttributes rd,ArrayList<ApproveDTO> approveDTO,ExpenseDTO expenseDTO,MultipartHttpServletRequest request){
		HttpSession session = request.getSession();		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String code = memberDTO.getCode();
		
		String savePath = "C:/Users/안지/Desktop/1206_16시/KHBiz/src/main/webapp/upload";
		List<MultipartFile> mf = request.getFiles("files");
		String sheet_code="";
		try {
			sheet_code = this.sheet_code(draftDTO);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		for(int i =0;i<mf.size();i++){
		UUID uid = UUID.randomUUID();
		String originalName = mf.get(i).getOriginalFilename(); // 올라올 때 이름 내가 올린 이름 
		String saveName = uid.toString()+"_"+mf.get(i).getOriginalFilename(); // 중복 x 저장이름  
		
		try {
		byte [] fileData = mf.get(i).getBytes();
			FilesDTO filesDTO = new FilesDTO();
			File fi = new File(savePath,saveName);
			
			FileCopyUtils.copy(fileData,fi);
			this.sheet_code(draftDTO);	
			filesDTO.setFileName(saveName);
			filesDTO.setOriginalFileName(originalName);
			filesDTO.setSheet_code(sheet_code);
			filesDTO.setCode(code);
			int result4 =	draftDAO.fileUp(filesDTO);
			System.out.println(filesDTO.getCode());
			System.out.println(filesDTO.getSheet_code());
			System.out.println(filesDTO.getOriginalFileName());
			System.out.println(filesDTO.getFileName());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}//for 문 끝 
		
	
		String kind = draftDTO.getKind();
		int result3 = 0;
	
		for(int i=0;i<approveDTO.size();i++){
	
		try {
			
			approveDTO.get(i).setSheet_code(sheet_code);
			result3= draftDAO.approve(approveDTO.get(i));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}	
		draftDTO.setSheet_code(sheet_code);
		expenseDTO.setSheet_code(sheet_code);

		int result = draftDAO.draftWrite(draftDTO);			
	
		int result2 = draftDAO.expense(expenseDTO);
		String message = "";
		String path ="redirect:/draft/draft_main";
		if (result>0 && result2>0&&result3>0){
			message = "성공적으로 상신하였습니다.";
		}else {
			message = "상신을 실패하였습니다.";
		} 
		rd.addFlashAttribute("message", message);
		
		return path;
	}
	
	//leave
	public String leaveWrite(DraftDTO draftDTO, RedirectAttributes rd,ArrayList<ApproveDTO> approveDTO,LeaveDTO leaveDTO,MultipartHttpServletRequest request){

		HttpSession session = request.getSession();		
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		String code = memberDTO.getCode();
		String savePath = "C:/Users/안지/Desktop/1206_16시/KHBiz/src/main/webapp/upload";
		List<MultipartFile> mf = request.getFiles("files");
		String sheet_code="";
		try {
			sheet_code = this.sheet_code(draftDTO);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		for(int i =0;i<mf.size();i++){
		UUID uid = UUID.randomUUID();
		String originalName = mf.get(i).getOriginalFilename(); // 올라올 때 이름 내가 올린 이름 
		String saveName = uid.toString()+"_"+mf.get(i).getOriginalFilename(); // 중복 x 저장이름  
		
		try {
		byte [] fileData = mf.get(i).getBytes();
			FilesDTO filesDTO = new FilesDTO();
			File fi = new File(savePath,saveName);
			
			FileCopyUtils.copy(fileData,fi);
			this.sheet_code(draftDTO);	
			filesDTO.setFileName(saveName);
			filesDTO.setOriginalFileName(originalName);
			filesDTO.setSheet_code(sheet_code);
			filesDTO.setCode(code);
			int result4 =	draftDAO.fileUp(filesDTO);
			System.out.println(filesDTO.getCode());
			System.out.println(filesDTO.getSheet_code());
			System.out.println(filesDTO.getOriginalFileName());
			System.out.println(filesDTO.getFileName());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}//for 문 끝 
		
	
		String kind = draftDTO.getKind();
		int result3 = 0;
	
		for(int i=0;i<approveDTO.size();i++){
	
		try {
			
			approveDTO.get(i).setSheet_code(sheet_code);
			result3= draftDAO.approve(approveDTO.get(i));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}	
		draftDTO.setSheet_code(sheet_code);
		leaveDTO.setSheet_code(sheet_code);
		int result = draftDAO.draftWrite(draftDTO);			
	
		int result2 = draftDAO.leave(leaveDTO);
		
		String message = "";
		String path ="redirect:/draft/draft_main";
		if (result>0 && result2>0&&result3>0){
			message = "성공적으로 상신하였습니다.";
		}else {
			message = "상신을 실패하였습니다.";
		} 
		rd.addFlashAttribute("message", message);
		
		return path;
	}
	
	//***************** 전체 LIST ***************************
	
	//1. 보낸 대기
	public String reportWaitList(Model model, String code) throws Exception{
		List<DraftDTO> ar = draftDAO.reportWaitList(code);
		model.addAttribute("reportWaitList", ar);
		return "draft/reportWaitList";
	}
	
	//2. 보낸 완료 
	public String reportFinList(Model model, String code) throws Exception{
		List<GetListDTO> ar = draftDAO.reportFinList(code);
		model.addAttribute("reportFinList", ar);
		return "draft/reportFinList";
	}
	
	//3, 보낸 반려 
	public String reportBackList(Model model, String code) throws Exception{
		List<GetListDTO> ar = draftDAO.reportBackList(code);
		model.addAttribute("reportBackList", ar);
		return "draft/reportBackList";
	}
	
	/*받은-1.결재대기 LIst*/
	public String getWaitList(String code2, Model model)throws Exception{
		List<GetListDTO> ar =  draftDAO.getWaitList(code2);	
		model.addAttribute("getWaitList",ar);
		return "draft/getWaitList";
	}
	
	
	
	/*받은-2.결재완료 LIst*/
	public String getFinList(String code2, Model model)throws Exception{
		List<GetListDTO> ar =  draftDAO.getFinList(code2);	
		model.addAttribute("getFinList",ar);
		return "draft/getFinList";
	}

	/*받은- 3. 반려함 LIst*/
	public String getBackList(String code2, Model model)throws Exception{
		List<GetListDTO> ar =  draftDAO.getBackList(code2);	
		model.addAttribute("getBackList",ar);
		return "draft/getBackList";
	}
	
	//******************10개씩 띄우는 리스트 *******************
		//보낸1. 결재대기 reportWaitBox10
			//reportWaitBox10
				public String reportWaitBox10(String code, Model model){
					List<DraftDTO> ar = draftDAO.reportWaitBox10(model, code);
					model.addAttribute("reportWaitBox10", ar);
					return "draft/reportWaitBox10";
					}

			//보낸2. 결완 reportFinBox10
				public String reportFinBox10(String code, Model model){
					List<GetListDTO> ar = draftDAO.reportFinBox10(model, code);
					model.addAttribute("reportFinBox10", ar);
					return "draft/reportFinBox10";
					}
			//보낸3. 반려함 reportBackBox10		
				public String reportBackBox10(String code, Model model){
					List<GetListDTO> ar = draftDAO.reportBackBox10(model, code);
					model.addAttribute("reportBackBox10", ar);
					return "draft/reportBackBox10";
					}
				
			//받은1. 결재대기10 "getWaitBox10"
				public String getWaitBox10(String code2, Model model)throws Exception{
					List<GetListDTO> ar = draftDAO.getWaitBox10(code2);
						model.addAttribute("getWaitBox10", ar);
					
					return "draft/getWaitBox10";
				}
				
			//받은2. 결재완료10 getFinBox10
				public String getFinBox10(String code2, Model model)throws Exception{
					List<GetListDTO> ar = draftDAO.getFinBox10(code2);
						model.addAttribute("getFinBox10", ar);
					
					return "draft/getFinBox10";
				}
				
			//받은3. 반려함10		
				public String getBackBox10(String code2, Model model)throws Exception{
					List<GetListDTO> ar = draftDAO.getBackBox10(code2);
						model.addAttribute("getBackBox10", ar);
					
					return "draft/getBackBox10";
				}
				
				
				
	
	//********************* 보낸 Modal Views **********************************
	
	//1. 결재 대기 reportWaitView
	public String reportWaitView(Model model, int d_num)throws Exception{
		DraftDTO draftDTO = draftDAO.reportView(d_num);
		model.addAttribute("reportWaitView", draftDTO);
		return "draft/reportWaitView";
	}

	//결재 완료 reportFinView
	public String reportFinView(Model model, int d_num)throws Exception{
		DraftDTO draftDTO = draftDAO.reportView(d_num);
		model.addAttribute("reportFinView", draftDTO);
		return "draft/reportFinView";
	}
	//반려 reportBackView 
	public String reportBackView(Model model, int d_num)throws Exception{
		DraftDTO draftDTO = draftDAO.reportView(d_num);
		model.addAttribute("reportBackView", draftDTO);
		return "draft/reportBackView";
	}
	
	//********************* 받은 Modal Views **********************************
	
	//getWaitView
	public String getWaitView(Model model, int d_num, String code)throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("d_num", d_num);
		map.put("code", code);
		GetListDTO getListDTO = draftDAO.getView(map);
		model.addAttribute("getWaitView", getListDTO);
		return "draft/getWaitView";
	}
	//getFinView
	public String getFinView(Model model, int d_num,String code)throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("d_num", d_num);
		map.put("code", code);
		GetListDTO getListDTO = draftDAO.getView(map);
		model.addAttribute("getFinView", getListDTO);
		return "draft/getFinView";
	}
	
	//getBackView
	public String getBackView(Model model, int d_num,String code)throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("d_num", d_num);
		map.put("code", code);
		GetListDTO getListDTO = draftDAO.getView(map);
		model.addAttribute("getBackView", getListDTO);
		return "draft/getBackView";
	}
	
	
	
	//approverList
	public String approverList(Model model) throws Exception{
		List<MemberDTO> ar = draftDAO.approverList();
		System.out.println(ar.get(0).getCode());
		model.addAttribute("approverList", ar);
		return "draft/approverList";
	}
	//callFIle
	public String callFile(Model model, String sheet_code)throws Exception{
		List<FilesDTO> ar = draftDAO.callFile(model, sheet_code);
		model.addAttribute("callFile", ar);
		return "draft/callFile";
	}
	
	//공통 Delete
	public int delete(RedirectAttributes ra, int d_num) throws Exception{

		return draftDAO.delete(d_num);			
		}
		

		//getBack action( 받은 : 반려 ) 
		public String back(RedirectAttributes ra,String code2, String sheet_code) throws Exception{
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("code2", code2);
			map.put("sheet_code", sheet_code);
			
			int result = draftDAO.back(map);
			String message ="";
			if(result>0){
				message = " 해당 문서를 반려합니다.";
			}else {
				message="해당 문서를 반려하는데 실패했습니다.";
			}
			ra.addFlashAttribute("message", message);
			return "redirect:/draft/draft_main2";
		}
		
	//getapproval action ( 받은 :승인 ) 	
		public String approval(RedirectAttributes ra, String code2, String sheet_code) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("code2", code2);
			map.put("sheet_code", sheet_code);
			
			
			int result=0;
			try {
				result = draftDAO.approval(map);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String check = draftDAO.checkLeave(map);
			if(check != null){
				scheduleDAO.setVacation(sheet_code);
			}
			String message ="";
			if(result>0){
				message ="해당 문서의 결재를 완료하였습니다.";
			}else {
				message="해당 문서를 결재하는데 실패했습니다.";
			}
			ra.addFlashAttribute("message", message);
			return  "redirect:/draft/draft_main2";
		}

		//callGian
		public String callGian(Model model, String sheet_code){
			GianDTO gianDTO = draftDAO.callGian(model,sheet_code);
			model.addAttribute("callGian", gianDTO);
			return "draft/callGian";
			}

		//callExpense
		public String callExpense(Model model, String sheet_code){
			ExpenseDTO expenseDTO= draftDAO.callExpense(model,sheet_code);
			model.addAttribute("callExpense", expenseDTO);
			return "draft/callExpense";
			}
		
		//callLeave
		public String callLeave(Model model, String sheet_code){
			LeaveDTO leaveDTO= draftDAO.callLeave(model,sheet_code);
			model.addAttribute("callLeave", leaveDTO);
			return "draft/callLeave";
			}
		

			
			//*********************************************************************************
			
			//받은 - 마감임박 
		   public List<GetListDTO> dueTime(String code2, Model model)throws Exception{
		         List<GetListDTO> ar =  draftDAO.dueTime(code2);   
		         return ar;
		      }
				

			//보낸 - 마감 임박
			public List<DraftDTO> dueTimeSend(String code, Model model) throws Exception{
				List<DraftDTO> ar = draftDAO.dueTimeSend(code);
				return ar;
			}
					
		  //검색1
	  		public void reportWaitSearch(Model model,String code, String search) throws Exception{
	  		List<DraftDTO> ar = draftDAO.reportWaitSearch(code, search, model);
	  		model.addAttribute("reportWaitSearch", ar);
	  		}
	  		
	  	//검색2
	  		public void reportFinSearch(Model model,String code, String search) throws Exception{
		  		List<GetListDTO> ar = draftDAO.reportFinSearch(code, search, model);
		  		model.addAttribute("reportFinSearch", ar);
		  		}
	  	//검색3
	  		public void reportBackSearch(Model model,String code, String search) throws Exception{
		  		List<GetListDTO> ar = draftDAO.reportBackSearch(code, search, model);
		  		model.addAttribute("reportBackSearch", ar);
		  		}
	  	//검색4
	  		public void getWaitSearch(Model model, String code2, String search)throws Exception{
	  			List<GetListDTO> ar = draftDAO.getWaitSearch(code2, search, model);
	  			model.addAttribute("getWaitSearch", ar);
	  		}
	  		
	  	//검색5 getFinSearch
	  		public void getFinSearch(Model model, String code2, String search)throws Exception{
	  			List<GetListDTO> ar = draftDAO.getFinSearch(code2, search, model);
	  			model.addAttribute("getFinSearch", ar);
	  		}
	  	//검색6 getBackSearch
	  		public void getBackSearch(Model model, String code2, String search)throws Exception{
	  			List<GetListDTO> ar = draftDAO.getBackSearch(code2, search, model);
	  			model.addAttribute("getBackSearch", ar);
	  		}

}
