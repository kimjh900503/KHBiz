package com.khbiz.erp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.khbiz.email.EmailService;
import com.khbiz.email.EmailVO;
import com.khbiz.member.MemberDTO;

@Controller
@RequestMapping(value="/email")
public class EmailController {
	
    @Autowired
    private EmailService emailService;
     
    @RequestMapping(value="/send")
    public String sendMail(MemberDTO memberDTO,RedirectAttributes rd) {
    	
    	String message="";

        EmailVO email = new EmailVO();
         
        String receiver = memberDTO.getId(); //Receiver.
        String subject = "kh비즈  비밀번호입니다";
        String content = "비밀번호는[ "+memberDTO.getPw()+" ]입니다";
         
        email.setReceiver(receiver);
        email.setSubject(subject);
        email.setContent(content);
        boolean result = false;
		try {
			result = emailService.sendMail(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        if(result == true){
        	message="email이 발송되었습니다";
        	rd.addFlashAttribute("message", message);
        }else{
        	message="email이 발송되지 않았습니다";
        	rd.addFlashAttribute("message", message);
        }
        
        return "redirect:/";
    }

}
