<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="/resources/css/noticeViewClient.css" rel="stylesheet" type="text/css">
</head>
<body>
	<section>
        <h1>공지사항</h1>
        <table class="notice">
            <tr>
                <th>제목</th>
                <td colspan="3">${n.noticeTitle}</td>
            </tr>
            <tr>
                <th>작성자</th>
                <td>${n.noticeWriter}</td>
                <th>작성일</th>
                <td>${n.noticeEnroll}</td>
            </tr>
            <tr>
                <th>첨부파일</th>
                <c:if>
                    <td>
                        <img src="/resources/image/file.png" width="16px">
                        <a href="#">${filename}</a>
                    </td>
                </c:if>
            </tr>
            <tr>
                <td colspan="4">${n.noticeContent}</td>
            </tr>
        </table>
        <button id="list">목록</button>
        <div id="prev"><img src="/resources/image/arrowu/png"><span>prev</span><a href="#">${ }</a></div>
        <div id="next"><img src="/resources/image/arrowd.png"><span>next</span><a href="#">${ }</a></div>
    </section>
    
    <script>
        $("#list").click(function(){
            location.href="/notice/list.sool?reqPage=1";
        });
        $("#prev").click(function(){
        	location.href="";
        });
        $("#next").click(function(){
        	location.href="";
        });
    </script>
</body>
</html>