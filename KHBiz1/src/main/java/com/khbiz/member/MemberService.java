package com.khbiz.member;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;



@Service
public class MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	//회원가입
	public int memberJoin(MemberDTO memberDTO) throws Exception {
		return memberDAO.memberJoin(memberDTO);
	}
	
	//로그인
	public MemberDTO memberLogin(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberLogin(memberDTO);
	}
	
	//개인정보 넣기
	public int memberFirstMod(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberFirstMod(memberDTO);
	}
	
	//id중복확인
	public int memberIdCheck(String id,MemberDTO memberDTO)throws Exception{
		int result=0;
		memberDTO= memberDAO.memberIdCheck(id);
		if(memberDTO !=null){
			result=1;
		}else{
			result=0;
		}
		return result;
	}
	
	//code중복확인
	public int memberCodeCheck(String code,MemberDTO memberDTO)throws Exception{
		int result=0;
		memberDTO= memberDAO.memberCodeCheck(code);
		if(memberDTO !=null){
			result=1;
		}else{
			result=0;
		}
		return result;
	}
		
	//회원수정
	public int memberMod(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberMod(memberDTO);
	} 
	
	//회원탈퇴
	public int memberDelete(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberDelete(memberDTO);
	}

	//회원리스트
	public List<MemberDTO> memberOriginList(int lastNum)throws Exception{
		return memberDAO.memberOriginList(lastNum);
	}
	
	//회원리스트(수정불가)
	public List<MemberDTO> memberContactList(int lastNum)throws Exception{
		return memberDAO.memberContactList(lastNum);
	}
	
	//부서별 회원 리스트
	public List<MemberDTO> memberDepartmentList(HashMap<String, String>hm)throws Exception{
			System.out.println(hm.get("department"));
			return memberDAO.memberDepartmentList(hm);
	}
	//부서별 회원 리스트
	public List<MemberDTO> memberContactDepartmentList(HashMap<String, String> hm)throws Exception{
			return memberDAO.memberContactDepartmentList(hm);
	}
	
	//부서이동
	public int memberDepartmentMod(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberDepartmentMod(memberDTO);
	}
	//직급 변경
	public int memberPositonMod(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberPositionMod(memberDTO);
	}
	
	//회원정보
		public MemberDTO memberView(String code)throws Exception{
			return memberDAO.memberView(code);
		}
	//id 찾기
	public MemberDTO memberIdFind(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberIdFind(memberDTO);
	}
		
	//pw 찾기
	public MemberDTO memberPwFind(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberPwFind(memberDTO);
	}


	//사람검색
	public List<MemberDTO> memberHumanFind(HashMap<String, String> hm)throws Exception{
		return memberDAO.memberHumanFind(hm);
	}
	
	//사람검색(수정불가)
	public List<MemberDTO> memberContactHumanFind(HashMap<String, String>hm)throws Exception{
		return memberDAO.memberContactHumanFind(hm);
	}

	
	
	// 회원 리스트
	public void memberList(String type, String str, Model model, String code) {
		System.out.println("service code : "+code);
		List<MemberDTO> list = memberDAO.memberList(type, str, code);
		model.addAttribute("type", type);
		model.addAttribute("str", str);
		model.addAttribute("memberList", list);
	}
	
	// 초대 후 회원 리스트
	public void memberList2(String type, String str, Model model, List<String> codes, String code) {
		System.out.println("service code : "+code);
		List<MemberDTO> list = memberDAO.memberList(type, str, code);
		model.addAttribute("type", type);
		model.addAttribute("str", str);
		model.addAttribute("memberList", list);
		model.addAttribute("codes", codes);
	}
	

}
