package com.khbiz.data;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.khbiz.util.PageMaker;

@Repository
public class DataFileDAO {
	
		//파일 목록 가져오기 

		//파일 넣기 

		//파일 수정하기  
	
		//파일 삭제하기 
	
	@Inject
	private SqlSession sqlSession;
	
	private String namespace = "DataMapper.";

	//파일 리스트 
	public List<DataFileDTO> fileList(int dnum){
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+"datafileList",dnum);
	}


	//파일 write
	public int fileWrite(DataFileDTO b){
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+"datafileWrite",b);
	}

	//파일 수정 
	public int fileMod(DataFileDTO b){
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"datafileMod",b);
	}
	
	//파일 삭제 
	public int fileDel(int dnum){
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"datafileDel", dnum);
	}
	
	//파일 하나 지우기
	public int fileDelOne(String saveName){
		return sqlSession.delete(namespace+"datafileDelOne",saveName);
	}

	
		
}
