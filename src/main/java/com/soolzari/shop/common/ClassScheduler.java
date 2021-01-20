package com.soolzari.shop.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.soolzari.shop.client.model.dao.ClientDao2;
import com.soolzari.shop.client.model.service.ClientService2;

@Component
public class ClassScheduler {
	
	@Autowired
	private ClientService2 service;
	@Autowired
	private ClientDao2 dao;
	
	//클래스체험하는날 다음날0시에 체험완료로 보이게 update
	@Scheduled(cron = "0 0 0 * * *")
	public void classCheckUpdate() {
		service.classCheckUpdate();
	}
	
	//펀딩 종료일에 목표달성이 됐으면 fnd_d_status를 1로 update(결제하라는 버튼표시) + 결제알림 메일전송필요...
	//펀딩 종료일에 목표미달성이 됐으면 fnd_d_status를 7로 update(미결제취소 표시)
	@Scheduled(cron = "0 0 0 * * *")
	public void fndDStatusUpdate() {
		service.fndDStatusUpdate();
	}
}
