<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/bootstrap.min.js"></script>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"/> --%>
<meta charset="UTF-8">
<title>펀딩 상세보기</title>
</head>

<style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
    
   .commentList-ul{
    	list-style:none;
    }
	li{
		list-style:none;
	}
	.result-li textarea{
		width:650px !important;
		height:50px !important;
		margin-top:15px;
	}
	
	.name a{
		text-decoration:none;
		color:black;
	}
	.name a:hover{
	text-decoration:none;
		color:black;
	}
	
	.rotate{
      transform: rotate(180deg);
   }
</style>
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

		</div>
		

	<div class="fixContent">
		<form action="/client/basketInsert.sool" method="post">
			<h4><p>${fund.fundName }</p></h4>
			목표 금액 달성률<br>
			<h5 class="gh3"><span class="goodsPrice comma">${fund.fundTotalMoney }</span> 원 </h5><h4 class="gh4"><span>${fund.fundTotalMoney/fund.fundMoney*100 }</span>%</h4>
			<table class="table fixTable">
				<tr>
					<th>등록일</th>
					<td>${fund.fundEnrolldate }</td>
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
							<p>추가 후원금 : <input type="text" name="addFund" value="0"></p>
							<div style="text-align: center;">
								<button type="button" class="btn btn-outline-secondary btn-sm addFundSel">+5,000</button>
								<button type="button" class="btn btn-outline-secondary btn-sm addFundSel">+10,000</button>
								<button type="button" class="btn btn-outline-secondary btn-sm addFundSel">+50,000</button>
								<button type="button" class="btn btn-outline-secondary btn-sm addFundSel">+100,000</button>
							</div>
							<input type="hidden" name="fndDCli" value="${sessionScope.sessionClient.clientNo }">
							<input type="hidden" name="fndGNo" value="${fg.fndGNo }">
							<input type="hidden" name="fndDStatus" value="0">
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
		</form>
	</div>
	
	
			<div class="reviewContent" style="margin-top:1200px;" >
			<a name="reviewGo"/>
			<div class="glTitle">
                          <span style="font-size:25px;">댓글</span>
            	<hr class="line">
            </div>
       <div class="gl">
            	<!-- 댓글 입력하는 창 -->
            	  <span style="font-size:18px;">평점 :</span> <p id="star_grade" style="display:inline-block;">
	            	<a href="#">★</a>
	            	<a href="#">★</a>
	            	<a href="#">★</a>
	            	<a href="#">★</a>
	            	<a href="#">★</a>


	            </p>
	            <span id="rateCount"> </span>
	            <div class="inputComment">
		            <form action="/insertComment.sool" method="post">
		            
			            <input type="hidden" name="fundNo" value="${fund.fundNo}"> <!-- 스룹스터디no -->
			            <input type="hidden" name="commentWriter" value="${sessionNo}"> <!-- 작성자 -->
			            <input type="hidden" name="commentWriterName" value="${sessionName}"> <!-- 작성자 -->
			          	<input type="hidden" id="commentRate" name="commentRate">
			            <textarea class="form-control rowCheck" name="commentContent" style="resize: none; width: 65%; display: inline-block; outline: none;" maxlength="65" required="required"></textarea> 
			            <button type="submit" class="btn btn-success btn-lg endDayCheck" style="background-color: #3B4E32; margin-bottom:50px; margin-left:10px;">등록</button>
		            </form>
	            </div>
	            </div> 
	             		    <div id="commentScrollDiv" style="width: 74%;">
	            <!-- 전체 댓글 출력 및 본인 댓글 수정 / 삭제 -->
	             <h4 style="font-size:20px;">댓글 리스트
	             	<c:if test="${!empty reviewList}">
	             		   <span class="toggle-review"><i class="fas fa-sort-down" width="20" style="transition-duration:0.2s;"></i></span>
	             	</c:if>
	             </h4>
	        
	               <ul class="commentList-ul" style=" width:100%; padding:0px 15px;" >
	          
	              	<c:forEach items="${reviewList}" var="r">
	   
	            		<li class="result-li" style="width:96%;  border:1px solid lightgrey; border-radius:15px 15px 15px 15px; padding:10px 15px; margin-bottom:8px;" >
	            			<div class="name" style=" width:100%;">
	            			       
			                     	<p id="commentWriterP" style="margin: 0; font-size:18px;">${r.commentWriterName}<span><c:forEach var="i" begin="1" end="${r.commentRate }">	<a href="#" style="color:orange;">★</a></c:forEach></span></p>
			                            		<input type="hidden" name="reviewNo" value="${r.reviewNo}">
			                        <textarea name="commentContent" class="form-control changeComment" style="resize: none; display:inline-block;"  required="required" onfucs="this.value=this.value;" >${r.commentContent }</textarea>
			           
			             		<c:if test="${r.commentWriter eq sessionScope.sessionClient.clientNo  }">
			                    		<a href="javascript:void(0)" onclick="modify(this,${r.reviewNo})">수정</a>
			                    <a href="javascript:void(0)" onclick="delete1(this,${r.reviewNo})">삭제</a>
			                  
			                    	</c:if>
			                     </div> 
			          
	            		         
			                   
			                 
			                    
			                    	
			                 </li> 
			  
	           
	                </c:forEach>
	                 </ul>
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
		if(confirm("후원을 하시겠습니까?\n종료일날 메일로 결제안내를 드립니다")){
			//확인 시 form태그 서브밋처리
			$("form").eq($(this).index()).submit();//후원하기버튼에 있는 form실행하기위해 index를 구해서 실행시킴
		}
	});
</script>


<script>

	
var count=0;
        $('#star_grade a').click(function(){
            $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
            $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
            count=$('#star_grade a.on').length-1;
            $("#rateCount").html(count+"점");
            $("#commentRate").val(count);
            console.log(count);
            return false;
        });
        
        $(".toggle-review").click(function(){ //리뷰 div 토글
            $(".commentList-ul").slideToggle('600');
            $(".toggle-review").children().toggleClass('rotate');
         });
        
  function modify(obj,reviewNo){
        	console.log(obj);
        	console.log(reviewNo);
        	var tx=$(obj).prev();
        	tx.focus();
        	tx.val(tx.val()+' ');  //textarea 글끝으로 커서 보내기
        	$(obj).html('수정완료');
        	$(obj).attr('onclick','modifyComplete(this,"'+reviewNo+'")');
        	$(obj).next().html('수정취소');
        	$(obj).next().attr('onclick','modifyCancel(this)');
        	
        }
  
  function delete1(obj,reviewNo){
	  console.log("delete");
	  var content=$(obj).prev().prev().val();
	  console.log(content);
	  $.ajax({
	  		
	  		url:"/deleteComment.sool",
	  		type:"POST",
	  		data:{
	  			reviewNo : reviewNo,
	  			commentContent :content
	  		},
	  		dataType:"json",
	  		
	  		success:function(data){
	  			console.log(data);
	  			
	  			alert(data.msg);
	  			location.reload();
	  		},
	  		error:function(error){
	  			console.log(error);
	  		}
	  		
	  	});
	  
	  
  }
  
  function modifyComplete(obj, reviewNo){
	  console.log("수정완료");
	  console.log("수정완료 : "+obj);
	  console.log(reviewNo);
	  var content=$(obj).prev().val();
	  console.log(content);
	  $.ajax({
  		
  		url:"/modifyComment.sool",
  		type:"POST",
  		data:{
  			reviewNo : reviewNo,
  			commentContent :content
  		},
  		dataType:"json",
  		
  		success:function(data){
  			console.log(data);
  			alert(data.msg);
  			$(obj).prev().val(content);
  			$(obj).html('수정');
  			$(obj).attr('onclick','modify(this,"'+reviewNo+'")');
  			$(obj).next().html('삭제');
  			$(obj).next().attr('onclick','delete');
  			location.reload();
  			console.log(data);
  		},
  		error:function(error){
  			console.log(error);
  		}
  		
  	})
  }
  
  function modifyCancel(obj){
	  console.log("cancel");
  	var tx=$(obj).prev().prev();
  	console.log(tx);
  	tx.focusout();
  	$(obj).html('삭제');
  	$(obj).attr('class','delete');
  	$(obj).prev().html('수정');
  	$(obj).prev().attr('class','modify');
	  
  }
      
        $(".modifyComplete").click(function(){
        	console.log("수정완료");
			var reviewNo=$(this).prev().prev().val();
			console.log(reviewNo);
        	var content=$(".changeComment").val();
      	
        })
      
        
</script>
</body>
</html>