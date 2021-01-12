<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main.css">

   
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

    <!--font-->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


    <!-- icon 사용-->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <!-- script -->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
  
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
   <script src="/resources/js/bootstrap.min.js"></script>


    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">
</head>
<body>
<div class="wrap">
  <!-- 헤더 -->
        <div class="bgColor">
            <header>
                <span class="bg"></span> <!-- 반응형 메뉴 클릭하면 배경화면 어두워지게 하기위해 작성-->
                <a href="#" class="open"><span class="lnr lnr-menu"></span></a>
                <a href="/index.jsp" class="logo"><img src="/resources/image/logo.PNG"></a>
                <nav>
                    <a href="#" class="close"><span class="lnr lnr-cross"></span></a>
                    <ul class="gnb">
                        <li><a href="#">사이트소개</a>

                            <ul class="sub">
                                <li id="nop"><a href="/views/client/introduce.jsp">이용안내</a></li>
                            </ul>
                        </li>
                        <li><a href="/basicSool.sool">전통주</a>
                            <ul class="sub">
                                <li id="nop"><a href="/basicSool.sool">탁주</a></li>
                                <li id="nop"><a href="#">청주</a></li>
                                <li id="nop"><a href="#">증류주</a></li>
                                <li id="nop"><a href="#">와인</a></li>
                                <li id="nop"><a href="#">과실주</a></li>
                            </ul>
                        </li>
                        <li><a href="#">펀딩</a>
                            <ul class="sub"></ul>
                        </li>

                        <li><a href="/reservation_intro.sool">클래스</a>
                            <ul class="sub">
                                <li id="nop"><a href="/reservation_intro.sool">안내</a></li>
                                <li id="nop"><a href="/reservation.sool">예약</a></li>
                            </ul>
                        </li>
                        <li><a href="#">고객센터</a>
                            <ul class="sub">
                                <li id="nop"><a href="#">공지사항</a></li>
                                <li id="nop"><a href="#">Q&A</a></li>
                            </ul>
                        </li>
                    </ul>

                </nav>


	
	
		<c:choose>
			<c:when test="${sessionId!=null }">
				   <div>
                    <ul class="login">
                        <li> <input class="search_input" type="text" placeholder="search"></li>
                        <li><a href="#">${sessionId}님</a>
                        <li><a href="/logout.sool">로그아웃</a>
                    </ul>
                </div>
			</c:when>
			<c:otherwise>
			 <div>
                    <ul class="login">
                        <li> <input class="search_input" type="text" placeholder="search"></li>
                        <li><a href="/login.sool">로그인</a>
                        <li><a href="/views/client/join.jsp">회원가입</a>
                    </ul>
                </div>
			</c:otherwise>
		</c:choose>			
               

            </header>
        </div>
        </div>
</body>
</html>
<script>

/* keyup delay 줌*/
function delay(callback, ms) {
	  var timer = 0;
	  return function() {
	    var context = this, args = arguments;
	    clearTimeout(timer);
	    timer = setTimeout(function () {
	      callback.apply(context, args);
	    }, ms || 0);
	  };
	}
	/* 빠른 검색*/
	$(".search_input").keyup(delay(function(e){
		
		console.log($(this).val());
		var searchWord=$(this).val();
		location.href='/basicSool.sool?searchWord='+searchWord;
	},500));


 /* 헤더 */
 

 $(function(){
	 $(document).on('mouseover','.gnb li a', function(){
         if($(window).width()>1200){
        $('.bgColor').css('height','450px');
        $('.sub').slideDown(300);
        $('.bgColor').css('background-color','white');
       $('header').css('height','450px');
         }
    });
    

    $('.sub').on({
        mouseover:function(){
      
            $(this).children('#nop a').css('border-bottom','0px solid white');
        },
        mouseleave:function(){
                $(this).prev().css('border-bottom','0px solid green');
        }
        
    })
  
    
    $(document).on('mouseleave','header', function(){
        if($(window).width()>1200){
            $('.sub').slideUp(300);
         $('header').css('height','80px');
        $('.bgColor').css('height','0px'); 
        }else{
             $('header').css('height','80px');
        }  
       

    })
    
    
    
          $(function() {
    $('header .open').on('click', function() {
        $('body').css({'overflow': 'hidden'});   //스크롤하지 못하게 막음
        $('header .bg').css({'display': 'block'});
        $('header nav').addClass('on');
	});
    $('header .close, .section').on('click', function() {
        $('body').css({'overflow': 'auto'});
        $('header .bg').css({'display': 'none'});
        $('header nav').removeClass('on');
	});	
}); 
 })
      
    </script>