package com.khbiz.erp;


import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.khbiz.data.DataBoardDAO;
import com.khbiz.data.DataBoardDTO;
import com.khbiz.data.DataBoardService;
import com.khbiz.data.DataFileDTO;
import com.khbiz.data.DataFileService;
import com.khbiz.member.MemberDTO;





@Controller
public class DataController {

	@Inject 
	DataBoardService databoardService;

	@Inject
	DataFileService datafileService;

	@Inject 
	DataBoardDAO databoardDAO;


	//list
	@RequestMapping(value="/databoardList")
	public String boardList(@RequestParam(defaultValue="1") int curPage, @RequestParam (defaultValue="10") int perPage, @RequestParam (value = "type", required = false) String type,@RequestParam (value = "str", required = false) String str, Model model,HttpSession session){
		MemberDTO memberDTO = null;
		String path = "databoard/list";
		try {
			memberDTO = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("type"+type);
		System.out.println("str"+str);
		try{
			if(type.equals("")){
				type=null;
			}
			if(str.equals("")){
				str = null;
			}
		}catch (Exception e) {
			type = null; 
			str = null;
		}
		System.out.println("type"+type);
		System.out.println("str"+str);
		if(memberDTO != null){
			databoardService.boardList(curPage, perPage, type, str, model);
		}else{
			path = "redirect:/";
		}
		return path;
	}

	//view                  
	@RequestMapping(value="/databoardView")
	public String boardView(@RequestParam int num,Model model, RedirectAttributes rt,HttpSession session){
		MemberDTO memberDTO = null;
		DataBoardDTO b= databoardService.boardView(num, model, rt);
		String path = "";
		try {
			memberDTO = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(memberDTO != null){
			if(b!=null){
				model.addAttribute("board",b);
				datafileService.fileList(num, model);
				path = "databoard/view";
			}else{
				rt.addFlashAttribute("mesage","글 조회를 실패했습니다.");
				path = "redirect:/databoardList";
			}			
		}else{
			path = "redirect:/";
		}
		return path;
	}

	//writeForm       
	@RequestMapping(value="/databoardWriteForm")
	public String boardWriteForm(Model model,HttpSession session){
		MemberDTO memberDTO = null;
		String path = "redirect:/";
		try {
			memberDTO = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(memberDTO != null){
			path = "databoard/writeForm";
		}
		return path;
	}

	//write
	@RequestMapping(value="/databoardWrite")
	public String boardWrite(MultipartHttpServletRequest mr,RedirectAttributes rt,Model model, HttpSession session){
		MemberDTO memberDTO = null;
		String path = "redirect:/";
		try {
			memberDTO = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(memberDTO !=null){
			//글번호 가져오기 
			int num = databoardDAO.getMaxNum();
			
			//파일에 저장 
			String savePath = session.getServletContext().getRealPath("/resources/upload");
			System.out.println("savePath : "+savePath);
			
			List<MultipartFile> mf = mr.getFiles("files");
			for(MultipartFile mp : mf){
				UUID uid = UUID.randomUUID();
				String saveName = uid.toString()+"_"+mp.getOriginalFilename();
				File f = new File(savePath,saveName);
				try {
					mp.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				DataFileDTO d = new DataFileDTO();
				d.setDnum(num);
				d.setOriginName(mp.getOriginalFilename());
				d.setSaveName(saveName);
				//파일에 써주기 
				datafileService.fileWrite(d, model);
			}	
			
			//board 에 쓰기 
			DataBoardDTO d = new DataBoardDTO();
			d.setNum(num);
			d.setTitle(mr.getParameter("title"));
			d.setWriter(mr.getParameter("writer"));
			d.setContents(mr.getParameter("contents"));
			
			databoardService.boardWrite(d, rt);
			path = "redirect:/databoardList"; 
		}

		return 	path;
	}

	//modeForm
	@RequestMapping(value="/databoardModForm")
	public String boardModForm(@RequestParam int num,Model model,RedirectAttributes rt, HttpSession session){
		MemberDTO memberDTO = null;
		String path = "redirect:/";
		try {
			memberDTO = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(memberDTO !=null){
			DataBoardDTO b = databoardService.boardView(num, model, rt);
			if(b!=null){
				if(b.getWriter().equals(memberDTO.getName())){
					model.addAttribute("board",b);
					datafileService.fileList(num, model);
					path = "databoard/modForm";					
				}else{
					rt.addFlashAttribute("mesage","잘못된 경로입니다");
					path = "redirect:/databoardList";
				}
			}else{
				rt.addFlashAttribute("mesage","글 조회를 실패했습니다.");
				path = "redirect:/databoardList";
			}	
		}
		return path;
	}

	//mod
	@RequestMapping(value="/databoardMod")
	public String boardMod(MultipartHttpServletRequest mr,RedirectAttributes rt,Model model, HttpSession session){
		MemberDTO memberDTO = null;
		String path = "redirect:/";
		try {
			memberDTO = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(memberDTO !=null){
			//board update 해주기 
			DataBoardDTO d = new DataBoardDTO();
			int num = Integer.parseInt(mr.getParameter("num"));
			d.setNum(num);
			d.setTitle(mr.getParameter("title"));
			d.setWriter(mr.getParameter("writer"));
			d.setContents(mr.getParameter("contents"));
			databoardService.boardMod(d, rt);
			
			//파일 조회해오기 - 파일명 존재하면 insert 안해주기 
			//파일명 존재하지 않으면 insert 해주기 
			//파일에 저장 
			String savePath = session.getServletContext().getRealPath("/resources/upload");
			System.out.println("savePath : "+savePath);
			
			List<MultipartFile> mf = mr.getFiles("files");
			for(MultipartFile mp : mf){
				
				UUID uid = UUID.randomUUID();
				String saveName = uid.toString()+"_"+mp.getOriginalFilename();
				File f = new File(savePath,saveName);
				try {
					mp.transferTo(f);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				List<String> list = databoardDAO.selectOriginName(mp.getOriginalFilename(),num);
				//존재하지 않을 경우에 write 해주기 
				if(list.size()==0){
					DataFileDTO df = new DataFileDTO();
					df.setDnum(num);
					df.setOriginName(mp.getOriginalFilename());
					df.setSaveName(saveName);
					//파일에 써주기 
					datafileService.fileWrite(df, model);
				}
			}	
			path = "redirect:/databoardList";
		}
		return path;
	}

	//delete 
	@RequestMapping(value="/databoardDelete",method=RequestMethod.POST)
	public String boardDel(@RequestParam int num, RedirectAttributes rt, HttpSession session){
		MemberDTO memberDTO = null;
		String path = "redirect:/";
		try {
			memberDTO = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(memberDTO !=null){
			//글 삭제, 파일 삭제 
			path = databoardService.boardDel(num,rt);					
		}
		return path;
	}
	
	//파일 하나 지우기
	@RequestMapping(value="/datafileDelete")
	public String fileDel(@RequestParam String saveName,Model model, HttpSession session){
		MemberDTO memberDTO = null;
		String path = "redirect:/";
		try {
			memberDTO = (MemberDTO) session.getAttribute("member");
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(memberDTO !=null){
			int result = datafileService.fileDelOne(saveName);
			if(result>0){
				model.addAttribute("result","삭제성공");
			}
			path = "/databoard/result";
		}
		return path;
	}
	
	

}
