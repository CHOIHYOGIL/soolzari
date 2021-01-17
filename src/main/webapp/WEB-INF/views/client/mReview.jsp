<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 쓴 리뷰</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>

<jsp:include page="/WEB-INF/views/client/mypageFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mReview.css">

<div class="wrap">
	<div class="sideNavi"></div>
	<div class="content">
		<div class="mainContent">
			<div class="listDiv">
				<table class="listTable">
					<tr>
						<th class="th1">구분</th>
						<th class="th2">상품 정보</th>
						<th class="th3">리뷰</th>
						<th class="th4">작성일자</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
	//사이드바 호버
	$(".sideNaviA").hover(function(){
		if(!$(this).is(".a5")){
			$(".a5").css("background-color","white");
			$(".a5").css("color","black");
		}
	},function(){
		$(".a5").css("background-color","rgb(77, 80, 117)");
		$(".a5").css("color","white");
	});
</script>
</body>

</html>