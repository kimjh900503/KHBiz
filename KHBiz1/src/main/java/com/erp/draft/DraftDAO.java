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
	
	public int draftWrite(DraftDTO draftDTO){
		DraftDAO draftDAO = new DraftDAO();
		System.out.println(draftDTO.getSheet_code());
	
		int result =sqlSession.insert(namespace+"draftWrite",draftDTO);
		return result;
	}

	public List<DraftDTO> outboxList(){
		return sqlSession.selectList(namespace+"outboxList");
	}
	
	public List<DraftDTO> reportboxList(){
		return sqlSession.selectList(namespace+"reportboxList");
	}
	
	
}
