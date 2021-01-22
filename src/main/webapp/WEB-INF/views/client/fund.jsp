<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
               <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
               <%@page import="com.soolzari.shop.client.model.vo.Goods"%>
               <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/fund.css">
    <!-- script -->
     <script src="/resources/js/jquery-3.3.1.min.js"></script>
  
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
   <script src="/resources/js/bootstrap.min.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">

    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">


 



    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">
</head>
<body>
   <%@include file="/WEB-INF/views/common/header.jsp" %>
 <div id="container">
        <div id="contents">
            <div class="sub_content">
                <div class="content">
						
                    
                    <!-- 아이텀 컨테이너-->
                    <div class="goods_list_item container">
                        
                     
                        
                        <div class="goods_pick_list">
                            <span class="pick_list_num">
                                전체 펀딩<strong class="fw500">${list.size() }</strong>
                                개
                            </span>
                            <form name="frmList">
                                <div class="pick_list_box">
                                    <ul class="pick_list">
                                        <li>
                                            <input type="radio" id="sort1" class="radio" name="sort" value="date">
                                            <label for="sort1" ">최신순</label>
                                         
                                        </li>
                                         <li>
                                            <input type="radio" id="sort2" class="radio" name="sort" value="lowDate">
                                            <label for="sort2" >기간 적게남은순</label>
                                        </li> 
                                        <li>
                                            <input type="radio" id="sort3" class="radio" name="sort" value="highDate">
                                            <label for="sort3">기간 많게남은순</label>
                                        </li>
                                         <li>
                                            <input type="radio" id="sort4" class="radio" name="sort" value="percent">
                                            <label for="sort4" >달성도 순</label>
                                        </li>
                                        
                                    </ul>
                                    
                                 
                                </div>
                            </form>
                        </div>
                        
                        
                        <div class="goods_list">
                            <div class="goods_list_cont">
                                <div class="item_gallery_type clearfix">
                                    <ul class="product-li">
                                    
                                  	<c:forEach items="${list }" var="f">
                                  	              <fmt:parseDate var="sDate" value="${f.fundEnrollDate }" pattern="yyyy-MM-dd"/>
                                    <fmt:parseNumber value="${sDate.time/(1000*60*60*24) }" integerOnly="true" var="isDate" scope="request"/>
                                    <fmt:parseDate var="tDate" value="${f.fundEndDate }" pattern="yyyy-MM-dd"/>
                                    <fmt:parseNumber value="${tDate.time/(1000*60*60*24) }" integerOnly="true" var="itDate" scope="request"/>
                                    
                                    
                                        <li style="width:25%;" data-percent=${f.fundMoneyNow / f.fundMoney } data-date=${itDate-isDate} >
                                            <div class="item_cont">
                                                <div class="item_photo_box">
                                                    <a href="/client/oFundingDetail.sool?fundNo=${f.fundNo }">
                                                        <img src="/resources/upload/${f.imagePath }" alt="전통주 짱맛있어" class="middle" style= "max-width:230px;" >
                                                    </a>
                                                </div>
                                                
                                                <div class="item_info_cont">
                                                  <div class="item_tit_box">
                                                      <a href="#">
                                                          <strong class="item_name" style="font-size:20px;">${f.fundName }</strong>
                                                      </a>
                                                  </div>
                                                      <div class="rate">
       
                                         <span class="rateNum">진행 상황 :            <fmt:formatNumber value="${f.fundMoneyNow/f.fundMoney*100 }" pattern="0.00"/> %</span><br>
                                    <span class="rateNum">목표치 :<fmt:formatNumber type="number" maxFractionDigits="3" value="${f.fundMoney}" />원</span><br>
                      
                                    <span class="rateNum" > <span style="color:#f7b8b4; float:right; padding-top:30px;">${itDate-isDate}일 남음</span></span>
                                    </div>
                                                  
                                                
                                                </div>
                                            </div>
                                        </li>
                                </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        
                        
                    </div>
                    
                    

                </div>

	<!-- 페이징 -->
		<div id="page-navi" >
			<div>
	
				<c:choose>
			
					<c:when test="${list.size()% 12 !=0 }">
						<c:forEach items="${list}" begin="0" end="${list.size()+1 }" step="12" varStatus="status">
						
	    					<span class="page-num">${status.count}</span>
	    				</c:forEach> 
					</c:when>
					<c:otherwise>
	    				<c:forEach items="${list}" begin="0" end="${list.size() }" step="12" varStatus="status">
	    					
	    					<span class="page-num">${status.count}</span>
	    				</c:forEach> 
	    			</c:otherwise>
				</c:choose>
			</div>
		
		</div>
	 

        </div>

    </div>
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>


<script>
    $(function(){
    	
    	  $(".pick_list li:nth-child(1) label").addClass('on');
        /* 홈메뉴 ul*/
        $(".location_tit").hover(function(){
            $(".location_select ul").css("display","block");
    
        })
        
        $(".location_select ul li a").hover(function(){
                 $(".location_select ul").css("display","block");
                    $(this).children('span').css("color","blue");
        }, function(){
               $(".location_select ul").css("display","none");
              $(this).children('span').css("color","black");
        })
        
   
        $(".pick_list li label").click(function(){
        
        	
             $(".pick_list li label").removeClass('on');
            $(this).addClass('on');
       
        })
        

        
    })
 
    
    /* 정렬 */
      var recent=$(".product-li").html();
    $(document).ready(function(){
     
        $("input:radio[name='sort']").prop("checked",false);
        $("input:radio[name='sort']").click(function(){
			if("input:radio[name='sort']:checked"){
				var sortVal=$(this).attr('value');
				console.log("checkvalue");
				console.log(sortVal);
				listSort(sortVal,1);
			}
        
        	
        })
       
    })
    function listSort(sortVal,pg){
    	 
    	if(sortVal=="highDate"){
    		console.log('기간 많이남은순');
    		$(".product-li").html(
    			
    				$(".product-li li").sort(function(a,b){
    					return $(b).data("date") - $(a).data("date"); 
    				})
    		)
    	}else if(sortVal=="lowDate"){
    		console.log("기간 적게남은순")
    		$(".product-li").html(
    			
    				$(".product-li li").sort(function(a,b){
    					return $(a).data("date") - $(b).data("date"); 
    				})
    		)
    	}else if(sortVal=="percent"){
    		console.log("달성도 순")
    		$(".product-li").html(
    			
    				$(".product-li li").sort(function(a,b){
    					return $(b).data("percent") - $(a).data("percent"); 
    				})
    		)
    	}
    	else{
    		console.log("최신순");
    		$(".product-li").html(recent);
    	}
    	paging(pg);
    }
    
    /* 페이징 */
	function paging(page){
    	console.log("paging입장");
    	console.log(page);
		var a = $(".product-li li");
		a.hide();
		var s = 1+(12*(page-1));
		console.log(a.length);
		for(var i=s;i<=page*12;i++){
			$(a).eq(i-1).show();
		}
	}
	$(function(){
		paging(1);
		$(".page-num").eq(0).css({color:'black'});
	})
	
	$(".page-num").click(function(){
		$(".page-num").css({color:'darkgray'});
		$(this).css({color:'black'});
		paging(parseInt($(this).html()));
	});
  
</script>