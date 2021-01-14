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

<div class="wrap">
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
								<p class="purNoRow">${purchase.purNo }</p>
								<p>${purchase.purDate }</p>
							</td>
							<td>
								<p>${olData.gdsName }</p>
								<p>개수 : ${olData.gdsLCnt }</p>
								<p>가격 : ${olData.gdsLPrice*olData.gdsLCnt }</p>
								<p>배송지 : ${purchase.purGet }</p>
							</td>
							<td>
								<p>${purchase.purTtp }</p>
							</td>
							<td>
								<p>${olData.gdsDStatus }</p>
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
			console.log("m"+${period});
			if($(this).attr("id")==("m"+${period})){
				$(this).addClass("sA1");
			}
		});
	});
	
	$(".searchA").click(function(){
		
	});
	
	
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