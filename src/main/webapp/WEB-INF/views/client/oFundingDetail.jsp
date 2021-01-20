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
<title>펀딩 상세보기</title>
</head>
<body>
<link rel="stylesheet" type="text/css" href="/resources/css/oFundingDetail.css">
<div class="wrap2">
	<div class="mainContent">
		<a name="mainGo"/>
		<div class="mainImg">
			메인이미지 올곳
		</div>
		<div class="detailContent">
			<div>
				펀딩이미지올곳~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
			<h4><p>${fund.fundName }</p></h4>
			목표 금액 달성률<br>
			<h5 class="gh3"><span class="goodsPrice comma">${fund.fundTotalMoney }</span> 원 </h5><h4 class="gh4"><span>${fund.fundTotalMoney/fund.fundMoney*100 }</span>%</h4>
			<table class="table fixTable">
				<tr>
					<th>등록일</th>
					<td>${fund.fundEnrolldate }</td>
				</tr>
				<tr>
					<th>종료일</th>
					<td>${fund.fundEnddate }</td>
				</tr>
				<tr>
					<th>목표 금액</th>
					<td><span class="money">${fund.fundMoney }</span></td>
				</tr>
			</table>
			<hr style="width: 90%;">
			<div class="goodsList">
				<c:forEach items="${fundGoodsList }" var="fg">
					<form action="/client/fundReservationInsert.sool" method="post">
						<input type="hidden" name="fundNo" value="${fund.fundNo }">
						<div class="detail">
							<h6 class="fndGName">${fg.fndGName }</h6>
							<div class="detailBtn">
								<button type="button" class="btn toggleBtn" data-toggle="collapse" data-target="#detail_page${fg.fndGNo }">+</button>
							</div>
							<br>
							<p>가격 : <span class="price">${fg.fndGPri }</span></p>
				        </div>
				        <div id="detail_page${fg.fndGNo }" class="collapse">
				           	<p>구성 : <span>${fg.fndGCon }</span></p>
							<p>추가 후원금 : <input type="text" name="addFund"></p>
							<div style="text-align: center;">
								<button type="button" class="btn btn-outline-secondary btn-sm addFundSel">+5,000</button>
								<button type="button" class="btn btn-outline-secondary btn-sm addFundSel">+10,000</button>
								<button type="button" class="btn btn-outline-secondary btn-sm addFundSel">+50,000</button>
								<button type="button" class="btn btn-outline-secondary btn-sm addFundSel">+100,000</button>
							</div>
							<input type="hidden" name="fndGNo" value="${fg.fndGNo }">
							<input type="hidden" name="fndDPrice"><!-- 가격과 추가후원금을 합한 값을 hidden으로 전달 -->
							<br>
							<div class="totalWrap">
								<div class="totalDiv1">총 후원금액</div>
								<div class="totalDiv2"><h3 class="totalPrice comma">0</h3>원</div>
							</div>
							<div class="btnDiv">
								<button type="button" class="btn btn-sm paymentBtn">후원하기</button>
							</div> 
				        </div>
						<hr style="width: 90%;">
					</form>
				</c:forEach>
			</div>
			
			<div class="aTarget">
				<a href="#mainGo" class="mainGo at">상품 상세</a> / 
				<a href="#reviewGo" class="reviewGo at">상품 후기 보기</a>
			</div>
	</div>
</div>


<script>
	$(function(){
		$(".goodsPrice").html(commaSet($(".goodsPrice").html()));
		$(".totalPrice").html($(".goodsPrice").html());
		$(".money").html(commaSet($(".money").html()));
		
		//고정된 장바구니에 상품이 많으면 스크롤생기도록
		console.log($(".fixContent").height());
		var autoHeight = $(".fixContent").height();
		console.log(window.innerHeight);
		
		if(autoHeight>window.innerHeight){
			$(".fixContent").css("height",window.innerHeight);
			$(".fixContent").css("overflow",'scroll');
			$(".fixContent").css("overflow-x",'hidden');
		}else{
			$(".fixContent").css("height","auto");
			$(".fixContent").css("overflow",'hidden');
		}
		//고정된 장바구니에 상품이 많으면 스크롤생기도록(리사이즈될때)
		$(window).resize(function(){
			if(autoHeight>window.innerHeight){
				$(".fixContent").css("height",window.innerHeight);
				$(".fixContent").css("overflow",'scroll');
				$(".fixContent").css("overflow-x",'hidden');
			}else{
				$(".fixContent").css("height","auto");
				$(".fixContent").css("overflow",'hidden');
			}
		});
		
		//가격 콤마처리
		$(".price").each(function(){
			$(this).html(commaSet($(this).html()));
		});
		
		
		//처음에 총 후원금액 세팅
		totalPriceSet();
	})
	
	
	//키다운될때마다 콤마처리
	$(".price").each(function(){
		$(this).html(commaSet($(this).html()));
	});

	//플러스 버튼 눌렀을 다른 토글들 접히게
	$(".toggleBtn").click(function(){
		var thisClick = $(this).attr("data-target");
		$(".toggleBtn").each(function(){
			if($(this).attr("data-target")!=thisClick){
				$(this).parent().parent().next().removeClass('show');
			}
		});	
	});
	
	//추가 후원금에 5000/10000/~~버튼 들 클릭했을때 input에 들어가도록
	$(".addFundSel").click(function(){
		var addfundBtn = Number(commaReset($(this).html().substring(1,$(this).html().length)));//버튼의 금액을 숫자로 변환
		var addfund = Number(commaReset($(this).parent().prev().children().val()));//input값을 숫자로 변환
		var appendPrice = commaSet(addfundBtn+addfund);
		$(this).parent().prev().children().val(appendPrice);
		totalPriceSet();//총 후원금액 계산
	});
	
	//추가후원금 input에 keyup할때마다 콤마처리
	$("input[name=addFund]").keyup(function(){
		$(this).val(commaSet(commaReset($(this).val())));
		totalPriceSet();//총 후원금액 계산
	});
	
	
	//총 후원금액 계산
	function totalPriceSet(){
		var goodsPrice = 0;
		var addFund = 0;
		$(".totalPrice").each(function(){
			goodsPrice = Number(commaReset($(this).parent().parent().parent().prev().find(".price").html()));
			addFund = Number(commaReset($(this).parent().parent().parent().find("input[name=addFund]").val()));
			$(this).html(commaSet(goodsPrice+addFund));
			//console.log($(this).parent().parent().prev().prev().val());
			$(this).parent().parent().prev().prev().val(goodsPrice+addFund);//input hidden타입에 합한값 넣어서 넘겨주기
		});
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
	//후원하기 버튼
	$(".paymentBtn").click(function(){
		var login = "${sessionScope.sessionClient.clientNo }";
		if(login.length>0){//로그인 된 상태일때만 후원가능하게
			if(confirm("후원을 하시겠습니까?\n종료일날 메일로 결제안내를 드립니다")){
				$("form").eq($(this).index()).submit();//후원하기버튼에 있는 form실행하기위해 index를 구해서 실행시킴
			}
		}else{//로그인된 상태가 아니면
			alert("로그인 이후 후원이 가능합니다");
			location.href="/login.sool";
		}
		
	});
</script>
</body>
</html>