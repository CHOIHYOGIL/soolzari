<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/css/sellerLogin.css">
</head>

<body>
    <div class="login-box">
        <form action="#">
            <h2 id="login-box-title">로그인하기</h2>
            <input type="hidden" name="getMenu" value="shop">
            <input type="hidden" name="getPage" value="">
            <label for="seller_id">아이디</label><input type="text" id="seller_id" name="seller_id" value="" placeholder="아이디를 입력해주세요">
            <label for="seller_pw">비밀번호</label><input type="password" id="seller_pw" name="seller_pw" value="" placeholder="비밀번호">
            <button type="submit" name="button" class="submit-btn">로그인</button>
            <div class="loginNot">
                <span>본 페이지는 판매자 전용입니다<br>일반 사용자는 고객페이지를 이용해주세요</span>
                <div><a href="#">회원가입</a></div>
                <span>로그인 정보가 기억나지 않으세요?</span>
                <div class="box-flex">
                    <a href="#">아이디 / 비밀번호 찾기</a>
                </div>
            </div>
        </form>
    </div>
</body>

</html>
