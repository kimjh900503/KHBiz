package com.khbiz.erp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.khbiz.notice.NoticeDTO;
import com.khbiz.notice.NoticeService;
import com.khbiz.util.PageMaker;

@Controller
@RequestMapping(value="/notice")
public class NoticeController {
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/noticeList")
	public String NoticeList(Model model,@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage){
		int totalCount=0;
		
		try {
			totalCount = noticeService.noticeCount();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	
		
		PageMaker pm=new PageMaker();
		pm.setCurPage(curPage);
		pm.setPerPage(perPage);
		pm.makeRow();
		pm.makePage(totalCount);
		List<NoticeDTO> ar=null;
		
		try {
			ar =noticeService.noticeList(pm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("notice", ar);
		model.addAttribute("page", pm);
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/noticeWrite", method=RequestMethod.GET)
	public void NoticeWrite(){}
	
	
	@RequestMapping(value="/noticeWrite", method=RequestMethod.POST)
	public String NoticeWrite(NoticeDTO noticeDTO,RedirectAttributes rd,@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage){
		int result =0;
		String message="";
		List<NoticeDTO> ar=null;
		int totalCount=0;
		try {
			totalCount = noticeService.noticeCount();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	
		
		PageMaker pm=new PageMaker();
		pm.setCurPage(curPage);
		pm.setPerPage(perPage);
		pm.makeRow();
		pm.makePage(totalCount);
		try {
			result =noticeService.noticeWrite(noticeDTO);
			ar =noticeService.noticeList(pm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			message="글 등록 완료";
			rd.addFlashAttribute("message",message);
			rd.addFlashAttribute("page", pm);
			rd.addFlashAttribute("notice", ar);
			
		}else{
			message="글 등록 실패";
			rd.addFlashAttribute("message",message);
			rd.addFlashAttribute("page", pm);
			rd.addFlashAttribute("notice", ar);
		}
		return "redirect:./noticeList";
		
	}
	
	@RequestMapping(value="/noticeView")
	public String noticeView(NoticeDTO noticeDTO,Model model,@RequestParam int curPage){
		try {
			noticeDTO= noticeService.noticeView(noticeDTO);
			noticeService.noticeHits(noticeDTO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("noticeView", noticeDTO);
		model.addAttribute("curPage", curPage);
		return "notice/noticeView";
	}
	
	@RequestMapping(value="/noticeMod",method=RequestMethod.GET)
	public void noticeModForm(NoticeDTO noticeDTO,Model model,@RequestParam int curPage){
		try {
			noticeDTO= noticeService.noticeView(noticeDTO);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("curPage", curPage);
		model.addAttribute("noticeView", noticeDTO);
		
	}
	
	
	@RequestMapping(value="/noticeMod",method=RequestMethod.POST)
	public String noticeMod(NoticeDTO noticeDTO,Model model,@RequestParam int curPage){
		int result=0;
		String message="";
		NoticeDTO noticeDTO2=new NoticeDTO();
		try {
			result =noticeService.noticeMod(noticeDTO);
			noticeDTO2= noticeService.noticeView(noticeDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(result>0){
			message="글 수정 성공";			
			model.addAttribute("message", message);
			model.addAttribute("noticeView", noticeDTO2);
			model.addAttribute("curPage", curPage);

		}else{
			message="글 수정 실패";			
			model.addAttribute("message", message);
			model.addAttribute("noticeView",noticeDTO2);
		}
		return "notice/noticeView";
	}
	@RequestMapping(value="/noticeDelete")
	public String noticeDelete(NoticeDTO noticeDTO,Model model,@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="10") int perPage){
		List<NoticeDTO>ar=null;
		int totalCount=0;
		try {
			totalCount = noticeService.noticeCount();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		PageMaker pm=new PageMaker();
		pm.setCurPage(curPage);
		pm.setPerPage(perPage);
		pm.makeRow();
		pm.makePage(totalCount);
		int result=0;
		String message="";
		try {
			result =noticeService.noticeDelete(noticeDTO);
			ar =noticeService.noticeList(pm);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0){
			message="글 삭제 성공";			
			model.addAttribute("page", pm);
			model.addAttribute("message", message);
			model.addAttribute("notice", ar);

		}else{
			message="글 삭제 실패";			
			model.addAttribute("page", pm);
			model.addAttribute("message", message);
			model.addAttribute("notice", ar);
		}
		return "notice/noticeList";
	}
	

	
	
	
	
}
