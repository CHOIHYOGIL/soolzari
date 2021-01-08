<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
                <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/reservation.css">

   
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>

	<!-- 결제 api -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    
    <!--font-->
    <link href='/resources/fullcalendar-4.4.0/packages/core/main.css' rel='stylesheet' />
    <link href='/resources/fullcalendar-4.4.0/packages/daygrid/main.css' rel='stylesheet' />
<link href='/resources/fullcalendar-4.4.0/packages/timegrid/main.css' rel='stylesheet' />
<link href='/resources/fullcalendar-4.4.0/packages/list/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar-4.4.0/packages/core/main.js'></script>
<script src='/resources/fullcalendar-4.4.0/packages/interaction/main.js'></script>
<script src='/resources/fullcalendar-4.4.0/packages/daygrid/main.js'></script>
<script src='/resources/fullcalendar-4.4.0/packages/timegrid/main.js'></script>
<script src='/resources/fullcalendar-4.4.0/packages/list/main.js'></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
  

    <!-- moment -->
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script> 
	
	     <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script> 


    <!-- icon 사용-->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    <!-- script -->
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
  
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
   <script src="/resources/js/bootstrap.min.js"></script>


    <!-- 반응형 -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=0, maximum-scale=1.0">
</head>
<body>
 <%@include file="/WEB-INF/views/common/header.jsp" %>
 <section class="carousel">

            <div id="carousel-example-generic" class="carousel slide">
                <ol class="carousel-indicators">

                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <div class="carousel-inner">
                    <div class="item active">
                        <img src="resources/image/reservation1.PNG" alt="" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="resources/image/reservation2.PNG" alt="" style="width:100%;">
                    </div>

                    <div class="item">
                        <img src="resources/image/reservation3.PNG" alt="" style="width:100%;">
                    </div>

                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </section>
        
        
         <div class="soolzari_container">
           
           <div class="reservationLogo" style="text-align: center;">
               
               <img src="/img/%EB%A1%9C%EA%B7%B8%EC%9D%B8%EB%A1%9C%EA%B3%A0.png" alt="">
           </div>
            <h2 class="fw300 fs34 f_scd text-center mb40" style="background:#f4f4f4;">술자리<span style="font-size: 30px;">양조장 체험</span>프로그램 </h2><br><br>
           
            <div class="choiceBtn">
                <ul class>
                    <li>
                        <a href="#">체험안내</a>
                    </li>
                    <li>
                        <a href="#">체험예약</a>
                    </li>
                </ul>
            </div>
            
            <div class="text-table">
                <div>
                    <h5 style="text-align: center;"><span>다양한 체험을 통해 우리 전통주를 만나는</span></h5>
                     <h5 style="text-align: center;"><span>오감만족 술자리 양조장체험</span></h5>
                </div>
            </div>
        </div>
        
          <div id="calendar"  style="position: relative">  </div>
          
          <!-- 모달 -->
           <div class="modal">
           <div class="modal-top">
               <h1>클래스 예약</h1>
               <hr>
           </div>
           <div class="modal-content">
               <form method="post">
                
                <div class="name">
                     <span class="first">클래스 이름 : </span> <input type="text" class="className" name="className" placeholder="클래스이름">
                </div><br>
                <div class="creator">
                      <span class="first">클래스 개설자 : </span> <input  type="text" class="classCreator" name="classCreator" placeholder="클래스개설자">
                </div><br>
                        <div class="description">
                                         <span class="first" style="text-align: center;">클래스 설명 </span> 
               <input type="text" name="classDescription" class="classDescription" placeholder="음식디미방 전통주(감향주 등) 만들기체험">
                  
                 </div><br>
                 
                 <div class="person">
                     <span class="first">인원 : </span><input type="number" class="classPerson" min="1" max="15" name="classPerson" placeholder="1">
                 </div><br>
                  <div class="price">
                       <span class="first">클래스 참가비 : </span><input type="text"class="classPrice" name="classPrice"placeholder="20000">
                  </div><br>

                     <div class="date">
                         <span class="first">예약일</span><input type="text"  class="classDate"name="classEnroll" placeholder="2020-02-24">
                     </div><br>
                     
                     
               <br>
                      <div class="btnGroup">
                             <input type="button" id="payBtn" value="예약">
                   			<input type="button" value="취소">
                      </div>
                  
               </form>
           </div>
       </div>
        
    
    <%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>

<script>
		
 /* 결제   */
  $(function(){
	
	$("#payBtn").click(function(){
		
		var id='<%=session.getAttribute("sessionId")%>';
		console.log("session: "+id);
		var name='<%=session.getAttribute("sessionName")%>';
		console.log("name : "+name);
		var email='<%=session.getAttribute("sessionEmail")%>';
		var phone='<%=session.getAttribute("sessionPhone")%>';
		var addr='<%=session.getAttribute("sessionAddr")%>';
		var price=100;
		console.log("price : "+price);
		var d = new Date();
		var date = d.getFullYear() + '' + (d.getMonth() + 1)
				+ '' + d.getDate() + '' + d.getHours() + ''
				+ d.getMinutes() + '' + d.getSeconds();
		IMP.init('imp16593684');
		
		IMP.request_pay({
			merchant_uid : 'soolZari' + date,//상점거래ID
			name : name+"-"+'클래스 결제', //결제이름
			amount : price, //결제금액
			buyer_email : email,
			buyer_name : name,
			buyer_tel : phone,
			buyer_addr : addr,
			buyer_postcode : "000-000" //우편번호
		},function(rsp){
			if(rsp.success){
				var msg='클래스 예약 결제가 완료되었습니다';
			        msg += '결제 금액 : ' + rsp.paid_amount;
			      
			        alert(msg);
			    
			}else{
				var msg='결제 실패하셨습니다';
				  msg += '에러내용 : ' + rsp.error_msg;
				  alert(msg);
			}
		})
		
		
	})
	  
  })



$(function(){
    // 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
    $('#carousel-example-generic').carousel({
    // 슬리아딩 자동 순환 지연 시간
    // false면 자동 순환하지 않는다.
    interval: 5000,
    // hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
    pause: "hover",
    // 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
    wrap: true,
    // 키보드 이벤트 설정 여부(?)
    keyboard : true
    });
    });
   

$(function(){
	$(".fc-past").text('예약불가');
	$(".fc-today").text('예약불가');
	//$(".fc-future").append(("<a href="#">test</a>"));
	$("input[type=number]").change(function(){
		var person=$(this).val();
		console.log("person : "+person);
		var price=$(".classPrice").val();
		console.log("price : "+price);
		var amount=price*person;
		console.log("amount: "+amount);
		
		$(".classPrice").val(amount);
	})
	 
});



</script>
 
 <script>
 
 	function getInput(info){
		console.log("getInput");

 		var today=dateFormat(info.event.start);
 		console.log(today);
 		var title=info.event.title;
 		var price;
 		var creator;
 		var description;
 	 	if(title==='클래스1'){
 	 		price='20000';
 	 		description="음식디미방 전통주(김향주 등)만들기";
 	 		creator="최효길";
 	 	}else{
 	 		price='15000';
 	 		creator="유대호";
 	 		description="전통주 만들기 및 시음 체험";
 	 	}
 	 	console.log("price : "+price);
 	 	$(".classPerson").val('1');
 	 	$(".className").val(info.event.title);
 	 	$(".classDate").val(today);
 	 	$(".classPrice").val(price);
 	 	$(".classCreator").val(creator);
 	 	$(".classDescription").val(description);
 	}
 	
 	function dateFormat(data){
 		
 		var yyyy=data.getFullYear();
 		var MM=data.getMonth()+1;
 		var dd=data.getDate();
 		var rtnDate=yyyy+'-'+MM+'-'+dd;
 		return rtnDate;
 	}
 	
 	/* 모달창 취소*/
 	 $("input[type=button]").click(function(){
 		   
 		 $('.modal').modal("hide");
 	   });
 </script>
 
<script>




  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
	var session='<%=session.getAttribute("sessionId")%>';
	console.log("session: "+session);
    var date = new Date();
    var date1 = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    var calendar = new FullCalendar.Calendar(calendarEl, {
      plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
      initialView: 'dayGridMonth',
      header: {
        left: '',
        center: 'prev,title,next',
        right: ''
      },
      
      locale:"ko",
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      eventLimit:true,
      selectable:true,
      //hiddenDays:[ 0, 6 ],
      eventConstraint: {
		  start: moment().format('YYYY-MM-DD'),
		  
		  end: '2200-01-01'
		},
      
      dateClick:function(info){
    	  var myDate= moment().format('YYYY-MM-DD');
    	  var clickDate=info.dateStr;
    	
    	  
    	  if(clickDate <= myDate){
    		  
    		  alert("예약불가");
    	  }else{
    		 
        	  alert('Date :'+info.dateStr);
     
        	    info.dayEl.style.backgroundColor = 'beige';
        	  
        	  //  $('.modal').modal("show");
      
    	  }
    	
      },
      
   

    	events:[
    		
    		{
    			title:'클래스1',
    			startRecur: date.setDate(d+1),
    			daysOfWeek:['0','1','2','3','4','5','6'],
    			endRecur:date.setMonth(m+1),
    			startTime:'13:00',
    			endTime:'15:00',
    			start: moment().format('YYYY-MM-DD'),
    			color:'#e5e5e5'
    			
    			
    		},
    		{
    			title:'클래스2',
    			startRecur:date1.setDate(d+1),
    			endRecur:date.setMonth(m+1),
    			daysOfWeek:['0','1','2','3','4','5','6'],
    			startTime:'10:00',
    			
    			endTime:'12:00',
    			color:'#cdd0cb'
    		
    		}
    	],
    	eventClick:function(info){
    		
    		
    		alert("event : "+info.event.title);
    		
    		console.log("content :"+info.event.start);
    		console.log("event Session:"+session);
    		if(session=='null'){
    			alert('로그인 후 예약가능합니다');
    		}else{
    			$('.modal').modal("show");
        		getInput(info);
    		}
    	
    	}
    	
    	/*
    	businessHours: {
    		  // days of week. an array of zero-based day of week integers (0=Sunday)
    		  daysOfWeek: [1, 2, 3, 4,5], // Monday - Thursday
    		  startTime: "10:00", // a start time (10am in this example)
    		  endTime: "18:00" // an end time (6pm in this example)
    		},
    		selectConstraint: "businessHours",
    		*/
      
      
    });

    calendar.render();
  });

  
 
  

</script>