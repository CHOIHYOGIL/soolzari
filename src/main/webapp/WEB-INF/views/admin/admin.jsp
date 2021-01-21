<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자</title>
<link href="/resources/css/admin.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(userChart);
      google.charts.setOnLoadCallback(goodsChart);
      google.charts.setOnLoadCallback(classChart);
      google.charts.setOnLoadCallback(fundingChart);
      let list;
      function userChart() {//사용자 현황
        var data = google.visualization.arrayToDataTable([
          ['사용자', '사용자 현황'],
          ['일반회원', ${user.client}],
          ['구독 A', ${user.clientA}],
          ['구독 B', ${user.clientB}],
          ['판매자', ${user.seller}]
        ]);

        var options = {
          title: '사용자 현황',
          pieHole: 0.4,
          colors:['#4d5075','#bca0c9','#f7b8b4','#ffd0bf'],
          fontSize: 16
        };

        var chart = new google.visualization.PieChart(document.getElementById('userChart'));
        chart.draw(data, options);
      }
      
      function goodsChart() {
    	  if(list !== undefined){
    		  var arr = new Array();
        	  arr.push(['월', '탁주', '청주', '증류주', '와인', '과실주', '평균']);
        	  for(var i=0;i<list.length;i++){
            	  arr.push([list[i].month, Number(list[i].takju), Number(list[i].chungju), Number(list[i].soju), Number(list[i].wine), Number(list[i].fruit), Number(list[i].avg)]);
              }
        	  var data = google.visualization.arrayToDataTable(arr);

                var options = {
                  title: '상품 판매량',
                  vAxis: {title: '판매 개수'},
                  hAxis: {title: '월'},
                  seriesType: 'bars',
                  series: {5: {type: 'line'}},
                  colors:['#4d5075','#bca0c9','#f7b8b4','#ffd0bf', 'rgb(251, 220, 173)', 'rgb(215, 109, 119)', 'rgb(254, 180, 123)'],
                  fontSize: 16
                };

                var chart = new google.visualization.ComboChart(document.getElementById('goodsChart'));
                chart.draw(data, options);  
    	  }
    	  
        }
      
      	function classChart() {
          var data = google.visualization.arrayToDataTable([
            ['월', '클래스 예약'],
            ['${pprev}월', ${classes.pprev}],
            ['${prev}월', ${classes.prev}],
            ['${now}월', ${classes.now}],
            ['${next}월', ${classes.next}],
            ['${nnext}월', ${classes.nnext}]
          ]);

          var options = {
        	 title: '클래스 예약 현황',
        	 vAxis: {title: '클래스 예약 수'},
             hAxis: {title: '월'},
             colors: ['#4d5075','#bca0c9','#f7b8b4','#ffd0bf', 'rgb(251, 220, 173)', 'rgb(215, 109, 119)', 'rgb(254, 180, 123)'],
             fontSize: 16
          };

          var chart = new google.visualization.ColumnChart(document.getElementById('classChart'));
          chart.draw(data, options);
        }
      	
      	$(function(){
      		$.ajax({
      			url : "/selectSool.sool",
      			type : "post",
      			success : function(data){
      				list = data;
      				goodsChart();
      			}
      		});
      	});
      	
      	function fundingChart() {
            var data = google.visualization.arrayToDataTable([
              ['펀딩', '달성률'],
              ['100% 이상', ${funding.one}],
              ['80% 이상', ${funding.eight}],
              ['50% 이상', ${funding.five}],
              ['미달성', ${funding.zero}]
            ]);

            var options = {
              title: '펀딩 달성률',
              pieHole: 0.4,
              colors: ['#4d5075','#bca0c9','#f7b8b4','#ffd0bf', 'rgb(251, 220, 173)', 'rgb(215, 109, 119)', 'rgb(254, 180, 123)'],
              fontSize: 16
            };

            var chart = new google.visualization.PieChart(document.getElementById('fundingChart'));
            chart.draw(data, options);
          }
    </script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/navi.jsp"/>
	<section>
	    <div class="main">
	        <img src="/resources/image/logo1.png">
		    <div id="userChart"></div>
		    <div id="goodsChart"></div>
		    <div id="classChart"></div>
		    <div id="fundingChart"></div>
	    </div>
	</section>
</body>
</html>