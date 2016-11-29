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
	
	//write 1. 문서 write
	public int draftWrite(DraftDTO draftDTO){
		int result =sqlSession.insert(namespace+"draftWrite",draftDTO);
		return result;
	}

	//2. 
	public int approve(ApproveDTO approveDTO){
		int result =sqlSession.insert(namespace+"approve",approveDTO);
		
		return result;
	}
	//3.
	public int gian(GianDTO gianDTO){
		int result =sqlSession.insert(namespace+"gian",gianDTO);
		return result;
	}
	//4.
	public int expense(ExpenseDTO expenseDTO){
		int result =sqlSession.insert(namespace+"expense",expenseDTO);
		return result;
	}
	//5.
	public int leave(LeaveDTO leaveDTO){
		int result =sqlSession.insert(namespace+"leave",leaveDTO);
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
	//getWaitList 결재대기 리스트
	public List<GetListDTO> getWaitList(String code2) throws Exception{
		System.out.println("code : "+ code2);
		return sqlSession.selectList(namespace+"getWaitList",code2);
	}
	//getFinList
	public List<GetListDTO> getFinList(String code2) throws Exception{
		return sqlSession.selectList(namespace+"getFinList", code2);
	}
	
	//getBackList
		public List<GetListDTO> getBackList(String code2) throws Exception{
			return sqlSession.selectList(namespace+"getBackList", code2);
		}
	
		//getWateView
		public GetListDTO getWaitView(int d_num)throws Exception{
			return sqlSession.selectOne(namespace+"getWaitView", d_num);
		}
		//getFinView
		public GetListDTO getFinView(int d_num)throws Exception{
			return sqlSession.selectOne(namespace+"getFinView", d_num);
		}
		
		//getBackView
		public GetListDTO getBackView(int d_num)throws Exception{
			return sqlSession.selectOne(namespace+"getBackView", d_num);
		}
		
		
		
		
		
		
		
	/*페이징한거
	 * //getAllList
	public List<DraftDTO> getAllList(DraftDTO draftDTO, PageMaker pageMaker) throws Exception{
		return sqlSession.selectList(namespace+"getAllList", pageMaker);
	}
	
	//getAllCount
	public int getAllCount()throws Exception{
		return sqlSession.selectOne(namespace+"getAllCount");
	}*/
}
