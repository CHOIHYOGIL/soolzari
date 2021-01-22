<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>술자리 판매자 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<link href="/resources/css/sellerFundingDetail.css" rel="stylesheet" type="text/css">
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
                            <a href="/seller/goodsList.sool?reqPage=1">상품 보기</a>
                        </div>
                    </li>
                    <li class="item" id="class_con">
                        <a href="#class_con" class="btn-left">클래스 관리</a>
                        <div class="subMenu">
                            <a href="/seller/classAdd.sool">클래스 등록</a>
                            <a href="/seller/classList.sool?reqPage=1">클래스 확인</a>
                        </div>
                    </li>
                    <li class="item" id="funding_con">
                        <a href="#funding_con" class="btn-left">펀딩 관리</a>
                        <div class="subMenu">
                            <a href="/seller/fundingAdd.sool">펀딩 열기</a>
                            <a href="/seller/fundingList.sool?reqPage=1&selNo=${sessionScope.sessionSeller.selNo}">펀딩 확인</a>
                        </div>
                    </li>
                    <li class="item">
                        <a href="/seller/main.sool" class="btn-left">마이페이지</a>
                    </li>
                    <li class="item">
                        <a href="/seller/logout.sool" class="btn-left">로그아웃</a>
                    </li>
                </ui>
            </div>
        </div>
        <div id="main_container">
            <div id="main_content">
            <h2 style="text-align: center;padding:20px;margin: 0 auto;background-color:#f7b8b4;"> 펀딩 상세보기 </h2>
<div class="funding_det">
    <div class="funding_det_con">
        <div class="funding_det_img">
           <div class="funding_det_img1">
                <img src="/resources/image/${fd.filename1 }" id="det_img1">
            </div>
            <div class="funding_det_img2">
                <img src="/resources/image/${fd.filename2 }" id="det_img2">
            </div>
        </div>
        <div class="funding_det_cons">
          <div class="funding_det_con_1">
                <span id="funding_det_title">${fd.fundName }</span><br>
                <span id="funding_det_date">종료 날짜 : ${fd.fundEndDate}일</span>
            </div>
            <div class="funding_det_con_2">
                <span id="funding_det_money">목표 모금액 : ${fd.fundMoney } 원</span><br>
                <span id="funding_det_nowpri">현재 모금액 : ${fd.fundTotal }</span><span id="funding_det_percent"> [${fd.fundPercent }% 달성]</span>
            </div>
            <hr>
           <c:forEach items="${list }" var="f">
            <div funding="class_det_con_1">
                <span id="det_title">${f.fndGName }</span><br>
                <span id="det_content">구성품 : ${f.fndGCon}</span>
            </div>
            <div class="funding_det_con_3">
               <form action="/seller/fixfndgds.sool" method="post">
                <span id="det_price_title">후원가격</span><br>
                <input type="hidden" value="${f.fndGNo}" name="fndgdsNo">
                <span id="det_price">${f.fndGPri }원</span><br><br>
                <input type="button" name="modifyGoods" value="수정하기" style="width:49%;">
                <input type="button" name="deleteGoods" value="삭제하기" style="width:49%;">
                </form>
            </div>
            <hr>
            </c:forEach>
            
        </div>
    </div>
    <div class="funding_det_fix">
       <h2 style="text-align: center;padding:20px;margin: 0 auto;background-color:#f7b8b4;">상품 추가하기 </h2>
       <form action="/seller/addFundingGoods.sool" method="post">
        <table style="border:1px solid black; width:100%;height: 100%;">
            <tr style="height:30%;">
                <th style="width:25%;text-align:center;">상품 이름</th>
                <td><input type="text" name="gdsName"></td>
            </tr>
            <tr style="height:30%;">
                <th style="width:25%;text-align:center;">상품 설명</th>
                <td><input type="text" name="gdsPri"></td>
            </tr>
            <tr style="height:30%;">
                <th style="width:25%;text-align:center;">상품 가격</th>
                <td><input type="text" name="gdsPri"></td>
            </tr>
            <tr style="height:40%;">
                <td colspan="2"><input type="submit" value="추가하기" style="width:100%; border:none; height:100%;background-color: #4d5075; color:white;"></td>
            </tr>
        </table>
        </form>
    </div>
</div>
            </div>
        </div>
    </div>
    <div id="seller_footer">
        © SoolZaRi 술자리
    </div>
</body>

</html>