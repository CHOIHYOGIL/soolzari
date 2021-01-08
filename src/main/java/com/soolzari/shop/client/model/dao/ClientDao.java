package com.soolzari.shop.client.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.client.model.vo.Reservation;

@Repository
public class ClientDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertClient(Client c) {
		
		return sqlSession.insert("client.insertClient",c);
	}

	public Client selectOneClient(Client c) {
		System.out.println("loginDAO");
		System.out.println("DAO C : "+c);
		System.out.println(c.getClientId());
		System.out.println(c.getClientPw());
		return sqlSession.selectOne("client.selectOneClient",c);
	}

	public Client checkId(Client c) {
	
		return sqlSession.selectOne("client.checkId",c);
	}

	public int reservation(Reservation r) {
		
		return sqlSession.insert("client.reservationClass",r);
	}

}
