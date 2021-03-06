<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta charset="UTF-8">
    <title>술자리 판매자 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link href="/resources/css/sellerClassAdd.css" rel="stylesheet" type="text/css">
</head>

<body>
    <%@include file="/WEB-INF/views/seller/sellerHeader.jsp"%>
    <div id="content_box">
        <div id="left_bar">
            <div class="wrapper">
                <ui class="mainMenu">
                    <li class="item" id="goods_con">
                        <a href="#goods_con" class="btn-left">상품 관리</a>
                        <div class="subMenu">
                            <a href="/seller/goodsAdd.sool">상품 등록</a>
                            <a href="/seller/goodsList.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">상품 보기</a>
                        </div>
                    </li>
                    <li class="item" id="class_con">
                        <a href="#class_con" class="btn-left">클래스 관리</a>
                        <div class="subMenu">
                            <a href="/seller/classAdd.sool">클래스 등록</a>
                            <a href="/seller/classList.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">클래스 확인</a>
                        </div>
                    </li>
                    <li class="item" id="funding_con">
                        <a href="#funding_con" class="btn-left">펀딩 관리</a>
                        <div class="subMenu">
                            <a href="/seller/fundingAdd.sool">펀딩 열기</a>
                            <a href="/seller/fundingList.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">펀딩 확인</a>
                        </div>
                    </li>
                    <li class="item" id="mypage_con">
                        <a href="#mypage_con" class="btn-left">마이페이지</a>
                        <div class="subMenu">
                            <a href="/seller/mypage1.sool">내 정보 보기</a>
                            <a href="/seller/mypage2.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">상품 배송 관리</a>
                            <a href="/seller/mypage3.sool?reqPage=1">펀딩 배송 관리</a>
                        </div>
                    </li>
                </ui>
            </div>
        </div>
        <div id="main_container">
            <div id="main_content">
            <h2 style="text-align: center;padding:20px;margin: 0 auto;background-color:#f7b8b4;"> 클래스 등록 </h2>
                <div id="class_add_form">
                    <form action="/seller/classAddChk.sool" method="post">
                        <table class="table">

                            <tbody>
                                <tr>
                                    <th scope="row">클래스 이름</th>
                                    <td><input type="text" name="className" required></td>
                                </tr>
                                <tr>
                                    <th scope="row">클래스 개최인</th>
                                    <td><input type="text" name="selName" value="${sessionScope.sessionSeller.selName }" readonly>
                                    <input type="hidden" name="selNo" value="${sessionScope.sessionSeller.selNo }"></td>
                                </tr>
                                <tr>
                                    <th scope="row">등록 가격</th>
                                    <td><input id="classPrice" type="text" name="classPrice" required></td>
                                </tr>
                                <tr>
                                    <th scope="row">클래스 설명</th>
                                    <td><textarea cols="100" rows="10" style="overflow-y:auto;resize: none;border:none;" name="classDetail" required></textarea></td>
                                </tr>
                                <tr>
                                    <th scope="row">클래스 시작일</th>
                                    <td><input id="classEnroll" type="text" name="classEnroll" required></td>
                                </tr>
                                <tr>
                                    <th scope="row">클래스 시작 시간</th>
                                    <td><input id="classStartTime" type="text" name="classStartTime" required></td>
                                </tr>
                                <tr>
                                    <th scope="row">클래스 최대 인원</th>
                                    <td><input id="classPerson" type="text" name="classPerson" required></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: right; border-bottom: none; text-align:center;"><input id="submitBtn" type="submit" class="btn btn-primary" value="등록하기" style="width:30%"></td>
                                </tr>
                            </tbody>

                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div id="seller_footer">
        © SoolZaRi 술자리
    </div>
    <script>
    $(function(){
    	$("#submitBtn").click(function(event){
    		var count=0;
    		var timeReg = /^([01][0-9]|2[0-3]):([0-5][0-9])$/;
    		if(!timeReg.test($("#classStartTime").val())){
    			alert("올바르지 않은 클래스 시작시간입니다.");
    			count++;
    		}
    		var moneyReg = /^[0-9]{1,}$/;
    		if(!moneyReg.test($("#classPrice").val())){
    			alert("올바르지 않은 펀딩금액입니다. (숫자만 입력가능)");
    			count++;
    		}
    		
    		var dateReg = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
    		if(!dateReg.test($("#classEnroll").val())){
    			alert("올바르지 않은 날짜 지정입니다. (YYYY-MM-DD)");
    			count++;
    		};
    		
    		var peopleReg = /^[0-9]{1,}$/;
    		if(!peopleReg.test($("#classPerson").val())){
    			alert("올바르지 않은 펀딩금액입니다. (숫자만 입력가능)");
    			count++;
    		}
    		
    		if(count>0){
    			event.preventDefault();
    		}
    	});
    	
    })
    </script>
</body>
</html>