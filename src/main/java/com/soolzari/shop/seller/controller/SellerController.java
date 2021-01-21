package com.soolzari.shop.seller.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.soolzari.shop.common.FileNameOverlap;
import com.soolzari.shop.seller.model.service.SellerService;
import com.soolzari.shop.seller.model.vo.Goods;
import com.soolzari.shop.seller.model.vo.GoodsDetail;
import com.soolzari.shop.seller.model.vo.GoodsPage;
import com.soolzari.shop.seller.model.vo.Image;
import com.soolzari.shop.seller.model.vo.Score;
import com.soolzari.shop.seller.model.vo.Seller;
import com.soolzari.shop.seller.model.vo.Class;
import com.soolzari.shop.seller.model.vo.ClassPage;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private SellerService service;
	
	@RequestMapping("/regist.sool")
	public String regist() {
		return "seller/sellerRegist";
	}
	
	@RequestMapping("/login.sool")
	public String login() {
		return "seller/sellerLogin";
	}
	
	@RequestMapping("/sellerMain.sool")
	public String main() {
		return "seller/sellerMain";
	}
	
	@RequestMapping("/goodsAdd.sool")
	public String goodsAdd() {
		return "seller/sellerGoodsAdd";
	}
	
	@RequestMapping("/goodsList.sool")
	public String goodsList(int reqPage, Model model) {
		GoodsPage gp = service.selectAllGoods(reqPage);
		model.addAttribute("list", gp.getList());
		model.addAttribute("page",gp.getPage());
		return "seller/sellerGoodsList";
	}
	
	@RequestMapping("/classAdd.sool")
	public String classAdd() {
		return "seller/sellerClassAdd";
	}
	
	@RequestMapping("/classList.sool")
	public String classList(int reqPage, Model model) {
		ClassPage cp = service.selectAllClass(reqPage);
		model.addAttribute("list",cp.getList());
		model.addAttribute("page",cp.getPage());
		return "seller/sellerClassList";
	}
	
	//로그인
	@RequestMapping("/loginCheck.sool")
	public String login(Seller s, HttpSession session, Model model) {
		System.out.println(s);
		Seller seller = service.selectOneSeller(s);
		System.out.println(seller);
		if(seller!=null) {
			session.setAttribute("sessionSeller", seller);
			model.addAttribute("loc","/seller/sellerMain.sool");
			model.addAttribute("msg","로그인 성공");
		}else {
			model.addAttribute("loc","/seller/login.sool");
			model.addAttribute("msg","아이디 혹은 비밀번호가 다르거나 존재하지 않는 회원입니다");
		}
		return "common/msg";
	}
	
	//회원가입
	@RequestMapping("/registChk.sool")
	public String registChk(Seller s, Model model) {
		
		int result = service.insertSeller(s);
		System.out.println(s.getSelPw());
		System.out.println(s.getSelName());
		
		if(result>0) {
			model.addAttribute("msg","회원가입이 완료되었습니다");
		}else {
			model.addAttribute("msg","회원가입이 실패했습니다.");
		}
		model.addAttribute("loc","/seller/login.sool");
		return "common/msg";
	}
	
	//상품등록
	@RequestMapping("/insertGoods.sool")
	public String insertGoods(Goods g, MultipartFile file, Model model, HttpServletRequest request) {
		//상품등록
		System.out.println("HIHI");
		System.out.println(g);
		System.out.println(file);
		
		g.setStatus(1);
		g.setGdsBcnt(0);
		int result = service.insertGoods(g);
		System.out.println(result);
		int gdsNo = service.searchLastGoods();
		//이미지 업로드
		String root = request.getSession().getServletContext().getRealPath("/");
		System.out.println("root : "+root);
		String path = root+"resources/upload/";
		System.out.println("path:"+path);
		Image i = new Image();
			if(!file.isEmpty()) {
				String filename = file.getOriginalFilename();
				String filepath = new FileNameOverlap().rename(path, filename);
				try {
					byte[] bytes = file.getBytes();
					File upFile = new File(path+filepath);
					FileOutputStream fos = new FileOutputStream(upFile);
					BufferedOutputStream bos = new BufferedOutputStream(fos);
					bos.write(bytes);
					bos.close();
					i.setFilename(filename);
					i.setFilepath(filepath);
					i.setImgType("g");
					i.setTypeNo(gdsNo);
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		int result2 = service.insertImage(i);
		
		if(result>0 && result2>0) {
			model.addAttribute("msg","상품 등록이 완료되었습니다.");
		}else if(result>0 && !(result2>0)) {
			model.addAttribute("msg","이미지등록 실패");
		}else if(!(result>0) && result2>0){
			model.addAttribute("msg","글작성 실패 이미지등록 성공");
		}else {
			model.addAttribute("msg","상품 등록이 실패했습니다.");
		}
		model.addAttribute("loc","/seller/goodsList.sool?reqPage=1");
		return "common/msg";
	}
	
	@RequestMapping("goodsDetail.sool")
	public String goodsDetail(int gdsNo, Model model) {
		String type = "g";
		Goods g = service.selectOneGoods(gdsNo);
		Image i = service.selectOneImage(gdsNo);
		Score s = service.selectOneScore(gdsNo);
		GoodsDetail gd = new GoodsDetail();
		gd.setGdsNo(g.getGdsNo());
		gd.setGdsName(g.getGdsName());
		gd.setGdsPri(g.getGdsPri());
		gd.setGdsBcnt(g.getGdsBcnt());
		gd.setSelNo(g.getSelNo());
		gd.setStatus(g.getStatus());
		gd.setGoodsDate(g.getGoodsDate());
		gd.setGoodsType(g.getGoodsType());
		gd.setFilepath(i.getFilepath());
		gd.setFilename(i.getFilename());
		gd.setImgType(i.getImgType());
		gd.setTypeNo(i.getTypeNo());
		gd.setAvgRevScore(s.getAvgRevScore());
		gd.setCountRevScore(s.getCountRevScore());
		
		model.addAttribute("gd",gd);
		return "seller/sellerGoodsDetail";
		
	}
	
	
}
