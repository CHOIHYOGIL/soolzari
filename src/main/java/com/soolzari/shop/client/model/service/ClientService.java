package com.soolzari.shop.client.model.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soolzari.shop.client.model.dao.ClientDao;
import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.client.model.vo.Reservation;

@Service
public class ClientService {

	@Autowired
	ClientDao dao;
	public int insertClient(Client c) {
		return dao.insertClient(c);
	}
	public Client selectOneClient(Client c) {
		return dao.selectOneClient(c);
	}
	public Client checkId(Client c) {
		return dao.checkId(c);
	}
	public int reservation(Reservation r) {
		
		return dao.reservation(r);
	}
}