package com.khbiz.attendmanage;


import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;

import com.khbiz.member.MemberDTO;
import com.khbiz.util.PageMaker;

@Repository
public class AttendManageDAO {
	@Inject
	private SqlSession sqlSession;
	private String namespace = "AttendmanageMapper.";
	//가입
	public int memberIn(MemberDTO memberDTO){
		int result = sqlSession.insert(namespace+"memberIn", memberDTO);
		return result;
	}
	//OT
	public void over(MemberDTO memberDTO){
		sqlSession.update(namespace+"over", memberDTO);
	}
	//휴가확인
	@Scheduled(cron="0 0 08 * * MON-FRI")
	public void vacation(){
		sqlSession.update(namespace+"vacation");
	}
	//지각확인
	@Scheduled(cron="0 0 09 * * MON-FRI")
	public void late(){
		sqlSession.update(namespace+"late");
	}
	//결근확인
	@Scheduled(cron="0 0 13 * * MON-FRI")
	public void absence(){
		sqlSession.update(namespace+"absence");
	}
	//삭제
	public void memberDel(MemberDTO memberDTO){
		sqlSession.delete(namespace+"memberDel", memberDTO);
	}
	//한명 view
	public AttendManageDTO memberView(String code){
		return sqlSession.selectOne(namespace+"memberView", code);
	}
	//근태리스트
	public List<AttendListDTO> attendList(int lastNum){
		return sqlSession.selectList(namespace+"attendList", lastNum);
	}
	//근태 부서별 리스트
	public List<AttendListDTO> attendDepartmentList(int num, String department){
		String lastNum = String.valueOf(num);
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("lastNum", lastNum);
		hm.put("department", department);
		return sqlSession.selectList(namespace+"attendDepartmentList", hm);
	}
	//근태 검색 
	public List<AttendListDTO> attendsearch(int num, String search){
		String lastNum = String.valueOf(num);
		search = "%"+search+"%";
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("lastNum", lastNum);
		hm.put("search", search);
		return sqlSession.selectList(namespace+"attendsearch", hm);
	}
	//수정폼
	public AttendListDTO getAttend(String code){
		return sqlSession.selectOne(namespace+"getAttend", code);
	}
	//수정
	public int attendmodi(AttendManageDTO attendManageDTO){
		return sqlSession.update(namespace+"attendmodi", attendManageDTO);
	}
}
