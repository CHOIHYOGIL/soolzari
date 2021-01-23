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
                    <li class="item" id="mypage_con">
                        <a href="#mypage_con" class="btn-left">마이페이지</a>
                        <div class="subMenu">
                            <a href="/seller/mypage1.sool">정보 수정</a>
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
                                    <td><input type="text" name="className"></td>
                                </tr>
                                <tr>
                                    <th scope="row">클래스 개최인</th>
                                    <td><input type="text" name="selName" value="${sessionScope.sessionSeller.selName }" readonly>
                                    <input type="hidden" name="selNo" value="${sessionScope.sessionSeller.selNo }"></td>
                                </tr>
                                <tr>
                                    <th scope="row">등록 가격</th>
                                    <td><input type="text" name="classPrice"></td>
                                </tr>
                                <tr>
                                    <th scope="row">클래스 설명</th>
                                    <td><textarea cols="50" rows="10" style="overflow-y:auto;resize: none;border:none;" name="classDetail"></textarea></td>
                                </tr>
                                <tr>
                                    <th scope="row">클래스 시작일</th>
                                    <td><input type="text" name="classEnroll"></td>
                                </tr>
                                <tr>
                                    <th scope="row">클래스 시작 시간</th>
                                    <td><input type="text" name="classStartTime"></td>
                                </tr>
                                <tr>
                                    <th scope="row">클래스 최대 인원</th>
                                    <td><input type="text" name="classPerson"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: right; border-bottom: none; text-align:center;"><input type="submit" class="btn btn-primary" value="등록하기" style="width:30%"></td>
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
       
    </script>
</body>
</html>