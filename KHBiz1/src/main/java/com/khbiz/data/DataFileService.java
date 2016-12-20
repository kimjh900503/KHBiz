package com.khbiz.data;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class DataFileService {
	
	@Inject
	private DataFileDAO datafileDAO; 
	
	//파일에 쓰기 
	public void fileWrite(DataFileDTO d,Model model){
		int result = datafileDAO.fileWrite(d);
	}
	
	//파일 리스트 가져오기 
	public void fileList(int dnum, Model model){
		List<DataFileDTO> list = datafileDAO.fileList(dnum);
		ArrayList<DataFileDTO> list2 = new ArrayList<DataFileDTO>();
		System.out.println("datafileService");
		for(DataFileDTO d: list){
			System.out.println(d.getOriginName());
			if(d.getOriginName()!=null){
				list2.add(d);
			}
		}
		model.addAttribute("fileList",list2);
	}
	
	//파일 지우기 
	public int fileDel(int dnum){
		return datafileDAO.fileDel(dnum);
	}
	
	//파일 하나 지우기
	public int fileDelOne(String saveName){
		return datafileDAO.fileDelOne(saveName);
	}
	
	

}
