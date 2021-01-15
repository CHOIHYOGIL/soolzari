package com.soolzari.shop.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.soolzari.shop.client.model.service.ClientService2;

@Component
public class ClassScheduler {
	
	@Autowired
	private ClientService2 service;
	
	//클래스체험하는날 다음날0시에 체험완료로 보이게 update
	@Scheduled(cron = "* * 0 * * *")
	public void classCheckUpdate() {
		service.classCheckUpdate();
	}
}
