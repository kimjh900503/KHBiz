package com.khbiz.member;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace="MemberMapper.";
	
	//회원가입
	public int memberJoin(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(namespace+"memberJoin", memberDTO);
	}
	
	//로그인
	public MemberDTO memberLogin(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(namespace+"memberLogin", memberDTO);
	}

	//개인정보 넣기
	public int memberFirstMod(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(namespace+"memberFirstMod", memberDTO);
	}
	
	//id중복확인
	public MemberDTO memberIdCheck(String id) throws Exception{
		return sqlSession.selectOne(namespace+"memberIdCheck", id);
	}
	
	//회원 검색, 리스트 
	public List<MemberDTO> memberList(String type,String str){
		HashMap<String,String> find = new HashMap<String,String>();
		find.put("type", type);
		find.put("str",str);
		
		return sqlSession.selectList(namespace+"memberList",find);
	}
}
