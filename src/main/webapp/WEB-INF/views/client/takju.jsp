<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
               <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
               <%@page import="com.soolzari.shop.client.model.vo.Goods"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="/resources/css/takju.css">

    <!-- Bootstrap cdn 설정 -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">

    <link rel="preconnect" href="https://fonts.gstatic.com">

    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">

    <!-- script -->
     <script src="/resources/js/jquery-3.3.1.min.js"></script>
 
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">
</head>
<body>
   <%@include file="/WEB-INF/views/common/header.jsp" %>
 <div id="container">
        <div id="contents">
            <div class="sub_content">
                <div class="content">
						
                    <!-- 위 홈메뉴-->
                    <div class="location_wrap mb60">
                        <div class="location_cont clearfix">
                            <div class="local_home">
                                <a href="/index.jsp">
                                    <i class="fas fa-home"></i>
                                    HOME
                                </a>
                            </div>

                            <div class="location_select">
                                <div class="location_tit">
                                    <a href="/basicSool.sool">
                                        <span>탁주</span>
                                    </a>
                                </div>

                                <ul>
                                    <li><a href="/basicSool.sool"><span>탁주</span></a></li>
                                    <li><a href="#"><span>청주</span></a></li>
                                    <li><a href="#"><span>증류주</span></a></li>
                                    <li><a href="#"><span>와인</span></a></li>
                                    <li><a href="#"><span>과실주</span></a></li>
                                </ul>
                            </div>
                        </div>

                    </div>

                    <!-- 아이텀 컨테이너-->
                    <div class="goods_list_item container">
                        
                        <div class="goods_list_item_tit">

                            <h2 class="text-center fs30 fw500 mb20">탁주</h2>
                        </div>
                        
                        <div class="list_item_category mb60">
                            <ul>
                                <li><a href="/basicSool.sool"><span>탁주</span></a></li>
                                <li><a href="#"><span>청주</span></a></li>
                                <li><a href="#"><span>증류주</span></a></li>
                                <li><a href="#"><span>와인</span></a></li>
                                <li><a href="#"><span>과실주</span></a></li>
                           
                            </ul>
                        </div>
                        
                        <div class="goods_pick_list">
                            <span class="pick_list_num">
                                전체상품<strong class="fw500">${list.size() }</strong>
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
                                            <input type="radio" id="sort2" class="radio" name="sort" value="lowPrice">
                                            <label for="sort2" >낮은가격순</label>
                                        </li> 
                                        <li>
                                            <input type="radio" id="sort3" class="radio" name="sort" value="highPrice">
                                            <label for="sort3">높은가격순</label>
                                        </li>
                                         <li>
                                            <input type="radio" id="sort4" class="radio" name="sort" value="recommend">
                                            <label for="sort4" >인기순</label>
                                        </li>
                                    </ul>
                                    
                                    <div class="choice_num_view">
                                        <select class="chosen-select" name="pageNum">
                                            <option value="10">10개씩보기</option>
                                            <option value="10">20개씩보기</option>
                                            <option value="10">30개씩보기</option>
                                        </select>
                                        
                                    </div>
                                </div>
                            </form>
                        </div>
                        
                        
                        <div class="goods_list">
                            <div class="goods_list_cont">
                                <div class="item_gallery_type clearfix">
                                    <ul class="product-li">
                                    
                                  	<c:forEach items="${list }" var="g">
                                        <li style="width:25%;" data-price=${g.goodsPrice } data-count=${g.goodsCount }>
                                            <div class="item_cont">
                                                <div class="item_photo_box">
                                                    <a href="#">
                                                        <img src="/resources/upload/${g.imagePath }" alt="전통주 짱맛있어" width="240" class="middle">
                                                    </a>
                                                </div>
                                                
                                                <div class="item_info_cont">
                                                  <div class="item_tit_box">
                                                      <a href="#">
                                                          <strong class="item_name" style="font-size:20px;">${g.goodsName }</strong>
                                                      </a>
                                                  </div>
                                              
                                                  
                                                  <div class="item_money_box">
                                                      <strong class="item_price" style="font-size:12px;">
                                                          <span>${g.goodsPrice }원</span>
                                                      </strong>
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
        
        /* 윗부분 탁주 청주 증류주 이벤트
        
        $(".list_item_category ul li a").hover(function(){
            $(this).css("background-color","blue");
               $(this).children('span').css("color","white");
        }, function(){
                    $(this).css("background-color","white");
            $(this).children('span').css("color","black");
        })
        */
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
    	 
    	if(sortVal=="highPrice"){
    		console.log('높은가격순');
    		$(".product-li").html(
    			
    				$(".product-li li").sort(function(a,b){
    					return $(b).data("price") - $(a).data("price"); 
    				})
    		)
    	}else if(sortVal=="lowPrice"){
    		console.log("낮은가격순")
    		$(".product-li").html(
    			
    				$(".product-li li").sort(function(a,b){
    					return $(a).data("price") - $(b).data("price"); 
    				})
    		)
    	}else if(sortVal=="recommend"){
    		console.log("구매많이한순")
    		$(".product-li").html(
    			
    				$(".product-li li").sort(function(a,b){
    					return $(b).data("count") - $(a).data("count"); 
    				})
    		)
    	}else{
    		console.log("최신순");
    		$(".product-li").html(recent);
    	}
    	paging(pg);
    }
    
    /* 페이징 */


  
</script>