package com.khbiz.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MemberService {

	
	@Autowired
	MemberDAO memberDAO;
	
	//회원 리스트 
	public void MemberList(String type,String str,Model model){
		List<MemberDTO> members = memberDAO.memberList(type, str);
	}
	//join
		public int memberJoin(MemberDTO memberDTO) throws Exception {
			return memberDAO.memberJoin(memberDTO);
		}
		
		//login
		public MemberDTO memberLogin(MemberDTO memberDTO)throws Exception{
			return memberDAO.memberLogin(memberDTO);
		}
		
		//Firstmod
		public int memberFirstMod(MemberDTO memberDTO)throws Exception{
			return memberDAO.memberFirstMod(memberDTO);
		}
		
		//idcheck
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
}
