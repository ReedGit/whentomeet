<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
.reset{
	width:1040px;
	margin: 100px auto 0 auto;
}

.left{
	width: 390px;
	color: #fff;
	display: inline-block;
	font-size: 50px;
	font-weight: bolder;
	vertical-align: top;
}
.right{
	width: 520px;
	height: 280px;
	background-color: #fff;
	padding: 30px;
	text-align:center;
	display: inline-block;
	border-radius: 5px;
	box-shadow: 0 0 30px #333;
	vertical-align: top;
}
.form-control{
	width: 275px;
	margin: 0 auto;
}
</style>
</head>
<body>
<%@ include file="public/head.html"%>
<div id="wrapper">
	<div class="reset">
		<div class="left">重置密码</div>
		<div class="right">
			<h2>重置您的密码</h2>
			<br>
			<input type="password" id ="password1" class="form-control"  placeholder="请输入密码"/>
			<br>
			<input type="password" id ="password2" class="form-control"  placeholder="请输入确认密码"/>
			<br>
			<img alt="loading" class ="loading hidden" src="img/loading.gif" />
			<button type="submit" id="submit" class="btn btn-default">提交</button>
			<p class ="hidden mesg">链接已经发送</p>
		</div>
	</div>

</div>

<!--/start-copyright-section-->
<div class="clearfix"></div>
		<div class="copyright">
			
		</div>
<!--//end-copyright-section-->
</body>
<script type="text/javascript">
	$(function(){
		$("#submit").click(function(){
			var p1 = $("#password1").val();
			var p2 = $("#password2").val();
			if(p1.length<8||p1.length>20){
				$(".mesg").removeClass("hidden").text("密码的长度为8-20位！");
				return;
			}
			
			if(p1==p2){
				$("#submit").addClass("hidden");
				$(".loading").removeClass("hidden");
				$.get("resetPassword.do",{"username":"${param.username}","password":p1},function(){
					$("#submit").removeClass("hidden");
					$(".loading").addClass("hidden");
					$(".mesg").removeClass("hidden").text("密码修改成功！");
				});
			}else{
				$(".mesg").removeClass("hidden").text("两次密码不一致！");
			}
			
			
		});
		
		
	})

</script>

</html>