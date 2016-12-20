package com.khbiz.notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.khbiz.util.PageMaker;



@Repository
public class NoticeDAO {
	@Autowired
	private SqlSession sqlSession;
	private String namespace="NoticeMapper.";
	
	//글쓰기
	public int noticeWrite(NoticeDTO noticeDTO)throws Exception{
		return sqlSession.insert(namespace+"noticeWrite", noticeDTO);
	}
	//글리스트
	public List<NoticeDTO> noticeList(PageMaker pm)throws Exception{
		return sqlSession.selectList(namespace+"noticeList",pm);
	}
	//글내용보기
	public NoticeDTO noticeView(NoticeDTO noticeDTO)throws Exception{
		return sqlSession.selectOne(namespace+"noticeView",noticeDTO);
	}
	//글수정
	public int noticeMod(NoticeDTO noticeDTO) throws Exception{
		return sqlSession.update(namespace+"noticeMod", noticeDTO);	
	}
	//글삭제
	public int noticeDelete(NoticeDTO noticeDTO) throws Exception{
		return sqlSession.delete(namespace+"noticeDelete", noticeDTO);
	}
	//총 글 수
	public int noticeCount()throws Exception{
		return sqlSession.selectOne(namespace+"noticeCount");
	}
	
	//조회수
	public int noticeHits(NoticeDTO noticeDTO)throws Exception{
		return sqlSession.update(namespace+"noticeHits",noticeDTO);
	}

}
