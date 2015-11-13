<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="public/headfile.html"%>
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
			<h2>输入验证邮箱</h2>
			<br>
			<div>请输入你的注册邮箱，我们将给你发送一个重置密码的链接</div>
			<br><br>
			<input type="text" id="resetemail" class="form-control"  placeholder="请输入名称">
			<br>
			<img alt="loading" class ="loading hidden" src="img/loading.gif">
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
		var resetemail = $("#resetemail").val();
		var emailRex = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ ;
		var flag = emailRex.test(resetemail);
		console.log(flag);
		if(flag){
			$("#submit").addClass("hidden");
			$(".loading").removeClass("hidden");
			$.get("sendResetPasswordLink.do",{"email":resetemail},function(){
				$("#submit").removeClass("hidden");
				$(".loading").addClass("hidden");
				$(".mesg").removeClass("hidden").text("链接已经发送");
			});
		}else{
			$(".mesg").removeClass("hidden").text("邮箱格式不正确");
		}
		
		
	});
	
})

</script>
</html>