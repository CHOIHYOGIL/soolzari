package com.soolzari.shop.seller.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.soolzari.shop.seller.model.vo.Class;
import com.soolzari.shop.seller.model.vo.Funding;
import com.soolzari.shop.seller.model.vo.FundingGoods;
import com.soolzari.shop.seller.model.vo.Goods;
import com.soolzari.shop.seller.model.vo.Image;
import com.soolzari.shop.seller.model.vo.Score;
import com.soolzari.shop.seller.model.vo.Seller;

@Repository
public class SellerDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertSeller(Seller s) {
		return sqlSession.insert("seller.insertSeller",s);
	}

	public Seller selectOneSeller(Seller s) {
		return sqlSession.selectOne("seller.selectOneSeller",s);
	}

	public ArrayList<Goods> selectAllGoods() {
		List<Goods> list = sqlSession.selectList("seller.selectAllGoods");
		return (ArrayList<Goods>)list;
	}


	public ArrayList<Class> selectAllClass(HashMap<String, Integer> pageNo) {
		List<Class> list = sqlSession.selectList("seller.selectAllClass", pageNo);
		return (ArrayList<Class>)list;
	}
	
	public int classTotalCount() {
		return sqlSession.selectOne("seller.classTotalCount");
	}
	
	public int goodsTotalCount() {
		return sqlSession.selectOne("seller.goodsTotalCount");
	}

	public ArrayList<Goods> selectAllGoods(HashMap<String, Integer> pageNo) {
		List<Goods> list = sqlSession.selectList("seller.selectAllGoods", pageNo);
		return (ArrayList<Goods>)list;
	}

	public int insertGoods(Goods g) {
		return sqlSession.insert("seller.insertGoods",g);
	}
	
	public int insertImage(Image i) {
		return sqlSession.insert("seller.insertImage",i);
	}

	public int searchLastGoods() {
		return sqlSession.selectOne("seller.searchLastGoods");
	}

	public Goods selectOneGoods(int gdsNo) {
		return sqlSession.selectOne("seller.selectOneGoods",gdsNo);
	}

	public Image selectOneImage(int No, int num) {
		System.out.println("image Dao:"+No);
		if(num==1) {
			return sqlSession.selectOne("seller.selectOneImageGoodsOne",No);
		}else if(num==2) {
			return sqlSession.selectOne("seller.selectOneImageGoodsTwo",No);
		}else if(num==3) {
			return sqlSession.selectOne("seller.selectOneImageFundingOne",No);
		}else if(num==4) {
			return sqlSession.selectOne("seller.selectOneImageFundingTwo",No);
		}
		return null;
	}

	public Score selectOneScore(int gdsNo) {
		return sqlSession.selectOne("seller.selectOneScore",gdsNo);
	}

	public int addClass(Class cls) {
		System.out.println("classDao: "+cls);;
		return sqlSession.insert("seller.insertClass",cls);
	}

	public int modifyGoods(Goods g) {
		return sqlSession.update("seller.updateGoods",g);
	}

	public int deleteGoods(int temp) {
		System.out.println("dao temp:"+temp);
		return sqlSession.delete("seller.deleteGoods",temp);
	}

	public Class getClassInfo(int classNo) {
	
		System.out.println("dao classNo : "+classNo);
		return sqlSession.selectOne("seller.getClassInfo",classNo);
		
	}

	public ArrayList<Funding> selectAllFunding(HashMap<String, Integer> pageNo) {
		List<Funding> list = sqlSession.selectList("seller.selectAllFunding", pageNo);
		return (ArrayList<Funding>)list;
	}

	public int FundingTotalCount() {
		return sqlSession.selectOne("seller.fundingTotalCount");
	}

	public Funding selectOneFunding(int fundNo) {
		return sqlSession.selectOne("seller.selectOneFunding",fundNo);
	}

	public ArrayList<FundingGoods> selectAllFundingGoods(int fundNo) {
		List<FundingGoods> list = sqlSession.selectList("seller.selectAllFundingGoods", fundNo);
		return (ArrayList<FundingGoods>)list;
	}

	public int insertFunding(Funding f) {
		return sqlSession.insert("seller.insertFunding",f);
	}

	public int searchLastFunding() {
		return sqlSession.selectOne("seller.selectLastFunding");
	}
	
	
}
