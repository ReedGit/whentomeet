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

<!-- <link rel="stylesheet" href="css/bootstrap2.css"> -->
<style type="text/css">

#optionArea{
	width: 862px;
	height: 400px;
	border: 1px solid #ccc;
	box-shadow: 0px 0px 30px #333333;
	margin: 92px auto 200px;
	border-radius: 10px;
	background-color: #fff;
}

h2.title{
	position:relative;
	top:60px;
	left:65px;
	
}
.left{
	float: left;
	margin: 150px 83px 50px 57px;
}
</style>
<script type="text/javascript">
$(function(){
	$("#emailButton").click(function(){
		window.location.href="sendInvitations.jsp?meetId=${param.meetId}";	
	});
})

</script>
</head>
<body>
<%@ include file="public/head.html"%>
<div id="wrapper">
	<div id="main">
			<div id="optionArea">
				<h2 class="title">准备以何种方式分享给你的好友？</h2>
				<div class="leftSide1 left">
		            <div class="bigButton btn" id="copyPasteButton">
		                <h3>微信</h3>
		                	快来分享到我的朋友圈吧~~
		            </div>
		        </div>
				<div class="divider left">
		            <div class="midLabel">
		                OR
		            </div>
		        </div>
		        
		        <div class="rightSide left">
		            <div class="bigButton btn" id="emailButton">
		                <h3>邮箱</h3>
		               		 通过邮箱来邀请好友加入吧~~
		            </div>
		        </div>
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