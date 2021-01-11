package com.soolzari.shop.client.model.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.soolzari.shop.client.model.dao.ClientDao;
import com.soolzari.shop.client.model.vo.Class_List;
import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.client.model.vo.Goods;
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
	public ArrayList<Reservation> getClassInfo() {
		return dao.getClassInfo();
	}
	public int setClassList(int session, int eventDB) {
		
		return dao.setClassList(session,eventDB);
	}
	public ArrayList<Goods> getGoods(String searchWord) {
		return dao.getGoods(searchWord);
	}
	public ArrayList<Goods> fastSearch(String searchWord) {
		return dao.fastSearch(searchWord);
	}
	
	
	
}