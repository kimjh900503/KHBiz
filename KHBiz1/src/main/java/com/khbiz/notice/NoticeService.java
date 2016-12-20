package com.khbiz.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.khbiz.util.PageMaker;



@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	//글쓰기
	public int noticeWrite(NoticeDTO noticeDTO)throws Exception{
		return noticeDAO.noticeWrite(noticeDTO);
	}
	//글리스트
	public List<NoticeDTO> noticeList(PageMaker pm)throws Exception{
		return noticeDAO.noticeList(pm);
	}
	//글내용보기
	public NoticeDTO noticeView(NoticeDTO noticeDTO)throws Exception{
		return noticeDAO.noticeView(noticeDTO);
	}
	//글수정
	public int noticeMod(NoticeDTO noticeDTO)throws Exception{
		return noticeDAO.noticeMod(noticeDTO);
	}
	//글삭제
	public int noticeDelete(NoticeDTO noticeDTO)throws Exception{
		return noticeDAO.noticeDelete(noticeDTO);
	}
	//총 글수
	public int noticeCount()throws Exception{
		return noticeDAO.noticeCount();
	}
	public int noticeHits(NoticeDTO noticeDTO)throws Exception{
		return noticeDAO.noticeHits(noticeDTO);
	}
}
