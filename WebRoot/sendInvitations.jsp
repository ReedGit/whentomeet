<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="public/headfile.html"%>
<style type="text/css">
body{
	background-color: #669999;
}

#title{
	width: 100%;
	height: 70px;
	border: solid 0px #ccc;
	border-bottom: solid 1px #ccc;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	font-size: 30px;
	font-weight:bolder;
	padding-top: 10px;
	padding-left: 35px;
	background-color: #F8F8F8 ;
	
}
#emails {
	width: 638px;
	/* height: 499px; */
	border: 1px solid #ccc;
	margin: 92px auto auto auto;
	border-radius: 10px;
	background-color: #fff;
	box-shadow: 0px 0px 30px #333333;
	padding-bottom: 100px;
	margin-bottom: 200px;
}

.inputName{
	width: 172px;
}
.inputEmail{
	width: 232px;
	position: relative;
	left: 180px;
	bottom: 34px;
	margin-bottom: -26px;
}

#inviteAttendees{
	position: relative;
	top:40px;
	padding-left: 80px;
}
.fill{
	height: 10px;
}
.btn-success{
	position: relative;
	top:37px;
	left: 202px;
	width: 112px;
	
}
.privacyNote{
	position: relative;
	top:46px;
	left: 102px;
}
</style>

<script type="text/javascript">
	$(function(){
		for(var i=0;i<3;i++){
			$(".attendeeEmails").append('<input type="text" class="form-control inputName"  placeholder="名字" name="attendeeName">'
										+'<input type="text" class="form-control inputEmail"  placeholder="邮箱" name="attendeeEmail" >');
		}
		$(".moreEmails").click(function(){
			for(var i=0;i<3;i++){
				$(".attendeeEmails").append('<input type="text" class="form-control inputName"  placeholder="名字" name="attendeeName">'
						+'<input type="text" class="form-control inputEmail"  placeholder="邮箱" name="attendeeEmail" >');
			     }
			
		});
	})


</script>
</head>
<body>
<%@ include file="public/head.html"%>
	<div id="emails">
		<div class="rightSide">
			<div id="title">通过邮箱发送邀请</div>
			<form action="sendtoMail.do" method="post">
			<input type="hidden" name="meetId" value="${param.meetId}">
			<div id="inviteAttendees">
				<div class="inviteNoModal">
					<div class="inviteForm">
						<label for="name">我的信息</label>
						<div class="fill"></div>
      					<input type="text" class="form-control inputName"  placeholder="我的名字"  name="myName">
      					<input type="text" class="form-control inputEmail"  placeholder="我的邮箱" name="selfEmail">
						
						<br>
						
						<div class="instruction">
								受邀人的信息 &nbsp;注册用户可以同步和保存联系人
						</div>
						<div class="fill"></div>
						<div class="attendeeEmails">
								<!-- 邀请人邮箱 -->						
						</div>
						<button type="button" class="btn btn-info  btn-xs moreEmails">+添加更多邮箱</button>      
						<input type="submit" class="btn btn-success" value="发送邀请" >
						<div class="privacyNote">
							我们承诺绝不公开您的邮箱，查看我们的<a href="/privacy" target="_blank">隐私政策</a>.
						</div>
					</div>
					
				</div>
			</div>
			</form>
	</div>
	</div>
	
</body>
</html>