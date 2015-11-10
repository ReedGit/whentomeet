<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#meetingTime{
		font-family:"Helvetica Neue", Helvetica, Arial, sans-serif;
		-moz-user-select: none; 
		-khtml-user-select: none; 
		user-select: none;
		color: #333;
		background-color: #F8F8F8;
		width: 1270px;
		height: 577px;
		border: solid 0 #333;
		margin: 35px auto 100px;
		border-radius:5px;
		box-shadow: 0 0 30px #333;
	}
	#meetingTime #dateLable{
		text-align: center;
		width : 400px;
		height: 30px;
		margin: 0 auto;
		width: 100%;
		height: 45px;
		border-top-left-radius:5px;
		border-top-right-radius:5px;
		border-bottom: 1px solid #ddd;
		background: #f8f8f8;
		padding-top: 15px;
	}

	#meetingTime #lable{
		width: 318px;
		border:dotted 1px #ccc;
		text-align: center;
		padding-top: 10px;
		padding-bottom: 10px;
		margin: 11px auto;
		background-color: #F3F3CC;
		font-style: italic;
		font-size: 20px;
	}
	#meetingTime table{
	  table-layout:fixed;
	}
	
	#meetingTime #containTable table{
		width:1091px;
		border-right:solid 1px #bbb;
		border-top:none;
		border-left:solid 0 #bbb;
		border-bottom:solid 0 #bbb;
		border-collapse:collapse;
	}
	
	#meetingTime table tr td{
		width: 70px;
		height:18px;
	}
	#meetingTime #weekTitle{
		border-collapse:collapse;
		text-align:center;
		width: 1089px;
		margin-left: 76px;
		border-color: transparent;
		font-size: 13px;
		font-weight: bold;
	}
	#meetingTime #weekTitle span.date{
		font-weight: normal;
	    font-size: 12px;
	    padding: 0px;

	}
	#meetingTime #containTable{
		width: 1119px;
		height: 294px;
		overflow: auto;
		border-top:solid 1px #bbb;
		border-bottom:solid 1px #bbb;
		border-left:solid 0 #bbb;
		border-right:solid 1px #bbb;
		margin: 0 auto;
	}
	
	#meetingTime .withBg{
		background-color: #F5F5F8;
	}
	
	
	 #meetingTime #containTable td:nth-child(n+2){
	 	border-bottom-style: dotted;
	}
	#meetingTime #containTable tr:last-child{
	 	border-bottom: solid 0 #fff;
	}
	
	/*  #containTable tr:nth-child(4n){
	 	border-bottom: solid 1px #bbb;
	} */
	
	#meetingTime #containTable .midFill{
		width: 0.8px;
    	background: #ddd;
	}
	
	#meetingTime #weekTitle .midFill{
		width: 0.8px;
	}
	
	#meetingTime .timeLable{
		border:none;
		text-align: right;
	}
	
	#meetingTime .showTime{
		font-size: 12px;
	    text-align: right;
	    vertical-align: top;
	    padding-right: 5px;
	    line-height: 12px;
	}
	#meetingTime #changeTimeFormat a{
		font-size: 13px;
	   	color: #0088cc;
		font-weight: bold;
	    text-decoration: underline;
	    z-index: 9999;
	}
	#meetingTime #changeTimeFormat{
		text-align: right;
	    padding-right: 7px;
	    line-height: 12px;
	}
	#meetingTime #changeTimeFormat a:hover {
		color: #005A8F;
	}
	
	#meetingTime div.prevArrow{
		background: url("img/prevArrow.png");
		position: absolute;
	    top: 42%;
	    left:4%;
	    height: 120px;
	    width: 30px;
	    opacity: 0.40;
	}
	
	#meetingTime div.nextArrow{
		background: url("img/nextArrow.png");
		position: absolute;
	    top: 42%;
	    right: 1%;
	    height: 120px;
	    width: 30px;
	    opacity: 0.40;
	}
	#meetingTime #dateLable{
		white-space: pre;
	}
	
	#meetingTime .submitArea{
		position: relative;
		float: right;
		right: 114px;
		top:34px;
	}
	/* .submitArea #step2Back{
		width: 88px;
		height: 39px;
	} */
	#meetingTime .selected,.selectedTail{
		backgroundColor : #ffde7d;
	}
</style>
<%-- <%@ include file="public/headfile.html"%> --%>
<!-- <script type="text/javascript" src="js/zxx.color_exchange.js"></script>
<script type="text/javascript" src="js/timeTable.js"></script> -->
</head>
<body style="background-color: #669999;">

<%-- <%@ include file="public/head.html"%> --%>
<div id="wrapper">
<div id="meetingTime" unselectable="on" onselectstart="return false;" style="-moz-user-select:none;">
	<div id="dateLable"><h2></h2></div>
	<div id="lable"> 为见面选择可能的时间吧</div>
	<table border="1" id="weekTitle">
		<tr>
			<td id="changeTimeFormat"><br><a href="">12h</a></td>
			<td>星期日<br><span class="date"></span></td>
			<td>星期一<br><span class="date"></span></td>
			<td>星期二<br><span class="date"></span></td>
			<td>星期三<br><span class="date"></span></td>
			<td>星期四<br><span class="date"></span></td>
			<td>星期五<br><span class="date"></span></td>
			<td>星期六<br><span class="date"></span></td>
			<td class="midFill date"></td>
			<td>星期日<br><span class="date"></span></td>
			<td>星期一<br><span class="date"></span></td>
			<td>星期二<br><span class="date"></span></td>
			<td>星期三<br><span class="date"></span></td>
			<td>星期四<br><span class="date"></span></td>
			<td>星期五<br><span class="date"></span></td>
			<td>星期六<br><span class="date"></span></td>
		</tr>
	</table>

<div id="containTable">

	<div class="prevArrow"></div>
	<table border="1" id="selectTime">
		<c:forEach var="t" begin="0" end="95">
			<tr>
				<c:choose>
					<c:when test="${t%4==0 }">
						<td class="timeLable showTime"></td>
					</c:when>
					<c:otherwise>
						<td class="timeLable"></td>
					</c:otherwise>
				</c:choose>
				<td class="col_1 withBg"></td>
				<td class="col_2"></td>
				<td class="col_3"></td>
				<td class="col_4"></td>
				<td class="col_5"></td>
				<td class="col_6"></td>
				<td class="col_7 withBg"></td>
				<td class="col_8 midFill"></td>
				<td class="col_9 withBg"></td>
				<td class="col_10"></td>
				<td class="col_11"></td>
				<td class="col_12"></td>
				<td class="col_13"></td>
				<td class="col_14"></td>
				<td class="col_15 withBg"></td>
			</tr>
		</c:forEach>
	</table>
	<div class="nextArrow"></div>
	
</div>
<div class="submitArea">
	<a id="step2Back" class="btn btn-danger" href="#">返回</a>
       
    <button id="step2Submit" type="submit" class="btn btn-success">邀请参与人</button>
</div>

</div>
</div>
<!--/start-copyright-section-->
<!-- <div class="clearfix"></div>
		<div class="copyright">
			
		</div> -->
<!--//end-copyright-section-->
</body>
</html>