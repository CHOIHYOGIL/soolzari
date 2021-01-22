<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="stylesheet" href="/resources/css/sellerHeader.css">
    <script type="text/javascript" src="/resources/js/jquery-3.3.1.min.js"></script>
</head>
	<div class="seller_header">
        <header>
            <div id="seller_banner" style="display:block;"><img src="/resources/image/logo1.png" style="height:30px;margin-top:5px;margin-bottom: 5px;width:115px;">
                <h5 style="margin:0 auto;">판매자페이지</h5>
            </div>
            <nav>
               <span>판매자 ${sessionScope.sessionSeller.selName}님 환영합니다.</span>
                <span><input type="button" class="btn btn-primary" value="고객페이지" id="customer"></span>
                <span><input type="button" class="btn btn-primary" value="마이페이지"></span>
                <span><input type="button" class="btn btn-danger" value="로그아웃" id="logout"></span>
            </nav>
        </header>
    </div>
</html>

<script>
	$("#customer").click(function(){
		
		location.href="/";
	})
	
	$("#logout").click(function(){
		
		location.href='/logout.sool';
	})
</script>