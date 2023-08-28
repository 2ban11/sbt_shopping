<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
<link rel="stylesheet" href="resources/css/jh/adminDetail.css" />
</head>
<body>
<div class="marginContainer">
<h2 class="marginTitle">날짜 선택</h2>
<div class="marginContent">
    <div class="calendar-container">
        <header class="calendar-header">
            <p class="calendar-current-date"></p>
            <div class="calendar-navigation">
                <span id="calendar-prev"
                      class="material-symbols-rounded">
                    chevron_left
                </span>
                <span id="calendar-next"
                      class="material-symbols-rounded">
                    chevron_right
                </span>
            </div>
        </header>
 
        <div class="calendar-body">
            <ul class="calendar-weekdays">
                <li>Sun</li>
                <li>Mon</li>
                <li>Tue</li>
                <li>Wed</li>
                <li>Thu</li>
                <li>Fri</li>
                <li>Sat</li>
            </ul>
            <ul class="calendar-dates"></ul>
        </div>
    </div>
 <div id="calendar">
    <div id="calendar_header"><i class="icon-chevron-left"></i>          <h1></h1><i class="icon-chevron-right"></i>         </div>
    <div id="calendar_weekdays"></div>
    <div id="calendar_content"></div>
  </div>
  <div id="info-container" style="color:white;">
    <!-- 정보를 표시할 영역 -->
    <h2 id="info-header">일일 매상/매출</h2>
    <p><strong>날짜 &nbsp;</strong><br><span  name="selected-date" id="selected-date"></span></p>
    <p><strong>총 판매금 &nbsp;</strong><br><span for="totalSales" id="totalSales"></span></p>
    <p><strong>총 원가  &nbsp;</strong><br><span id="totalCost"></span></p>
    <p><strong>총 수익 &nbsp;</strong><br><span id="totalMargin"></span></p>
    <p><strong>마진률 &nbsp;</strong><br><span id="totalMarginByPercent"></span></p>
  <form action="insertMargin" method="post">
	<input hidden name="date" id="inputDate">
	<input hidden name="ma_totalSales" id="inputTotalSales">
	<input hidden name="ma_totalCost" id="inputTotalCost">
	<input hidden name="ma_totalMargin" id="inputTotalMargin">
    <button class="reg-info-btn">등록</button>
</form>
</div>
</div>
 
  
  <div id="lineChart">
<canvas id="marginChart"> </canvas>
</div>

</div>


</body>
   
<%
int[] bc = (int[]) request.getAttribute("arr");
%>
<script>
let ChartData = <%= Arrays.toString(bc) %>;
let marginChart = document.getElementById('marginChart').getContext('2d');
let data ={
    labels : ['SUN','MON','TUE','WED','THU','FRI','SAT'],
    datasets : [{
        label : '매출액',
        data : ChartData,
        borderColor: 'skyblue',
        borderWidth: 1,
        fill : false
    }]
};
let options = {
    scales: {
        y: {beginAtZero: true}
    }
};

let lineChart = new Chart(marginChart, {
    type : 'line',    
    data : data,
    options : options
});
</script>
<script type="text/javascript" src="resources/js/jh/calendar.js"></script>
</html>
