<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/client/mypageFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mOrderList.css">

<div class="wrap2">
	<div class="sideNavi"></div>
	<div class="content">
		<div class="mainContent">
			<div class="listDiv">
				<table class="listTable">
					<tr>
						<th class="th1">주문번호/주문일자</th>
						<th class="th2">상품 정보</th>
						<th class="th3">총 결제 금액</th>
						<th class="th4">배송관리</th>
						<th class="th5">리뷰</th>
					</tr>
					<c:forEach items="${pList }" var="purchase" varStatus="status">
						<c:forEach items="${olDataList }" var="olData">
						<c:if test="${purchase.purNo eq olData.purNo}">
						<tr>
							<td class="rowSpan">
								<span class="gdsLNo" style="display: none;">${olData.gdsLNo }</span><!-- 배송관리 update할때전달해줄값 -->
								<p class="purNoRow">${purchase.purNo }</p>
								<p>${purchase.purDate }</p>
							</td>
							<td>
								<p>${olData.gdsName }</p>
								<p>개수 : ${olData.gdsLCnt }</p>
								<p>가격 : <span class="comma">${olData.gdsLPrice}</span>*${olData.gdsLCnt }=<span class="comma">${olData.gdsLPrice*olData.gdsLCnt }</span></p>
								<p>배송지 : ${purchase.purGet }</p>
							</td>
							<td>
								<p><span class="comma">${purchase.purTtp }</span></p>
							</td>
							<td>
								<c:if test="${olData.gdsDStatus==0}">
									<p>결제완료</p>
									<button type="button" class="btn btn-outline-secondary btn-sm cancelBtn">취소신청</button>
								</c:if>
								<c:if test="${olData.gdsDStatus==1}">
									<p>취소신청<br>승인대기중</p>
								</c:if>
								<c:if test="${olData.gdsDStatus==2}">
									<p>취소완료</p>
								</c:if>
								<c:if test="${olData.gdsDStatus==3}">
									<p>배송중</p>
								</c:if>
								<c:if test="${olData.gdsDStatus==4}">
									<p>배송완료</p>
									<button type="button" class="btn btn-outline-secondary btn-sm completeBtn">수취확인</button>
								</c:if>
								<c:if test="${olData.gdsDStatus==5}">
									<p>수취확인완료</p>
								</c:if>
							</td>
							<td>
								<p>리뷰작성</p>
							</td>
						</tr>
						</c:if>
						</c:forEach>
					</c:forEach>
					<tr>
						<td colspan="4" style="text-align: center;" id="pageNavi">${pageNavi }</td>
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
		if(!$(this).is(".a1")){
			$(".a1").css("background-color","white");
			$(".a1").css("color","black");
		}
	},function(){
		$(".a1").css("background-color","rgb(77, 80, 117)");
		$(".a1").css("color","white");
	});
	
	
	$(function(){
		$(".giftSel").remove();//선물함 선택 안보이게
		//조회기간별 조회(1,3,6,12개월)
		$(".searchA").eq(0).attr("href","/client/mOrderList.sool?reqPage=1&period=1");
		$(".searchA").eq(1).attr("href","/client/mOrderList.sool?reqPage=1&period=3");
		$(".searchA").eq(2).attr("href","/client/mOrderList.sool?reqPage=1&period=6");
		$(".searchA").eq(3).attr("href","/client/mOrderList.sool?reqPage=1&period=12");
		$(".searchA").each(function(){
			console.log($(this).attr("id"));
			console.log("m${period}");
			if($(this).attr("id")==("m${period}")){
				$(this).addClass("sA1");
			}
		});
		
		//가격에 콤마
		$(".comma").each(function(){
			$(this).html(commaSet($(this).html()));
		})
	});
	
	//취소신청
	$(".cancelBtn").click(function(){
		if(confirm("취소신청 하시겠습니까?\n판매자가 취소승인이후 환불이 진행됩니다.\n이미 배송이 진행됐을 경우 환불이 불가능할 수 있습니다.")){
			var gdsLNo = $(this).parent().parent().find(".gdsLNo").html();
			location.href="/client/orderDeliveryStatus.sool?gdsLNo="+gdsLNo+"&deliveryStatus="+1+"&reqPage="+${reqPage}+"&period="+${period};
		}
	})
	//수취확인
	$(".completeBtn").click(function(){
		if(confirm("상품을 확인하셨습니까?\n수취확인이후 환불이 불가능합니다.")){
			var gdsLNo = $(this).parent().parent().find(".gdsLNo").html();
			location.href="/client/orderDeliveryStatus.sool?gdsLNo="+gdsLNo+"&deliveryStatus="+5+"&reqPage="+${reqPage}+"&period="+${period};
		}
	})
	
	//금액단위 콤마 구분
	function commaSet(price) {
		var str = String(price);
		let price1 = str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return price1;
	}
	
	
	
	//주문번호가 같으면 rowspan으로 행합치게
	/* $(function(){
		var start = 0;
		var idx = 0;
		var rowSpan = 0;
		var removeStr = '';
		$(".purNoRow").each(function(index){
			start = index;
			var rowSpan = 0;
			if(start>=idx){
			$(".purNoRow").each(function(index){
				
					//console.log("idx : "+idx);
					//console.log("index : "+index);
					if($(".purNoRow").eq(idx).html()==$(this).html()){
						if(idx!=index){
							//console.log("remove");
							removeStr += String(index)+",";
							console.log("idx : "+idx);
							console.log("index : "+index);
							idx = index+1;
							//$(".rowSpan").eq(index).remove();
						}
						++rowSpan;
					}
					//console.log("idx : "+$(".purNoRow").eq(idx).html());
					//console.log("index : "+$(this).html());
					console.log("length : "+($('.purNoRow').length-1));
					if(index==($(".purNoRow").length-1)){
						$(".rowSpan").eq(idx).attr("rowspan",rowSpan);
						
						console.log("length");
					}
				
			});
			}
		});
		
		var removeList = removeStr.split(',');
		for(var i in removeList){
			console.log(removeList[i]);
		}
	}); */
	
	
</script>
</html>