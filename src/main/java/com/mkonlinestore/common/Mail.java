package com.mkonlinestore.common;

import org.apache.log4j.Logger;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;

public class Mail {
	private Logger logger = Logger.getLogger(Mail.class);
	
	@Autowired
	private MailSender mailSender;  
	   
    public MailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(MailSender mailSender) {  
        this.mailSender = mailSender;  
    }  
   
    public boolean sendMail(String from, String to, String subject, String msg) {  
    	boolean result = false;
		
		try {
			//creating message  
	        SimpleMailMessage message = new SimpleMailMessage();  
	        message.setFrom(from);  
	        message.setTo(to);  
	        message.setSubject(subject);  
	        message.setText(msg);  
	        //sending message  
	        mailSender.send(message);     
			result = true;
		}
		catch(HibernateException ex) {
			logger.error(ex);
			throw ex;
		}
		finally {
			
		}
		
		return result;
    } 

}
