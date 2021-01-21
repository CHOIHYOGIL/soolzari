<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>

<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/bootstrap.min.js"></script>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"/> --%>
<meta charset="UTF-8">
<title>상품 상세보기</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="/resources/css/oGoodsDetail.css">
<div class="wrap2">
	<%-- <div id="main_container">
    	<div id="main_content">
			<jsp:include page="/WEB-INF/views/client/oGoodsDetailFrm.jsp"/>
		</div>
	</div> --%>
	<div class="mainContent">
		<a name="mainGo"/>
		<div class="mainImg">
			메인이미지 올곳
			<a href="/client/oFundingDetail.sool?fundNo=17">펀딩상세페이지(임시)</a>
		</div>
		<div class="detailContent">
			<div>
				판매이미지올곳~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				
			</div>
		</div>
		<div class="reviewContent">
			<a name="reviewGo"/>
			<div class="glTitle">
                          댓글
            	<hr class="line">
            </div>
            <%-- <div class="gl" style="padding-left: 70px;">
            	<!-- 댓글 입력하는 창 -->
	            <div class="inputComment">
		            <form action="/insertGroupComment" method="post">
			            <input type="hidden" name="groupNo" value="<%=gsr.getGroupNo()%>"> <!-- 스룹스터디no -->
			            <input type="hidden" name="commentWriter" value="<%=m.getMemberId()%>"> <!-- 작성자 -->
			            <input type='hidden' name='category1' value='<%=category1%>'>
			            <input type='hidden' name='category2' value='<%=category2%>'>
			            <textarea class="form-control rowCheck" name="commentContent" style="resize: none; width: 85%; display: inline-block; outline: none;" maxlength="65" required="required"></textarea> 
			            <button type="submit" class="btn btn-success btn-lg endDayCheck" style="background-color: #3B4E32">등록</button>
		            </form>
	            </div>
	            <!-- 전체 댓글 출력 및 본인 댓글 수정 / 삭제 -->
	            <div id="commentScrollDiv" style="width: 93%; margin-top: 20px;">
	            	<%for(GroupComment gc : gcList){ %>
		                <%if(gc.getCommentContent()!=null){ %>
			                <div class="commentListWrap" style="clear:left;">
			                 	<div class="commentList" style="width: 10%;">
			                       	<img src="<%=memberIdFileMap.get(gc.getCommentWriter())%>" style="border-radius: 50%; width: 60px; height: 60px;" ><!-- 댓글을 쓴 사용자들의 프로필사진 -->
			                    </div>
			                    <div class="commentList" style="width: 77%;">
			                     	<p id="commentWriterP" style="margin: 0;"><%=gc.getCommentWriter() %></p>
			                        <p class="oldContent"><%=gc.getCommentContentBr() %></p>
			                        <textarea name="commentContent" class="form-control changeComment" style="display: none; resize: none;" required="required"><%=gc.getCommentContent() %></textarea>
			                    </div>
			                    <%if(m.getMemberId().equals(gc.getCommentWriter()) || m.getMemberNo()==gsr.getGroupManagerNo()){ //작성자랑 현재 접속자랑 같은 경우 수정/삭제 가능하게 || 그룹장인경우 삭제만가능하게%>
			                       	<div class="commentList" style="width: 13%;">
			                         	<%if(m.getMemberId().equals(gc.getCommentWriter())){ %>
			                             	<a href="javascript:void(0)" onclick="modifyComment(this,'<%=gc.getCommentNo()%>','<%=gsr.getGroupNo()%>')">수정</a>
			                            <%} %>
			                            <a href="javascript:void(0)" onclick="deleteComment(this,'<%=gc.getCommentNo()%>','<%=gsr.getGroupNo()%>','<%=category1%>','<%=category2%>')">삭제</a>
			                       	</div>
			                    <%} %>
			             	</div>
		                <%} %>
	                <%} //댓글 for문 종료 지점%>
	            </div>
            </div> --%>
		</div>
		
	</div>
	<div class="fixContent">
		<form action="/client/basketInsert.sool" method="post">
			<h4><p>${gsd.gdsName }</p></h4>
			<h4 class="gh4"><span class="goodsPrice comma">${gsd.gdsPri }</span> 원</h4>
			<table class="table fixTable">
				<tr>
					<th>등록일</th>
					<td>${gsd.goodsDate }</td>
				</tr>
				<tr>
					<th>평점</th>
					<td></td>
				</tr>
				<tr>
					<th>총판매수량</th>
					<td>${gsd.gdsBcnt }</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>2,500원</td>
				</tr>
				<tr>
					<th>수량</th>
					<td>
						<button type="button" class="btn btn-outline-secondary btn-sm mi" onclick="plusMinusBtn(this,0);">-</button>
						<span class="basCnt">1</span>
						<button type="button" class="btn btn-outline-secondary btn-sm pl"  onclick="plusMinusBtn(this,1);">+</button>
					</td>
				</tr>
			</table>
			<hr style="width: 90%;">
			<div class="totalWrap">
				<div class="totalDiv1">총 상품금액</div>
				<div class="totalDiv2"><h3 class="totalPrice comma">0</h3>원</div>
			</div>
			<div class="btnDiv">
				<button type="button" class="btn btn-lg basketBtn">장바구니 담기</button> 
				<button type="button" class="btn btn-lg paymentBtn">구매하기</button> 
			</div>
			<div class="aTarget">
				<a href="#mainGo" class="mainGo at">상품 상세</a> / 
				<a href="#reviewGo" class="reviewGo at">상품 후기 보기</a>
			</div>
			
		</form>
	</div>
</div>


<script>
	$(function(){
		$(".goodsPrice").html(commaSet($(".goodsPrice").html()));
		$(".totalPrice").html($(".goodsPrice").html());
	})

	//플러스 마이너스 버튼
	function plusMinusBtn(btnType,chk){
		//마이너스버튼을 눌렀는지 플러스버튼을 눌렀는지 체크
		var basCnt = null;
		if(chk==0){
			basCnt = $(btnType).next().html();
		}else{
			basCnt = $(btnType).prev().html();
		}
		console.log(basCnt);
		if((basCnt>1 || chk==1) && (basCnt<99 || chk==0)){
			if(chk==0){
				$(btnType).next().html($(btnType).next().html()-1);
				totalPrice();//수량이 변할때마다 총상품금액 변동
			}else{
				$(btnType).prev().html(Number($(btnType).prev().html())+1);
				totalPrice();//수량이 변할때마다 총상품금액 변동
			}
		}else if(basCnt<=1){
			alert("최소 1개 이상 구매가 가능합니다");
		}else if(basCnt>=99){
			alert("최대 99개까지 구매가 가능합니다");
		}
	}
	
	//수량이 변할때마다 총상품금액 변동
	function totalPrice(){
		var goodsPrice = Number("${gsd.gdsPri }");
		var basCnt = Number($(".basCnt").html());
		$(".totalPrice").html(commaSet(goodsPrice*basCnt));
	}
	
	//금액단위 콤마 구분
	function commaSet(price) {
		var str = String(price);
		let price1 = str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		return price1;
	}
	//콤마 제거
	function commaReset(price){
		var str = String(price);
		let price1 = str.replace(/[^\d]+/g, "");
		return price1;
	}
	
	//장바구니에 담기 버튼
	$(".basketBtn").click(function(){
		location.href="/client/basketInsert.sool?cliNo=${sessionScope.sessionClient.clientNo}&gdsNo=${gsd.gdsNo}&basCnt="+$(".basCnt").html();
	})
	//바로 구매하기버튼
	$(".paymentBtn").click(function(){
		location.href="/client/paymentShow.sool?gdsNo=${gsd.gdsNo}&gdsLCnt="+Number($(".basCnt").html());
	})
</script>
</body>
</html>