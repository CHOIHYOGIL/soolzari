package com.soolzari.shop.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AcceptDao {
	@Autowired
	private SqlSessionTemplate session;

}
