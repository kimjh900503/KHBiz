package com.erp.draft;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.khbiz.member.MemberDTO;

@Repository
public class DraftDAO {

	@Autowired
	private SqlSession sqlSession;
	private String namespace="DraftMapper.";
	
	//문서 write
	public int draftWrite(DraftDTO draftDTO){
		int result =sqlSession.insert(namespace+"draftWrite",draftDTO);
		return result;
	}
	
	public List<DraftDTO> outboxList(){
		return sqlSession.selectList(namespace+"outboxList");
	}
	
	public List<MemberDTO> approverList() {
		return sqlSession.selectList(namespace+"approverList");
	}
	
	public List<DraftDTO> reportboxList(){
		return sqlSession.selectList(namespace+"reportboxList");
	}
		
	public DraftDTO outboxView(int d_num)throws Exception{
		return sqlSession.selectOne(namespace+"outboxView", d_num);
	}
	
	public DraftDTO reportboxView(int d_num) throws Exception{
		return sqlSession.selectOne(namespace+"reportboxView", d_num);
	}
	//outboxDelete
	public int outboxDelete(int d_num) throws Exception{
		return sqlSession.delete(namespace+"outboxDelete",d_num);
	}
	//reportboxDelete
	public int reportboxDelete(int d_num) throws Exception{
		return sqlSession.delete(namespace+"reportboxDelete",d_num);
	}
	//outboxReport
	public int outboxReport(int d_num)throws Exception{
		return sqlSession.update(namespace+"outboxReport", d_num);
	}
}
