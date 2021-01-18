<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link href="/resources/css/notice.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<section>
		<jsp:include page="/WEB-INF/views/admin/navi.jsp"/>
		<h1 class="noticetitle">공지사항</h1>
		<table class="notice">
			<tr>
				<th>선택</th>
				<th>번호</th>
				<th>제목</th>
                <th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${list }" var="n">
				<tr id="content">
					<td><input type="checkbox" name="chk"></td>
					<td>${n.noticeNo }</td>
					<c:choose>
						<c:when test="${n.noticeEnroll eq today }">
							<td>${n.noticeTitle }<span>new !</span></td>
						</c:when>
						<c:otherwise>
							<td>${n.noticeTitle }</td>
						</c:otherwise>
					</c:choose>
					<td>${n.noticeWriter }</td>
					<td>${n.noticeEnroll }</td>
					<td>${n.noticeCount }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="wrap">
            <input type="checkbox" name="allchk" id="allchk"><label for="allchk">전체 선택</label>
            <button id="delete">삭제</button>
            <div class="write">
                <button onclick="noticeFrm();">글쓰기</button>
            </div>
        </div>
        <form action="/notice/find.sool" method="post">
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
		function noticeFrm(){
			location.href="/notice/form.sool";
		}
		$(function(){
			$("#allchk").click(function(){
				var chk = $("[name=chk]");
                if($(this).is(":checked")){
                    for(var i=0;i<chk.length;i++){
                        chk[i].checked = true;
                    }
                }else{
                    for(var i=0;i<chk.length;i++){
                        chk[i].checked = false;
                    }
                }
			});
			$("#delete").click(function(){
				var chk = $("[type=checkbox]:checked");
				var noticeNo = new Array();
				chk.each(function(index, item){
					noticeNo.push($(item).parent().next().html());
				});
				location.href="/notice/delete.sool?noticeNo="+noticeNo.join("/");
			});
			$("#content").click(function(){
                var noticeNo = $(this).children().eq(1).html();
                location.href="/notice/view.sool?noticeNo"+noticeNo;
            });
		});
	</script>
</body>
</html>