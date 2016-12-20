package com.khbiz.data;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.khbiz.util.PageMaker;


@Repository
public class DataBoardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private String namespace = "DataMapper.";

	//리스트 
	public List<DataBoardDTO> boardList(PageMaker pm,String type, String str){
		// TODO Auto-generated method stub
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("startRowNum",pm.getStartRowNum());
		map.put("lastLowNum",pm.getlastRowNum());
		if(type!=null && str!=null){
			map.put("type",type);
			map.put("str","%"+str+"%");
		}
		else if(type!=null && str==null){
			map.put("type",type);
			map.put("str","%");
		}
		else{
			map.put("type",type);
			map.put("str",str);
		}
		System.out.println("dao 부분");
		System.out.println("type:"+type);
		System.out.println("str:"+str);
		return sqlSession.selectList(namespace+"databoardList", map);
	}

	//count 
	public int getCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"databoardCount");
	}

	//view
	public DataBoardDTO boardView(int num) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+"databoardView",num);
	}
	
	//가장 큰 번호 가져오기 
	public int getMaxNum(){
		int result = 0;
		try {
			result = sqlSession.selectOne(namespace+"getMaxNum");
		} catch (Exception e) {
			result = 0;
		}
		return result+1;
	}

	//write
	public int boardWrite(DataBoardDTO b){
		// TODO Auto-generated method stub
		
		return sqlSession.insert(namespace+"databoardWrite",b);
	}

	//수정 
	public int boardMod(DataBoardDTO b){
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+"databoardMod",b);
	}
	
	//삭제 
	public int boardDel(int num){
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+"databoardDel", num);
	}

	//파일명 존재하지는 검사
	public List<String> selectOriginName(String originName,int dnum){
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("originName",originName);
		map.put("dnum",dnum);
		return sqlSession.selectList(namespace+"selectOriginName", map);
	}

}
