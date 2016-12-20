package com.khbiz.attendmanage;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.khbiz.member.MemberDTO;

@Service
public class AttendManageService {
	@Inject
	private AttendManageDAO attendManageDAO;
	public void memberIn(MemberDTO memberDTO){
		attendManageDAO.memberIn(memberDTO);
	}
	//삭제
	public void memberDel(MemberDTO memberDTO){
		attendManageDAO.memberDel(memberDTO);
	}
	//memberView
	public AttendManageDTO memberView(String code){
		return attendManageDAO.memberView(code);
	}
	//근태리스트
	public String attendList(int lastNum,Model model){
		List<AttendListDTO> list = attendManageDAO.attendList(lastNum);
		model.addAttribute("list", list);
		return "attendmanage/attendmanage";
	}
	//근태부서별리스트
	public String attendDepartmentList(int lastNum,String department,Model model){
		List<AttendListDTO> list = attendManageDAO.attendDepartmentList(lastNum,department);
		model.addAttribute("list", list);
		return "attendmanage/attenddepartmanage";
	}
	//근태 검색 
	public String attendsearch(int lastNum,String search,Model model){
		List<AttendListDTO> list = attendManageDAO.attendsearch(lastNum,search);
		model.addAttribute("list", list);
		return "attendmanage/attendsearch";
	}
	//수정폼
	public AttendListDTO getAttend(String code){
		return attendManageDAO.getAttend(code);
	}
	//수정
	public int attendmodi(AttendManageDTO attendManageDTO){
		return attendManageDAO.attendmodi(attendManageDTO);
	}
}
