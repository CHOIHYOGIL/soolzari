package com.soolzari.shop.client.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.soolzari.shop.client.model.service.ClientService;
import com.soolzari.shop.client.model.vo.Class_List;
import com.soolzari.shop.client.model.vo.Client;
import com.soolzari.shop.client.model.vo.Goods;
import com.soolzari.shop.client.model.vo.KakaoAccessToken;
import com.soolzari.shop.client.model.vo.KakaoUserInfo;
import com.soolzari.shop.client.model.vo.NaverLoginBO;
import com.soolzari.shop.client.model.vo.Reservation;
import com.soolzari.shop.client.model.vo.Subscribe;


@Controller
public class ClientController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	this.naverLoginBO = naverLoginBO;
	}

	
	
	@Autowired
	ClientService service;
	
	
	
	@RequestMapping("/login.sool")
	public String login(Model model, HttpSession session) {
		
		System.out.println("로그인 컨트롤러");
		return "client/login";
	}
	@RequestMapping("/reservation.sool")
	public String reservation(Model model, HttpSession session) {
		
		System.out.println("예약페이지로 이동");
		return "client/reservation";
	}
	@RequestMapping("/reservation_intro.sool")
	public String reservationIntro(Model model, HttpSession session) {
		
		System.out.println("예약 안내 페이지로 이동");
		return "client/reservation_introduce";
	}
	
	
	@RequestMapping(value="/loginNaver.sool", method= {RequestMethod.GET, RequestMethod.POST})
	public void loginNaver(Model model, HttpSession session, HttpServletResponse httpServletResponse) throws IOException {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);
		/* 네이버 로그인 페이지로 이동*/
		httpServletResponse.sendRedirect(naverAuthUrl);  
	
	}
	
	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
	System.out.println("여기는 callback");
	OAuth2AccessToken oauthToken;
	oauthToken = naverLoginBO.getAccessToken(session, code, state);
	//1. 로그인 사용자 정보를 읽어온다.
	apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
	/** apiResult json 구조
	{"resultcode":"00",
	"message":"success",
	"response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
	**/
	//2. String형식인 apiResult를 json형태로 바꿈
	JSONParser parser = new JSONParser();
	Object obj = parser.parse(apiResult);
	JSONObject jsonObj = (JSONObject) obj;
	//3. 데이터 파싱
	//Top레벨 단계 _response 파싱
	JSONObject response_obj = (JSONObject)jsonObj.get("response");
	//response의 nickname값 파싱
	String nickname = (String)response_obj.get("nickname");
	String name=(String)response_obj.get("name");
	System.out.println("이름 : "+name);
	System.out.println(nickname);
	//4.파싱 닉네임 세션으로 저장
	if(name!=null) {
		model.addAttribute("msg","네이버 로그인 성공");
		session.setAttribute("sessionId",name); //세션 생성
		model.addAttribute("result", apiResult);
		model.addAttribute("name",name);
		model.addAttribute("loc","/");
	}else {
		model.addAttribute("msg","네이버 로그인 실패");
		model.addAttribute("loc","client/login");
	}
	
	
	return "common/msg";
	}
	//로그아웃
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session,Model model)throws IOException {
	System.out.println("여기는 logout");
	session.invalidate();
	model.addAttribute("msg","로그아웃 성공");
	model.addAttribute("loc","/");
	return "common/msg";
	}
	
	
	@RequestMapping(value="/kakaologin", produces="application/json", method=RequestMethod.GET)
	  public String kakaologin(@RequestParam("code") String code, RedirectAttributes ra, HttpSession session, Model model,
			  HttpServletResponse response) throws IOException{
		
		System.out.println("kakao code: "+code);
		  JsonNode accessToken;
		  
	        // JsonNode트리형태로 토큰받아온다
	        JsonNode jsonToken = KakaoAccessToken.getKakaoAccessToken(code);
	        // 여러 json객체 중 access_token을 가져온다
	        accessToken = jsonToken.get("access_token");
	 
	        System.out.println("access_token : " + accessToken);

	        // access_token을 통해 사용자 정보 요청
	        JsonNode userInfo = KakaoUserInfo.getKakaoUserInfo(accessToken);
	 
	        // Get id
	        String id = userInfo.path("id").asText();
	        String name = null;
	        String email = null;
	 
	        // 유저정보 카카오에서 가져오기 Get properties
	        JsonNode properties = userInfo.path("properties");
	        JsonNode kakao_account = userInfo.path("kakao_account");
	        
	        name = properties.path("nickname").asText();
	        email = kakao_account.path("email").asText();
	 
	        System.out.println("id : " + id);
	        System.out.println("name : " + name);
	        System.out.println("email : " + email);
	        if(name!=null && email!=null) {
	        	  model.addAttribute("msg","카카오 로그인 성공");
	        		model.addAttribute("loc","/");
	        		session.setAttribute("sessionId",name); //세션 생성
	        }else {
	        	  model.addAttribute("msg","카카오 로그인 실패");
	        		model.addAttribute("loc","/");
	        }
	      

	        return "common/msg";
	}

	@RequestMapping("/register.sool")
	public String join(Client c , Model model) {
		System.out.println("register");
		System.out.println(c.getClientAge());
		c.setClientAddr(c.getClientAddr()+" "+c.getClientAddr1()+" "+c.getClientAddr2()+" "+c.getClientAddr3());
		int result = service.insertClient(c);
		
		if(result>0) {
			model.addAttribute("msg","회원가입 성공");
			model.addAttribute("msg","회원가입 기념 3000 포인트 지급");
		}else {
			model.addAttribute("msg","회원가입 실패");
			
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	@RequestMapping("/loginCheck.sool")
	public String loginCheck(Client c, HttpSession session, Model model) {
		
		System.out.println(c.getClientId());
		System.out.println(c.getClientPw());
		Client client=service.selectOneClient(c);
		System.out.println("no : "+client.getClientNo());
		System.out.println("Controller : "+client);
		if(client!=null) {
			session.setAttribute("sessionId", client.getClientId());
			session.setAttribute("sessionNo", client.getClientNo());
			session.setAttribute("sessionName", client.getClientName());
			session.setAttribute("sessionEmail", client.getClientEmail());
			session.setAttribute("sessionPhone", client.getClientTel());
			session.setAttribute("sessionAddr", client.getClientAddr());
			session.setAttribute("sessionPoint", client.getClientPoint());
			session.setAttribute("sessionSubscribe", client.getClientRank());
		
			model.addAttribute("msg","로그인 성공");
		}else {
			model.addAttribute("msg","아이디 또는 비밀번호를 확인해주세요");
		}
		model.addAttribute("loc","/");
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping("/ajaxCheckId.sool")
	public int CheckId(Client c) {

		Client client=service.checkId(c);
	
		if(client!=null) {
			return 0;
		}else {
			return 1;
		}
		
	}
	
	@ResponseBody
	@RequestMapping("/getClassDB.sool")
	public ArrayList<Reservation> getClassInfo(Model model) {
		System.out.println("getClassDB");
		ArrayList<Reservation> list = service.getClassInfo();
		
		System.out.println("list:"+list);
		return list;
		
	}

	@RequestMapping("/basicSool.sool")
	public String basicSool(Model model, String searchWord) {
		
		
		
		System.out.println("hihi");
		System.out.println(searchWord);
		ArrayList<Goods> list=service.getGoods(searchWord);
		
		System.out.println("goodslist : "+list );
	

	
		model.addAttribute("list",list);
	
		return "client/takju";
		
	}
	
	@ResponseBody
	@RequestMapping(value="/checkUser.sool", produces="application/json;charset=utf-8")
	public String checkUser(Model model, int classNo, int session) {
		System.out.println("checkuser");
		System.out.println("classNo : "+classNo);
		System.out.println("clientNo" +session);
		JsonObject obj = new JsonObject();
		ArrayList<Class_List> list=service.checkUser(session,classNo);
		System.out.println("list : "+list);
		if(list.size()!=0) {
			System.out.println("here");
			obj.addProperty("msg", "이미 예약하신 클래스입니다");
	
		}else {
			obj.addProperty("msg", "예약 가능합니다.");
		}
		return new Gson().toJson(obj);
	}
	
	@ResponseBody
	@RequestMapping("/setClassListDB.sool")
	public String setClassList(Model model, int eventDB, int session,int person, String today,Class_List c){
		System.out.println("setClassDB");

		c.setClassNo(eventDB);
		c.setClassPayment(today);
		c.setClassPerson(person);
		c.setClientNo(session);
		
			int result = service.setClassList(c);
			
			if(result>0) {
				model.addAttribute("msg","클래스 리스트 삽입 성공");
			
			}else {
				model.addAttribute("msg","클래스 리스트 삽입 실패");
				
			}
		
		

		return "common/msg";
	}
	
	@RequestMapping("/subscribe.sool")
	public String subscribe(Model model) {
		System.out.println("subscribe");
		return "client/subscribe";
	}
	
	
	@RequestMapping("/setSubscribe.sool")
	public String setSubscribe(Model model, String name, int price, Subscribe sub) {
		System.out.println("setSubscribe");
		System.out.println("name:"+name);
	
		sub.setSubscribeName(name);
		sub.setSubscribePrice(price);
		
		if(name.equals("술자리 구독세트 A")) {
			sub.setSubscribeDept("4인이 적당");
		}else {
			sub.setSubscribeDept("8인이 적당");
		}
		ArrayList<Subscribe> list=service.setSubscribe(sub);
		
		model.addAttribute("list",list);
		return "client/subscribe";
	}
	
	@RequestMapping("/setUsergrade.sool")
	public String setUsergrade(String id, Model model) {
		
		System.out.println("name : "+id);
		int result=service.setUsergrade(id);
		if(result>0) {
		
			model.addAttribute("msg","구독 신청 성공");
		}else {
			model.addAttribute("msg","구독 신청 실패");
		}
		model.addAttribute("loc","/");
		return "common/msg";
		
		
	}
//	@RequestMapping("/classRegister.sool")
//	public String classRegister(Reservation r,Model model ) {
//		
//		System.out.println(r.getClassEnroll());
//		int result=service.reservation(r);
//		
//		if(result>0) {
//			model.addAttribute("msg","클래스 예약 성공");
//			
//		}else {
//			model.addAttribute("msg","클래스 예약 실패");
//			
//		}
//		model.addAttribute("loc","/");
//		return "common/msg";
//		
//	}

}

	
	
