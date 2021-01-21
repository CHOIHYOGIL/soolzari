<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������</title>
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
      function userChart() {//����� ��Ȳ
        var data = google.visualization.arrayToDataTable([
          ['�����', '����� ��Ȳ'],
          ['�Ϲ�ȸ��', ${user.client}],
          ['���� A', ${user.clientA}],
          ['���� B', ${user.clientB}],
          ['�Ǹ���', ${user.seller}]
        ]);

        var options = {
          title: '����� ��Ȳ',
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
        	  arr.push(['��', 'Ź��', 'û��', '������', '����', '������', '���']);
        	  for(var i=0;i<list.length;i++){
            	  arr.push([list[i].month, Number(list[i].takju), Number(list[i].chungju), Number(list[i].soju), Number(list[i].wine), Number(list[i].fruit), Number(list[i].avg)]);
              }
        	  var data = google.visualization.arrayToDataTable(arr);

                var options = {
                  title: '��ǰ �Ǹŷ�',
                  vAxis: {title: '�Ǹ� ����'},
                  hAxis: {title: '��'},
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
            ['��', 'Ŭ���� ����'],
            ['${pprev}��', ${classes.pprev}],
            ['${prev}��', ${classes.prev}],
            ['${now}��', ${classes.now}],
            ['${next}��', ${classes.next}],
            ['${nnext}��', ${classes.nnext}]
          ]);

          var options = {
        	 title: 'Ŭ���� ���� ��Ȳ',
        	 vAxis: {title: 'Ŭ���� ���� ��'},
             hAxis: {title: '��'},
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
              ['�ݵ�', '�޼���'],
              ['100% �̻�', ${funding.one}],
              ['80% �̻�', ${funding.eight}],
              ['50% �̻�', ${funding.five}],
              ['�̴޼�', ${funding.zero}]
            ]);

            var options = {
              title: '�ݵ� �޼���',
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