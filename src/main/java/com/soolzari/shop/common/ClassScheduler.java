package com.soolzari.shop.common;

import java.util.ArrayList;
import java.util.HashMap;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.soolzari.shop.client.model.dao.ClientDao2;
import com.soolzari.shop.client.model.service.ClientService2;
import com.soolzari.shop.client.model.vo.Client2;

@Component
public class ClassScheduler {
	
	@Autowired
	private ClientService2 service;
	@Autowired
	private ClientDao2 dao;
	@Autowired 
	private JavaMailSenderImpl mailSender;
	
	//클래스체험하는날 다음날0시에 체험완료로 보이게 update
	@Scheduled(cron = "0 0 0 * * *")
	public void classCheckUpdate() {
		service.classCheckUpdate();
	}
	
	//펀딩 종료일에 목표달성이 됐으면 fnd_d_status를 1로 update(결제하라는 버튼표시) + 결제알림 메일전송필요...
	//펀딩 종료일에 목표미달성이 됐으면 fnd_d_status를 7로 update(미결제취소 표시) + 후원실패 메일
	@Scheduled(cron = "0 0 8 * * *")
	public void fndDStatusUpdate() {
		//달성/미달성 여부 업뎃하고
		HashMap<String, ArrayList<Client2>> map = service.fndDStatusUpdate();//달성/미달성 후원자들의 이메일값을 가져옴
		
		try {
			for(Client2 y : map.get("clientYList")) {
				MimeMessage mm = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(mm, true, "UTF-8");
				helper.setFrom("jinseon038@gmail.com"); 
				helper.setTo(y.getCliEmail()); 
				helper.setSubject("펀딩 목표 달성!"); 
				helper.setText("<h3>후원하신 펀딩의 목표가 달성되었습니다!!</h3><br>지금 확인하세요~<br><a href='http://192.168.0.13/'>술자리soolzari로 이동하기</a><br>일주일 내에 미결제 시 자동 취소됩니다.",true);
				mailSender.send(mm);
			}
			for(Client2 n : map.get("clientNList")) {
				MimeMessage mm = mailSender.createMimeMessage();
				MimeMessageHelper helper = new MimeMessageHelper(mm, true, "UTF-8");
				helper.setFrom("jinseon038@gmail.com"); 
				helper.setTo(n.getCliEmail()); 
				helper.setSubject("펀딩 목표 실패!"); 
				helper.setText("<h3>후원하신 펀딩이 목표금액을 달성하지 못했습니다..</h3><br>새로운 펀딩을 기대해주세요~<br><a href='http://192.168.0.13/'>술자리soolzari로 이동하기</a>",true);
				mailSender.send(mm);
			}
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
