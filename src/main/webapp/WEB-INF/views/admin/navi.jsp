<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
	@font-face {
        font-family: 'S-CoreDream-3Light';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    *{
        font-family: 'S-CoreDream-3Light';
    }
    
    .navis li {
        list-style-type: none;
    }
    
    .navis>h1{
        color: white;
        margin: 20px;
    }

    .navis ul,
    h1 {
        padding: 0;
        margin: 0;
    }

    .navis {
        width: 250px;
        background-color: #4d5075;
        padding-right: 20px;
        float: left;
        height: 100vh;
        position: fixed;
        left: 0;
        top: 0;
    }

    .navis a {
        text-decoration: none;
        display: block;
        width: 100%;
        height: 40px;
        line-height: 40px;
        text-align: end;
        font-size: 18px;
        color: white;
    }
    
    .navis li:hover>a{
        color: lightgray;
    }

    section {
        overflow: hidden;
    }
    
    .logout{
        display: flex;
        justify-content: center;
        margin-top: 100px;
    }
    
    .logout>img{
        margin-left: 100px;
    }
    
    .logout a{
        font-size: 25px;
    }
    .sub a:hover{
        border-bottom: 3px solid #bca0c9;
        box-sizing: border-box;
        color: white;
    }
    .more{
        position: absolute;
        left: 20px;
        transition-duration: 0.5s;
    }
    .active {
        transform: rotate(45deg);
    }
</style>
</head>
<body>
	<section>
		<div class="navis">
	        <h1>관리자</h1>
	        <ul>
	            <li>
	                <a href="/admin.sool">홈</a>
	            </li>
	            <li>
	                <a href="/notice/list.sool?reqPage=1">공지사항</a>
	            </li>
	            <li>
	                <a href="/faq.sool">자주 묻는 질문</a>
	            </li>
	            <li>
	                <a href="/qna.sool">1:1 문의</a>
	            </li>
	            <li>
	                <a href="javascript:void(0)">승인 관리</a>
	                <ul class="sub">
	                    <li><a href="/accept.sool?type=1&reqPage=1">상품</a></li>
	                    <li><a href="/accept.sool?type=2&reqPage=1">펀딩</a></li>
	                    <li><a href="/accept.sool?type=3&reqPage=1">클래스</a></li>
	                </ul>
	            </li>
	            <li>
	                <a href="javascript:void(0)">사용자 관리</a>
	                <ul class="sub">
	                    <li><a href="#">고객</a></li>
	                    <li><a href="#">판매자</a></li>
	                </ul>
	            </li>
	            <li class="logout">
	                <img src="/resources/image/logout.png"><a href="">로그아웃</a>
	            </li>
	        </ul>
	    </div>
	</section>
	
	<script>
        $(function() {
            $(".sub").hide();
            $(".sub").prev().prepend('<span class="more">+</span>');
            $(".more").click(function(event) {
                $(this).parent().next().slideToggle();                
                if ($(this).attr("class") == "more") {
                    $(this).addClass("active");
                } else {
                    $(this).removeClass("active");
                }
                event.stopPropagation();

            });
            $(".more").parent().click(function() {
                $(this).children().last().click();
            });
        })
    </script>
</body>
</html>