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

/*	//기안문(draft_1) write
	public int draft_1Write(Draft_1DTO draft_1dto){
		int result = sqlSession.insert(namespace+"draft_1Write", draft_1dto);
		return result;	
	}*/
	
	
	
	public List<DraftDTO> outboxList(){
		return sqlSession.selectList(namespace+"outboxList");
	}
	
	public List<DraftDTO> reportboxList(){
		return sqlSession.selectList(namespace+"reportboxList");
	}
	
	public DraftDTO outboxView(int d_num)throws Exception{
		return 	sqlSession.selectOne(namespace+"outboxView", d_num);
		
	}
	
}
