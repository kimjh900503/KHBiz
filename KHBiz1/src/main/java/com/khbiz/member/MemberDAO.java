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
	
	//code중복확인
	public MemberDTO memberCodeCheck(String code) throws Exception{
		return sqlSession.selectOne(namespace+"memberCodeCheck", code);
	}
	
	//회원정보
	public MemberDTO memberView(String code)throws Exception{
		return sqlSession.selectOne(namespace+"memberView", code);
	}
	
	//회원수정
	public int memberMod(MemberDTO memberDTO)throws Exception{

		return sqlSession.update(namespace+"memberMod", memberDTO);
	}
	
	//회원탈퇴
	public int memberDelete(MemberDTO memberDTO)throws Exception{
		return sqlSession.delete(namespace+"memberDelete",memberDTO);
	}
	

	//회원리스트
	public List<MemberDTO> memberOriginList(int lastNum)throws Exception{
		return sqlSession.selectList(namespace+"memberOriginList",lastNum);
	}
	
	//회원리스트(수정불가)
		public List<MemberDTO> memberContactList(int lastNum)throws Exception{
			return sqlSession.selectList(namespace+"memberContactList",lastNum);
		}
	
	//부서별 회원 리스트
	public List<MemberDTO> memberDepartmentList(HashMap<String, String> hm)throws Exception{
		return sqlSession.selectList(namespace+"memberDepartmentList",hm);
	}
	
	//부서별 회원 리스트(수정불가)
	public List<MemberDTO> memberContactDepartmentList(HashMap<String, String> hm)throws Exception{
		return sqlSession.selectList(namespace+"memberContactDepartmentList",hm);
	}
	//부서 이동
	public int memberDepartmentMod(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(namespace+"memberDepartmentMod", memberDTO);
	}
	
	//직급 변경
	public int memberPositionMod(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(namespace+"memberPositionMod", memberDTO);
	}
	
	//id찾기
	public MemberDTO memberIdFind(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(namespace+"memberIdFind", memberDTO);	
	}
	
	//pw찾기
	public MemberDTO memberPwFind(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(namespace+"memberPwFind", memberDTO);	
	}
	
	//사람검색
	public List<MemberDTO> memberHumanFind(HashMap<String, String>hm)throws Exception{
		return sqlSession.selectList(namespace+"memberHumanFind",hm);
	}
	
	//사람검색(수정불가)
	public List<MemberDTO> memberContactHumanFind(HashMap<String, String>hm)throws Exception{
		return sqlSession.selectList(namespace+"memberContactHumanFind", hm);
	}
	
	
	
	
	
	
	// 회원 검색, 리스트
	public List<MemberDTO> memberList(String type, String str, String code) {
		System.out.println("dao code : "+code);
		if (type != null && str != null) {
			str = "%" + str + "%";
		}
		if (str == null || str.equals(' ')) {
			str = "%";
		}
		HashMap<String, String> find = new HashMap<String, String>();

		find.put("type", type);
		find.put("str", str);
		find.put("code", code);

		List<MemberDTO> list = sqlSession.selectList(namespace+"memberList", find);

		return list;
	}
}
