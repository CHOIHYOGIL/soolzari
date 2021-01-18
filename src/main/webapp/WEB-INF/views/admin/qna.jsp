<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<link href="/resources/css/qna.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/navi.jsp"/>
	<section>
		<h1 class="qnatitle">1:1 문의</h1>
		<table class="qna">
			<tr>
				<th>선택</th>
				<th>번호</th>
				<th>제목</th>
                <th>작성자</th>
				<th>작성일</th>
				<th>답변 여부</th>
			</tr>
			<c:forEach items="${list }" var="q">
				<tr id="content">
					<td><input type="checkbox" name="chk"></td>
					<td>${q.qnaNo }</td>
					<c:choose>
						<c:when test="${q.qnaEnroll eq today }">
							<td>${q.qnaName }<span>new !</span></td>
						</c:when>
						<c:otherwise>
							<td>${q.qnaName }</td>
						</c:otherwise>
					</c:choose>
					<td>${q.qnaWriter }</td>
					<td>${q.qnaEnroll }</td>
					<c:choose>
						<c:when test="${q.qnaAns == 0 }">
							<td>답변 대기</td>
						</c:when>
						<c:otherwise>
							<td>답변 완료</td>
						</c:otherwise>
					</c:choose>
					<input type="hidden" value="${q.qnaAns }">
				</tr>
			</c:forEach>
		</table>
		<div class="wrap">
            <input type="checkbox" name="allchk" id="allchk"><label for="allchk">전체 선택</label>
            <button id="delete">삭제</button>
        </div>
        <form action="/searchQna.sool" method="post">
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
			var qnaNo = new Array();
			chk.each(function(index, item){
				qnaNo.push($(item).parent().next().html());
			});
			location.href="/deleteQna.sool?qnaNo="+qnaNo.join("/");
		});
		$("#content").click(function(){
            var qnaNo = $(this).children().eq(1).html();
            var qnaAns = $(this).find($("[type=hidden]")).val();
            location.href="/qnaView.sool?qnaNo="+qnaNo+"&qnaAns="+qnaAns;
        });
	});
	</script>
</body>
</html>