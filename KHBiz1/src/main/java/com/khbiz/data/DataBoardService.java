package com.khbiz.data;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.khbiz.util.PageMaker;

@Service
public class DataBoardService {

	@Inject
	private DataBoardDAO dataDAO;
	
	@Inject
	private DataFileDAO datafileDAO;
	
	//글 리스트 보기
	public void boardList(int curPage, int perPage,String type,String str,Model model){
		
		//페이징 처리 
		PageMaker pm = new PageMaker();
		pm.setCurPage(curPage);
		pm.setPerPage(perPage);
		pm.makeRow();
		
		List<DataBoardDTO> ar = null;
		try {
			pm.makePage(dataDAO.getCount());
			ar = dataDAO.boardList(pm,type,str);
			
			model.addAttribute("boardList",ar);
			model.addAttribute("page",pm);
			if(type==null){
				type="";
			}
			if(str==null){
				str = "";
			}
			model.addAttribute("type",type);
			model.addAttribute("str",str);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("curPage : "+pm.getCurPage());
	}
	
	//글 쓰기 
	public void boardWrite(DataBoardDTO b, RedirectAttributes rt){
		try {
			int result = dataDAO.boardWrite(b);
			
			String message = "";
			if(result>0){
				message = "글 쓰기 성공";
			}else{
				message = "글 쓰기 실패";
			}
			rt.addFlashAttribute("message",message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//글 하나 보기 
	public DataBoardDTO boardView(int num, Model model, RedirectAttributes rt){
		DataBoardDTO b = null;
		try {
			b = dataDAO.boardView(num);
		} catch (Exception e) {
			e.printStackTrace();
			b = null;
		}
		return b;
	}
	
	//글 수정하기 
	public void boardMod(DataBoardDTO b, RedirectAttributes rt){
		try {
			int result = dataDAO.boardMod(b);
			String message = "";
			if(result>0){
				message = "글 수정 성공";
			}else{
				message = "글 수정 실패";
			}
			rt.addFlashAttribute("message",message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//글 삭제하기 
	public String boardDel(int num,RedirectAttributes rt){
		int result = 0;
		
		result = dataDAO.boardDel(num);
		datafileDAO.fileDel(num);
		String message = "";
		String path = "";
		if(result>0){
			message = "글 삭제 성공";
			path = "redirect:/databoardList";
		}else{
			message = "글 삭제 실패";
			path="redirect:/databoardView?num="+num;
		}
		rt.addFlashAttribute("message",message);
		return path;
	}
	
}
