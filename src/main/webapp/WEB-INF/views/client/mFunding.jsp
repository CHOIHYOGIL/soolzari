<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후원한 펀딩</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/client/mypageFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mFunding.css">

<div class="wrap">
	<div class="sideNavi"></div>
	<div class="content">
		<div class="mainContent">
			<div class="listDiv">
				<table class="listTable">
					<tr>
						<th class="th1">펀딩번호</th>
						<th class="th2">펀딩 정보</th>
						<th class="th3">판매자</th>
						<th class="th4">결제일자</th>
						<th class="th5">리뷰</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
	//사이드바 호버
	$(".sideNaviA").hover(function(){
		if(!$(this).is(".a3")){
			$(".a3").css("background-color","white");
			$(".a3").css("color","black");
		}
	},function(){
		$(".a3").css("background-color","rgb(77, 80, 117)");
		$(".a3").css("color","white");
	});
</script>
</html>