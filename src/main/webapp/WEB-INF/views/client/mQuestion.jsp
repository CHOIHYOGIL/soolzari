<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/client/mypageFrm.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/mQuestion.css">

<div class="wrap2">
	<div class="sideNavi"></div>
	<div class="content">
		<div class="mainContent">
			<div class="listDiv">
				<div class="textRigth"><button class="questionBtn modalBtnDiv" type="button" data-toggle="modal" data-target="#question" style="line-height: 20px;">문의하기</button></div>
				<table class="listTable">
					<tr>
						<th class="th1">문의 제목</th>
						<th class="th2">작성일자</th>
						<th class="th3">답변여부</th>
					</tr>
					<c:if test="${list==null}">비엇다!!!!</c:if>
					<c:forEach items="${list }" var="qna">
						<tr>
							<td>
								<p>${qna.qnaName }</p>
							</td>
							<td>
								<p>${qna.qnaEnroll }</p>
							</td>
							<td>
							
								<c:if test="${qna.qnaAns==0 }">
									<p>답변대기</p>
								</c:if>
								<c:if test="${qna.qnaAns==1 }">
									<p>답변완료</p>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4" style="text-align: center;" id="pageNavi">${pageNavi }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	
</div>
<!-- Modal -->
  <div class="modal fade" id="question" role="dialog">
    <div class="modal-dialog" id="dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        	<h4 class="modal-title">1:1 문의하기</h4>
          	<button type="button" class="close" data-dismiss="modal">×</button>
        </div>
        <form action="/client/mQuestionInsert.sool" method="post">
        <div class="modal-body">
        	제목<br><textarea rows="1" cols="70" style="resize: none;" name="qnaName"></textarea>
	       	내용<br>
	        <textarea rows="12" cols="70" style="resize: none;" name="qnaCon"></textarea>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-default ">문의하기</button>
        </div>
        </form>
      </div>
      
    </div>
  </div>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script>
	//사이드바 호버
	$(".sideNaviA").hover(function(){
		if(!$(this).is(".a6")){
			$(".a6").css("background-color","white");
			$(".a6").css("color","black");
		}
	},function(){
		$(".a6").css("background-color","rgb(77, 80, 117)");
		$(".a6").css("color","white");
	});

	$(function(){
		$(".giftSel").remove();//선물함 선택 안보이게
		//조회기간별 조회(1,3,6,12개월)
		$(".searchA").eq(0).attr("href","/client/mQuestion.sool?reqPage=1&period=1");
		$(".searchA").eq(1).attr("href","/client/mQuestion.sool?reqPage=1&period=3");
		$(".searchA").eq(2).attr("href","/client/mQuestion.sool?reqPage=1&period=6");
		$(".searchA").eq(3).attr("href","/client/mQuestion.sool?reqPage=1&period=12");
		$(".searchA").each(function(){
			console.log($(this).attr("id"));
			console.log("m${period}");
			if($(this).attr("id")==("m${period}")){
				$(this).addClass("sA1");
			}
		});
	});
</script>
</body>
</html>