<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/sellerRegist.css">
</head>
<body>
    <div class="regist_box">
        <form action="/seller/registChk.sool" method="post">
            <h2 id="regist_box_title">회원가입</h2>
            <label for="selId">아이디</label><input type="text" id="selId" name="selId" value="" placeholder="아이디를 입력해주세요" required>
            <label for="selPw">비밀번호</label><input type="password" id="selPw" name="selPw" value="" placeholder="비밀번호를 입력해주세요" required>
            <label for="selPwRe">비밀번호 확인</label><input type="password" id="selPwRe" name="selPwRe" value="" placeholder="비밀번호를 한번 더 입력해주세요" required>
            <label for="selName">판매자 이름</label><input type="text" id="selName" name="selName" placeholder="판매자 이름을 입력해주세요" required>
            <label for="selTel">판매자 전화번호</label><input type="text" id="selTel" name="selTel" placeholder="000-0000-000" required>
            <label for="selAddr">판매자 주소</label><input type="text" id="selAddr" name="selAddr" placeholder="판매자 주소를 입력해주세요" required>
            <button type="submit" name="button" class="submit-btn">회원가입</button>
        </form>
    </div>
</body>
</html>