package com.erp.draft;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.scheduling.annotation.Scheduled;
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
	//6. file
	public int fileUp(FilesDTO filesDTO){
	
		return sqlSession.insert(namespace+"fileUp",filesDTO);
	}
	
	//*******************전체 LIST *************************
	
	//보낸 대기 
	public List<DraftDTO> reportWaitList(String code){
		return sqlSession.selectList(namespace+"reportWaitList",code);
	}
	//보낸 완료
	public List<GetListDTO> reportFinList(String code){
		return sqlSession.selectList(namespace+"reportFinList",code);
	}
	//보낸 반려
	public List<GetListDTO> reportBackList(String code){
		return sqlSession.selectList(namespace+"reportBackList",code);
	}
	
	//받은 대기 getWaitList 결재대기 리스트
		public List<GetListDTO> getWaitList(String code2) throws Exception{
			System.out.println("code : "+ code2);
			return sqlSession.selectList(namespace+"getWaitList",code2);
		}
		
	//받은 완료 getFinList
		public List<GetListDTO> getFinList(String code2) throws Exception{
			return sqlSession.selectList(namespace+"getFinList", code2);
		}
		
	//받은 반려 getBackList
			public List<GetListDTO> getBackList(String code2) throws Exception{
				return sqlSession.selectList(namespace+"getBackList", code2);
			}
	
	//*******   10개씩 띄우는 리스트 ***************
	//보낸1. 결재대기 reportWaitBox10
		public List<DraftDTO> reportWaitBox10(Model model, String code){
			return sqlSession.selectList(namespace+"reportWaitBox10", code);
		}
	
	//보낸2. 결재완료 reportFinBox10
		public List<GetListDTO> reportFinBox10(Model model, String code){
			return sqlSession.selectList(namespace+"reportFinBox10", code);
		}
		
	//보낸3. 반려 reportBackBox10
		public List<GetListDTO> reportBackBox10(Model model, String code){
			return sqlSession.selectList(namespace+"reportBackBox10", code);
		}
	
	
	//받은1. 결재대기10 "getWaitBox10"
		public List<GetListDTO> getWaitBox10(String code2) throws Exception{
			return sqlSession.selectList(namespace+"getWaitBox10", code2);
		}  
		
	//받은2. 결재완료10 getFinBox10
		public List<GetListDTO> getFinBox10(String code2) throws Exception{
			return sqlSession.selectList(namespace+"getFinBox10", code2);
		}
		
	//받은3. 반려함10 getBackBox10
		public List<GetListDTO> getBackBox10(String code2) throws Exception{
			return sqlSession.selectList(namespace+"getBackBox10", code2);
		}	
		
		
	//보낸 6개 리스트들 view 처리 reportView

		public DraftDTO reportView(int d_num)throws Exception{
			return sqlSession.selectOne(namespace+"reportView", d_num);
		}
		
		
		
		//*********************************************************
		
		
		
		
		
	// 문서작성에서 결재자 명단 
	public List<MemberDTO> approverList() {
		return sqlSession.selectList(namespace+"approverList");
	}
	
	


	//공통 삭제 Delete
	public int delete(int d_num) throws Exception{
		return sqlSession.delete(namespace+"delete",d_num);
	}
	
	//공통 View
	public GetListDTO getView(HashMap<String, Object> map)throws Exception{
		return sqlSession.selectOne(namespace+"getView", map);
	}
	
	
		//getWaitView
		public GetListDTO getWaitView(HashMap<String, Object> map)throws Exception{
			return sqlSession.selectOne(namespace+"getWaitView", map);
		}
		//getFinView
		public GetListDTO getFinView(HashMap<String, Object> map)throws Exception{
			return sqlSession.selectOne(namespace+"getFinView", map);
		}
		
		//getBackView
		public GetListDTO getBackView(HashMap<String, Object> map)throws Exception{
			return sqlSession.selectOne(namespace+"getBackView", map);
		}
		
		//get ---back(받은 - 반려)
		public int back(HashMap<String, Object>map) throws Exception{
			return sqlSession.update(namespace+"back",map);
		}
		
		//get----approval(받은 - 결재해주기)
		public int approval(HashMap<String, Object>map) throws Exception{
			return sqlSession.update(namespace+"approval", map);
		}
		//기한 만료 반려
		@Scheduled(cron="50 50 23 * * 0-6")
		public void overTimeBack(){
			sqlSession.update(namespace+"overTimeBack");
		}
		//휴가 최종 결재 확인
		public String  checkLeave(HashMap<String, Object>map){
			return sqlSession.selectOne(namespace+"checkLeave", map);
		}
		
		
		//callGian
		public GianDTO callGian(Model model,String sheet_code){
			return sqlSession.selectOne(namespace+"callGian", sheet_code);
		}
		
		//callExpense
		public ExpenseDTO callExpense(Model model, String sheet_code){
			return sqlSession.selectOne(namespace+"callExpense", sheet_code);
		}
		
		//callLeave
		public LeaveDTO callLeave(Model model, String sheet_code){
			return sqlSession.selectOne(namespace+"callLeave", sheet_code);
		}
	
		//callFile
		public List<FilesDTO> callFile(Model model, String sheet_code){
			return sqlSession.selectList(namespace+"callFile", sheet_code);
		}
		   //결재 마감 임박
	      public List<GetListDTO> dueTime(String code2) throws Exception{
	         return sqlSession.selectList(namespace+"dueTime", code2);
	      }
	      

	  	//보낸 마감임박
	  		public List<DraftDTO> dueTimeSend(String code)throws Exception{
	  			return sqlSession.selectList(namespace+"dueTimeSend", code);
	  		}
	  		
	  	//검색1
	  		public List<DraftDTO> reportWaitSearch(String code, String search,Model model) throws Exception{
	  			HashMap<String, Object> map = new HashMap<String, Object>();
	  			map.put("code", code);
	  			map.put("search", "%"+search+"%");
	  			model.addAttribute("reportWaitSearch", map);
	  			List<DraftDTO> ar = sqlSession.selectList(namespace+"reportWaitSearch", map);
	  			return ar;
	  		}
	  		
	  	//검색2
	  		public List<GetListDTO>reportFinSearch(String code, String search,Model model)throws Exception{
	  			HashMap<String, Object> map = new HashMap<String, Object>();
	  			map.put("code", code);
	  			map.put("search", "%"+search+"%");
	  			model.addAttribute("reportFinSearch", map);
	  			List<GetListDTO> ar = sqlSession.selectList(namespace+"reportFinSearch", map);
	  			return ar;
	  		} 
	  	//검색3
	  		public List<GetListDTO>reportBackSearch(String code, String search,Model model)throws Exception{
	  			HashMap<String, Object> map = new HashMap<String, Object>();
	  			map.put("code", code);
	  			map.put("search", "%"+search+"%");
	  			model.addAttribute("reportBackSearch", map);
	  			List<GetListDTO> ar = sqlSession.selectList(namespace+"reportBackSearch", map);
	  			return ar;
	  		} 
	  	//검색4 getWaitSearch
	  		public List<GetListDTO> getWaitSearch (String code2, String search,Model model) throws Exception{
	  			HashMap<String, Object> map = new HashMap<String, Object>();
	  			map.put("code2", code2);
	  			map.put("search", "%"+search+"%");
	  			model.addAttribute("getWaitSearch", map);
	  			List<GetListDTO> ar = sqlSession.selectList(namespace+"getWaitSearch", map);
	  			return ar;
	  		}
	  		
	  	//검색5 getFinSearch
	  		public List<GetListDTO> getFinSearch (String code2, String search,Model model) throws Exception{
	  			HashMap<String, Object> map = new HashMap<String, Object>();
	  			map.put("code2", code2);
	  			map.put("search", "%"+search+"%");
	  			model.addAttribute("getFinSearch", map);
	  			List<GetListDTO> ar = sqlSession.selectList(namespace+"getFinSearch", map);
	  			return ar;
	  		}
	  		
	  	//검색6 getBackSearch
	  		public List<GetListDTO> getBackSearch (String code2, String search,Model model) throws Exception{
	  			HashMap<String, Object> map = new HashMap<String, Object>();
	  			map.put("code2", code2);
	  			map.put("search", "%"+search+"%");
	  			model.addAttribute("getBackSearch", map);
	  			List<GetListDTO> ar = sqlSession.selectList(namespace+"getBackSearch", map);
	  			return ar;
	  		}
}
