package com.khbiz.email;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service("emailService")
	public class EmailService {
	     
	    @Autowired
	    protected JavaMailSender  mailSender;

	    public boolean sendMail(EmailVO email) throws Exception {
	        try{
		        MimeMessage msg = mailSender.createMimeMessage();
		        InternetAddress addr = new InternetAddress("khfinaltest@gmail.com");
		        msg.setFrom(addr); // 송신자를 설정해도 소용없지만 없으면 오류가 발생한다
		        
		        msg.setSubject(email.getSubject());

		        // 일반 텍스트 전송
		        msg.setText(email.getContent());  


		        msg.setRecipient(RecipientType.TO , new InternetAddress(email.getReceiver()));
		         
		        mailSender.send(msg);
		        return true;
	        }catch(Exception ex) {
	        	ex.printStackTrace();
	        }
	        return false;
	    }
}
