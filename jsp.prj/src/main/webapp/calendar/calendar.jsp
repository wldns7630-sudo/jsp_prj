<!DOCTYPE html>
<%@page import="java.util.Calendar"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="shortcut icon" href="../images/favicon.ico">
<!-- Bootstrap CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.min.js" integrity="sha384-G/EV+4j2dNv+tEPo3++6LCgdCROaejBqfUeNjuKAiuXbjrxilcCdDz6ZAVfHWe1Y" crossorigin="anonymous"></script>

<style type="text/css">

#wrap {width:1000px; height:900px;margin:0px auto;}
#header {height:200px; }
#container { height:600px;}
#footer { height:100px;}

a{ text-decoration: none; color: #333}
a:hover{ text-decoration: underline; color: #1E4183}

/* 달력 */
#calHeader{font-size: 20px; text-align: center}
.calTitle{font-size: 30px; font-weight: bold}

#calTab, th,td {border: 1px solid #E5E5E5 }
th {text-align: center; color: #909090}
td {width:120px; height: 80px; font-size: 15px; color: #909090;
		text-align: right; vertical-align: top}

.sunTitle{width: 100px; height: 30px; background-color: #D80000;
			color: #FFFFFF; font-weight: bold }
.weekTitle{width: 100px; height: 30px;}
.satTitle{width: 100px; height: 30px; background-color: #2626FF;
			color: #FFFFFF; font-weight: bold }

.sunTextColor{color: #E72203; font-weight: bold}
.weekTextColor{color: #303030}
.satTextColor{color: #2626FF; font-weight: bold}

.toDayCss{ border: 1px solid #6C86C4; background-color: #A5C6E0}

</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">

$(function () {
			
});//ready
		
</script>

</head>
<body>

<div id="wrap">
<div id="header"></div>
<div id="container">
</div>

<div id="calWrap">
<%
Calendar cal=Calendar.getInstance();
int nowYear=cal.get(Calendar.YEAR);
int nowMonth=cal.get(Calendar.MONTH)+1;
int nowDay=cal.get(Calendar.DAY_OF_MONTH);

%>

<div id="calHeader">
<a href="#void" title="이전 월">&lt;&lt;</a>

<a href="#void" title="오늘">
<span class="calTitle"><%=nowYear %>.<%=nowMonth%></span></a>

<a href="#void" title="다음 월">&gt;&gt;</a>
</div>

<div id="calContainer">
<table id="calTab">
<thead>

<tr>

<th class="sunTitle">일</th>
<th class="weekTitle">월</th>
<th class="weekTitle">화</th>
<th class="weekTitle">수</th>
<th class="weekTitle">목</th>
<th class="weekTitle">금</th>
<th class="satTitle">토</th>

</tr>
</thead>

<tbody>
<tr>

<%
public static final int START_DAY=1;
%>
<%
String textCss=""; //요일별 글자색을 설정
String tdCss=""; //오늘을 강조하기 위한 CSS

for(int tempDay=1; ; tempDay++){ //1일에서부터 무한 루프로 증가시킨다.
	//증가하는 임시일자를 달력 객체에 설정한다.
	cal.set(Calendar.DAY_OF_MONTH, tempDay);
	//현재월에 없는 날짜가 입력되면 자동으로 다음달 1일로 된다.
	//6월 기준 31이 입력되면 7월 1일
	if(cal.get(Calendar.DAY_OF_MONTH)!=tempDay){
		break;
	}//end if
	
	//1일을 출력하기 전에 공백을 설정
	switch(tempDay){
	case 1 :
		int startDayOfWeek=cal.get(Calendar.DAY_OF_WEEK);
		for (int blankTd=1; blankTd < startDayOfWeek ; blankTd++) {
			%>
			<td></td>
			<%
		
		}//end for
	}//end switch

 	//증가하는 일을 브라우저 출력
 	switch(cal.get(Calendar.DAY_OF_WEEK)){
 	case Calendar.SUNDAY : textCss="sunTextColor";break;
 	case Calendar.SATURDAY : textCss="satTextColor";
 	}//end switch
 	
 	tdCss="dayCSS";
 	if(tempDay == nowDay){
 		tdCss="toDayCss";
 	}//end if
 	
	//증가하는 일을 브라우저 출력
%>

<td class="<%= tdCss %>"><span class="<%= textCss %>"><%= tempDay %></span></td>
<%
//설정된 요일이 토요일이면 줄을 변경
switch(cal.get(Calendar.DAY_OF_WEEK)){
case Calendar.SATURDAY:
%>
</tr>
<tr>
<%
}//end switch
}//end for
%>	
	
</tr>

</tbody>

</table>
</div>
</div>

<div id="footer"></div>
</div>
 
</body>
</html>