package com.soolzari.shop.client.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soolzari.shop.client.model.dao.ClientDao;
import com.soolzari.shop.client.model.vo.Class_List;
import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.client.model.vo.Goods;
import com.soolzari.shop.client.model.vo.Reservation;
import com.soolzari.shop.client.model.vo.Subscribe;

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
	public ArrayList<Reservation> getClassInfo() {
		return dao.getClassInfo();
	}
	public int setClassList(int session, int eventDB, int person) {
		
		return dao.setClassList(session,eventDB,person);
	}
	public ArrayList<Goods> getGoods(String searchWord) {
		return dao.getGoods(searchWord);
	}
	
	public ArrayList<Subscribe> setSubscribe(Subscribe sub) {
		return dao.setSubscribe(sub);
	}
	public int setUsergrade(String id) {
	return dao.setUsergrade(id);
	}
	public ArrayList<Class_List> checkUser(int session, int classNo) {
		
		return dao.checkUser(session,classNo);
	}
	
	
	
}