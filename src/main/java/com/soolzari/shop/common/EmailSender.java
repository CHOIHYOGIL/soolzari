package com.soolzari.shop.common;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import com.soolzari.shop.client.model.vo.Client2;

public class EmailSender {
/*
	@Autowired
    protected JavaMailSenderImpl mailSender;
	
	public void sendEmail(ArrayList<Client2> clientList) throws Exception {
        
        MimeMessage msg = mailSender.createMimeMessage();
         
        try {
            msg.setSubject(email.getSubject());
            if ( StringUtils.isEmpty(email.getHtmlYn()) == false && email.getHtmlYn().equals("Y") ) {
                msg.setText(email.getContent(), "utf-8", "html");
            } else {
                msg.setText(email.getContent());
            }
            msg.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email.getReceiver()));
        } catch(MessagingException e) {
            log.error("Email MessageException...");
            log.debug(e.getMessage());
        }
         
        try {
            mailSender.send(msg);
        } catch(MailException e) {
            log.error("Email MailException...");
            log.debug(e.getMessage());
        }
    }
    */
}
