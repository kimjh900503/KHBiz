package com.khbiz.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	//회원수정
	public int memberMod(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberMod(memberDTO);
	} 
	
	//회원탈퇴
	public int memberDelete(MemberDTO memberDTO)throws Exception{
		return memberDAO.memberDelete(memberDTO);
	}
		
}
