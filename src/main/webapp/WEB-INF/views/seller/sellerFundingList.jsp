<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>술자리 판매자 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/sellerFundingList.css">
</head>
<body>
    <div class="seller_header">
        <header>
            <div id="seller_banner" style="display:block;"><img src="imgs/szrbanner.png" style="height:30px;margin-top:5px;margin-bottom: 5px;width:115px;">
                <h5 style="margin:0 auto;">판매자페이지</h5>
            </div>
            <nav>
                <span>판매자 홍길동님 환영합니다.</span>
                <span><input type="button" class="btn btn-primary" value="고객페이지"></span>
                <span><input type="button" class="btn btn-primary" value="마이페이지"></span>
                <span><input type="button" class="btn btn-danger" value="로그아웃"></span>
            </nav>
        </header>
    </div>
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
                            <a href="/seller/fundingOpen.sool">펀딩 열기</a>
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

                <h2 style="text-align: center;padding:20px;margin: 0 auto;background-color:#f7b8b4;"> 내 펀딩 목록 </h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">펀딩 번호</th>
                            <th scope="col">펀딩 이름</th>
                            <th scope="col">펀딩 목표액</th>
                            <th scope="col">펀딩 시작일</th>
                            <th scope="col">펀딩 종료일</th>
                            <th scope="col">선택</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${list }" var="f">
                            <tr>
                                <th scope="row">${f.fundNo}</th>
                                <td><a href="/shop/seller/fundingDetail.sool?fundNo=${f.fundNo }">${f.fundName}</a></td>
                                <td>${f.fundMoney}</td>
                                <td>${f.fundDate}</td>
                                <td>${f.fundEndDate}</td>
                                <td><input type="checkbox"></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="main_sub">
                    <div id="main_search">
                        <form action="/shop/seller/searchFunding.sool" method="post">
                            <select name="search_type" style="margin-left: 10px;">
                                <option value="name">펀딩 이름</option>
                            </select>
                            <input type="text" name="search" placeholder="검색할 내용을 적어주세요">
                            <input type="submit" value="찾기">
                        </form>
                    </div>
                    <div id="main_crud">
                        <input type="button" onclick="javascript:;" value="펀딩 삭제">
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