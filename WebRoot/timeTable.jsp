<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>hi,来冒泡吧</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/timeTable.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/customer.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/zxx.color_exchange.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/timeTable.js"></script>
<script type="text/javascript" src="js/public.js"></script>
</head>
<body style="background-color: #669999;">
<div class="header"></div>
<div class="visible-xs">
	<br><br>
</div>
<div class="container visible-xs">
	<div class="row">
		<div class="well col-xs-12 bg-white">
			<div class="page-header no-margin-top text-center">
   				<h3 class="no-margin-top">为见面选择可能的时间吧</h3>
   				<small>时长：<span id="dura"></span></small>
			</div>
			<div class="well col-xs-12 col-xs-offset-0">
				<h4>&nbsp;&nbsp;已选择的时间：</h4>
				<div id="selectedDate" class="col-xs-offset-1">
					你还没有选择时间
				</div>
			
			</div>
			<div class="clearfix"></div>
			<h4>&nbsp;&nbsp;日期</h4>
			<select class="myform-control col-xs-9 col-xs-offset-1" id="select_data">
			</select>
			<div class="clearfix"></div>
			<h4>&nbsp;&nbsp;开始时间</h4>
			<select class="myform-control col-xs-4 col-xs-offset-1" id="select_hour">
			</select>
			<div class="col-xs-1 text-center"><b>:</b></div>
			<select class="myform-control col-xs-4" id="select_min">
			  <option value="00">00</option>
			  <option value="15">15</option>
			  <option value="30">30</option>
			  <option value="45">45</option>
			</select>
			<br>
			<br>
			<br>
			<button id="xs-selecttime" type="button" class="btn btn-primary col-xs-9 col-xs-offset-1">选择时间</button>
			<br>
			<br>
			<button id="xs-submit" type="button" class="btn btn-primary col-xs-9 col-xs-offset-1">完&nbsp;&nbsp;成</button>
			<br>
		</div>
	</div>
</div>
<div class="visible-xs">
	<br><br>
</div>



<div id="wrapper" class="hidden-xs">
<div id="meetingTime" unselectable="on" onselectstart="return false;" style="-moz-user-select:none;">
	<div id="dateLable"><h2 class="no-margin-top"></h2></div>
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
<div class="copyright"></div>

<script type="text/javascript">
	$(function(){
		var param = ${param.duration};
		var text = "";
		//当时长超过4，单位按小时，小于4单位按分钟，这样做的目的只是为了更人性化而已
		if(param>=4){
			$("#dura").text(param/4+"小时");
		}else{
			if(param==2){
				text="30分钟";
			}else if(param==1){
				text="15分钟";
			}
			$("#dura").text(text);
		}
		//生成今天往后的14天时间，提供给手机用户
		for(var i=0;i<14;i++){
			$("#select_data").append('<option value="'+getDateStr(i)+'">'+getDateStr(i)+'</option>');
		}
		//生成选择时间（小时）
		for(var i=0;i<24;i++){
			var length = (i+"").length;
			if(length==1){
				i="0"+i;
			}
			$("#select_hour").append('<option value="'+i+'">'+i+'</option>');
		}
		
		
		//小屏幕上的选择时间,得到世界附加到selectedDate div中
		$("#xs-selecttime").click(function(){
			var date = $("#select_data").val();
			var hour = $("#select_hour").val();
			var min = $("#select_min").val();
			
			var endtime = addHourMin(hour,min,param);
			
			html = '<p class="col-xs-9 col-xs-offset-1">'+date+'<i class="hidden">#</i>'+hour+':'+min+'-'+endtime
   					+'<button type="button" class="close" aria-hidden="true">&times;</button>'
   					+'</p>';
			$("#selectedDate").append(html);
			//绑定selectedDate div 中的关闭button (每次绑定最后一个) ,用来删除指定时间,
			$("button.close").last().click(function(){
				$(this).parent().remove();
			});
		});
		
		//小屏幕上的提交时间
		
		$("#xs-submit").click(function(){
			//先插入 meeting信息
			var urlp = url.substring(url.indexOf("?"));
			console.log(urlp);
			$.get("addMeeting.do"+urlp,function(data){
				if(data!=null){
					var timeArr = [];
					$("#selectedDate p").each(function(){
						//截取掉最后面的x
						var text = $(this).text();
						text = text.substring(0,text.length-1);
						timeArr.push(text);
					});
					var p = {"times":JSON.stringify(timeArr),"meetId":data.meetid};
					$.get("addTime.do",p,function(d){
						if(d){
							window.location.href="createTime.jsp?meetId="+data.meetid;
						}else{
							alert("增加时间失败");
						}
						
					});
				}
				
			});
			
			
			
			
		});
		
		
	})
</script>
</body>
</html>