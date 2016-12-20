package com.khbiz.chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChatFileService {

	@Autowired
	private ChatFileDAO cdao;
	
	public void fileUpload(ChatFileDTO cf,String cname){
		int result = cdao.fileUpload(cf, cname);
		System.out.println("db에 파일 insert 결과 : "+result);
	}
}
