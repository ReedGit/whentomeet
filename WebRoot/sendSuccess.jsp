<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="public/headfile.html"%>
<style type="text/css">
	#sendInfo{
		width: 742px;
		height: 400px;
		border: solid 2px #ccc;
		margin: 91px auto auto auto;
		background-color: #fff;
		border-radius:10px;
		color: #333;
		box-shadow: 0px 0px 30px #333;
	}
	#title{
		font-size: 35px;
		font-weight: bolder;
		width:100%;
		margin-top: 60px;	
		text-align: center;
	}
	#info{
		width: 442px;
		height: 78px;
		margin: 30px auto auto auto;
		border: solid 1px #eeeeaa;
		text-align: center;
		padding-top: 18px;
		background-color:#FFFFCC; 
	}
	
	#note{
		width: 422px;
		margin: 30px auto auto auto;
		text-align: center;
	}
	a{
		color: #4CAEE3;
	}
</style>

<script type="text/javascript">
	$(function(){
		var u = getCookie("user1");
		if(u!="" && u!=null && u!=undefined){
			$(".loadOff").hide();
		}else{
			$(".loadOn").hide();
		}
	})

</script>
</head>
<body>
<%@ include file="public/head.html"%>
<div id="wrapper">
<div id="sendInfo">
	<div id="title">
		您已成功发送邀请
	</div>	
	<div id="info">
		<span class="loadOff">本次见面的链接已发送至您的邮箱${param.selfEmail }，您可以通过点击链接查看其他受邀者选择的时间。</span>
		<br>
		<span class="loadOn">您也可以在我的meeting中查看所有过往会面时间。</span>
	</div>	
	<div id="note">
		<a href="createTime.jsp">点此</a>重新选择分享方式
		<br>
		注册用户可以查看所有过往会面时间哦，且不需要点击邮箱中的链接。点击免费<a href="#">注册</a>^_^。
		<br>
		<br>
		感谢您的使用，祝你生活愉快！
	</div>	
</div>
</div>
<!--/start-copyright-section-->
<div class="clearfix"></div>
		<div class="copyright">
			
		</div>
<!--//end-copyright-section-->
</body>
</html>