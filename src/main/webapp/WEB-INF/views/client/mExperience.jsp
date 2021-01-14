<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약한 클래스</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/client/mypageFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mExperience.css">
<div class="wrap">
	<div class="sideNavi"></div>
	<div class="content">
		<div class="mainContent">
			<div class="listDiv">
				<table class="listTable">
					<tr>
						<th class="th1">예약번호/결제일자</th>
						<th class="th2">클래스 정보</th>
						<th class="th3">담당자</th>
						<th class="th4">체험일자</th>
						<th class="th5">취소신청</th>
					</tr>
					<c:choose>
						<c:when test="${fn:length(eList) eq null}">
							<tr>
								<td colspan="5">
									<p>예약한 클래스가 없습니다.</p>
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${eList}" var="eld" >
								<tr>
									<td>
										<p class="clsLNo">${eld.clsLNo }</p>
										<p>${eld.classPayment }</p>
									</td>
									<td>
										<p>${eld.clsName }</p>
										<p>인원 : ${eld.classPerson }</p>
										<p>가격 : ${eld.clsPrice }</p>
									</td>
									<td>
										<p>${eld.selName }</p>
										<p>${eld.selTel }</p>
									</td>
									<td>
										<p>${eld.classEnroll }</p>
										<p>${eld.classStartTime }</p>
									</td>
									<td>
										<c:choose>
											<c:when test="${eld.classCheck==0}">
												<button type="button" class="btn btn-outline-secondary btn-sm cancelBtn">취소신청</button>
											</c:when>
											<c:when test="${eld.classCheck==1 }">
												<p>취소승인<br> 대기중</p>
											</c:when>
											<c:otherwise>
												<p>취소완료</p>
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
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
		if(!$(this).is(".a2")){
			$(".a2").css("background-color","white");
			$(".a2").css("color","black");
		}
	},function(){
		$(".a2").css("background-color","rgb(77, 80, 117)");
		$(".a2").css("color","white");
	});
	
	$(function(){
		$(".giftSel").remove();//선물함 선택 안보이게
		//조회기간별 조회(1,3,6,12개월)
		$(".searchA").eq(0).attr("href","/client/mExperience.sool?reqPage=1&period=1");
		$(".searchA").eq(1).attr("href","/client/mExperience.sool?reqPage=1&period=3");
		$(".searchA").eq(2).attr("href","/client/mExperience.sool?reqPage=1&period=6");
		$(".searchA").eq(3).attr("href","/client/mExperience.sool?reqPage=1&period=12");
		$(".searchA").each(function(){
			console.log($(this).attr("id"));
			console.log("m"+${period});
			if($(this).attr("id")==("m"+${period})){
				
				$(this).addClass("a1");
			}
		});
	})
	
	$(".cancelBtn").click(function(){
		if(confirm("취소신청 하시겠습니까?\n판매자가 취소승인이후 환불이 진행됩니다.")){
			var clsLNo = $(this).parent().parent().find(".clsLNo").html();
			location.href="/client/classCancel.sool?clsLNo="+clsLNo;
		}
	})
</script>
</html>