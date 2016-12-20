package com.khbiz.erp;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DownloadController {
     
     @RequestMapping("down")
     public String down (String fileName , Model model , HttpSession session){
           String path= session.getServletContext().getRealPath( "/resources/upload");
           File f = new File( path, fileName);
           System. out.println("controller");
            model.addAttribute("downloadFile", f);
            return "download";
     }
}
