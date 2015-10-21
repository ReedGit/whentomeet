<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="public/headfile.html"%>
<style type="text/css">
	body {
	background-color: #669999;
}

#login{
	width: 522px;
	height: 446px;
	border: 1px solid #ccc;
	box-shadow: 0 0 30px #333;
	border-radius: 5px;
	position: relative;
	left: 700px;
	top: 36px;
	
	background: -webkit-gradient(linear, left bottom, left top, color-stop(0, #e8e8e8), color-stop(1, #fff));
    background: -ms-linear-gradient(bottom, #e8e8e8 0, #fff 100%);
    background: -moz-linear-gradient(center bottom, #e8e8e8 0, #fff 100%);
    background: -o-linear-gradient(#fff, #e8e8e8);
}
.title{
	font-size: 30px;
	font-weight: bolder;
	color: black;
	text-align: center;
	padding: 30px 0 ;
	
}
.input-group{
	width: 65%;
	margin: 0 auto;
}
.btn-success{
	width: 130px;
	height: 40px;
	position: relative;
	top: 10px;
	left: 297px;
}
.note{
	width: 240px;
	font-size:10px;
	position: relative;
	left:30px;
	top:30px;
}
</style>

<script type="text/javascript">
		$(function(){
			$("input[type=submit]").click(function(){
				$.ajax({
					url:"getUser.do",
					type:"post",
					data:$("#loginForm").serializeArray(),
					dataType:"text",
					success:function(data){
						console.log(data);
						if(data!=""&&data.validate==1){
							window.location.href="scheduleMeeting.jsp";
						}else{
							alert("用户名或者密码不正确");
						}
					}
				});
				return false;
			});
		})
	</script>
</head>
<body>
<%@ include file="public/head.html"%>
	<form id="loginForm">
		<div id="login">
			<div class="title">
				用户登录
			</div>
			<div class="input-group">
	  				<span class="input-group-addon">用户名</span>
	 			 	<input type="text" class="form-control" placeholder="您注册的邮箱" name="username">
	      	</div>
	      	
	      	<br>
	      	<br>
	        
			<div class="input-group">
	   				<span class="input-group-addon">密&nbsp;码</span>
	  			 	<input type="password" class="form-control" placeholder="密码" name="password">
	      	</div>
	      	<br>
			<input type="submit" class="btn btn-success" value="登&nbsp;&nbsp;陆">
			
			<div class="note">
				<a href="#">忘记密码？点击这儿重置</a><br>
					<br>
				
				其他方式登录
					<br>
				<button type="button" class="btn btn-info">
					<img alt="wechat" src="img/tencent_weixin.ico">&nbsp;|&nbsp;微信登陆
				</button>
			</div>
		</div>
	</form>
</body>
</html>