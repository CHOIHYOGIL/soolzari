<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mypageFrm.css">
<link rel="stylesheet" type="text/css" href="/resources/css/mchkPw.css">
	<div class="wrap" style="margin-top: 80px;">
		<div class="sideNavi">
			<ul class="sideNaviUl">
				<a class="sideNaviTop" href="#">마이페이지</a>
				<li><a class="sideNaviA a1" href="#">주문 내역</a></li>
				<li><a class="sideNaviA a2" href="#">예약한 클래스</a></li>
				<li><a class="sideNaviA a3" href="#">후원한 펀딩</a></li>
				<li><a class="sideNaviA a4" href="#">선물함</a></li>
				<li><a class="sideNaviA a5" href="#">내가 쓴 리뷰</a></li>
				<li><a class="sideNaviA a6" href="#">1:1 문의</a></li>
				<li><a class="sideNaviA a7" href="#">내 정보 수정</a></li>
			</ul>
		</div>
		<div class="content">
			<div class="banner">
				<h1><a class="bannerTitle" href="#">마이페이지</a></h1>
			</div>
			<div class="mainContent">
				<form action="/client/mInfoCheckPw.sool" method="post">
				<input type="hidden" name="cliNo" value="${sessionScope.sessionClient.cliNo }">
				<h2 class="contentTitle">회원정보 수정</h2>
				<hr class="hrMargin">
				<div class="allInfoDiv">
					<div class="infoDiv">
						<h3>비밀번호 확인</h3>
						<table class="table">
						  <tbody>
						    <tr>
						      <th scope="row">아이디</th>
						      <td class="td2"><input type="text" name="cliId" value="${sessionScope.sessionClient.cliId }" readonly="readonly"></td>
						    </tr>
						    <tr>
						      <th scope="row">비밀번호</th>
						      <td class="td2"><input type="password" name="cliPw"></td>
						    </tr>
						  </tbody>
						</table>
					</div>
				</div>
				<div class="btnDiv">
					<button type="submit" class="btn updateBtn">확인</button>
				</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
		//사이드바 호버
		$(".sideNaviA").hover(function(){
			if(!$(this).is(".a7")){
				$(".a7").css("background-color","white");
				$(".a7").css("color","black");
			}
		},function(){
			$(".a7").css("background-color","rgb(77, 80, 117)");
			$(".a7").css("color","white");
		});
		
		//수정버튼 클릭시 제한
		$(".updateBtn").click(function(event){
			if($("input[name=cliPw]").val()==''){
				alert("비밀번호를 입력해주세요");
				event.preventDefault();
			}
		});
	</script>
</body>
</html>