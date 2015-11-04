<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="public/headfile.html"%>
<style type="text/css">

#login{
	width: 522px;
	height: 446px;
	border: 1px solid #ccc;
	box-shadow: 0 0 30px #333;
	border-radius: 5px;
/* 	position: relative;
	left: 700px;
	top: 36px; */
	float:right;
	margin:60px 13% 150px 0;
	
	/* background: -webkit-gradient(linear, left bottom, left top, color-stop(0, #e8e8e8), color-stop(1, #fff));
    background: -ms-linear-gradient(bottom, #e8e8e8 0, #fff 100%);
    background: -moz-linear-gradient(center bottom, #e8e8e8 0, #fff 100%);
    background: -o-linear-gradient(#fff, #e8e8e8); */
    background:#fff;
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
label.error{
	color: red;
	position:relative;
	left: 90px;
	bottom: 10px;
}
</style>

<script type="text/javascript">
		$(function(){
			$("input[type=submit]").click(function(){
				$.ajax({
					url:"getUser.do",
					type:"post",
					data:$("#loginForm").serializeArray(),
					dataType:"json",
					success:function(data){
						if(data!=null&&data.validate==1){
							setCookie("user1",data.nickname);
							setCookie("organiser",data.userid);
							setCookie("usermail",data.username);
							window.location.href="scheduleMeeting.jsp";
						}else if(data!=null&&data.validate==0){
							$("label.error").text("该邮箱尚未验证！");
						}
					},
					error:function(){
						$("label.error").text("用户名或密码不正确！");
					}
				});
				return false;
			});
		})
	</script>
</head>
<body>
<%@ include file="public/head.html"%>
<div id="wrapper">
	<form id="loginForm">
		<div id="login">
			<div class="title">
				用户登录
			</div>
			<label class="error" for="login" ></label>
			<div class="input-group">
	  				<span class="input-group-addon">用户名</span>
	 			 	<input type="text" class="form-control" placeholder="您注册的邮箱" name="username">
	      	</div>
	      	
	      	<br>
	      	<br>
	        
			<div class="input-group">
	   				<span class="input-group-addon">  密&nbsp;&nbsp;&nbsp;&nbsp;码  </span>
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
	</div>
<!--/start-copyright-section-->
<div class="clearfix"></div>
		<div class="copyright">
			
		</div>
<!--//end-copyright-section-->
</body>
</html>