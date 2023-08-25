<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.0/chart.min.js"></script>
</head>
<body>
<div style="width: 700px; height: 700px;">
<canvas id="marginChart"> </canvas>
</div>
</body>
<%
    int[] bc = (int[])request.getAttribute("arr");
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
</html>
