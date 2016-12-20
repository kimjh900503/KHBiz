package com.khbiz.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatFileDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private String namespace = "ChatFileMapper.";

	
	//파일 등록하기 
	public int fileUpload(ChatFileDTO cf,String cname){
		int result = 0;
		
		//cnum 받아오기 
		List<Integer> list = sqlSession.selectList(namespace+"getCnum", cname);
		int cnum = list.get(0);

		cf.setCnum(cnum);
		result = sqlSession.insert(namespace+"insertFile", cf);
		
		return result;
	}
	
	

}
