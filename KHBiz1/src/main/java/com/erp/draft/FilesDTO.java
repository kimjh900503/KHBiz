package com.erp.draft;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FilesDTO {
	
	
	private String sheet_code;
	private String code;
	private String originalFileName;
	private String fileName;
	public String getSheet_code() {
		return sheet_code;
	}
	public void setSheet_code(String sheet_code) {
		this.sheet_code = sheet_code;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	



}
