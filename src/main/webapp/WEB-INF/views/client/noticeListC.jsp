<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="/resources/css/noticeClient.css" rel="stylesheet" type="text/css">
</head>
<body>
	<section>
		<h1>공지사항</h1>
		<table class="notice">
			<tr>
				<th>번호</th>
				<th>제목</th>
                <th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list }" var="n">
				<tr id="content">
					<td>${n.noticeNo }</td>
					<c:when test="${n.noticeEnroll eq today }">
						<td>${n.noticeTitle }<span>new !</span></td>
					</c:when>
					<c:otherwise>
						<td>${n.noticeTitle }</td>
					</c:otherwise>
					<td>${n.noticeWriter }</td>
					<td>${n.noticeEnroll }</td>
					<td>${n.noticeCount }</td>
				</tr>
			</c:forEach>
		</table>
        <form action="/notice/findC.sool" method="post">
            <select name="date">
                <option value="week">일주일</option>
                <option value="month">한달</option>
                <option value="all">전체</option>
            </select>
            <select name="type">
                <option value="title">제목</option>
                <option value="content">내용</option>
                <option value="writer">작성자</option>
            </select>
            <input type="hidden" name="reqPage" value=1>
            <input type="text" name="search">
            <input type="submit" value="찾기">
        </form>
            <div class="page">
            	${page }
            </div>
	</section>
	
	<script>
		$(function(){
			$("#content").click(function(){
                var noticeNo = $(this).children().eq(0).html();
                location.href="/notice/viewClient.sool?noticeNo"+noticeNo;
            });
		});
	</script>
</body>
</html>