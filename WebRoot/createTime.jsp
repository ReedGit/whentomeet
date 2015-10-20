<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="public/headfile.html"%>
<!-- <link rel="stylesheet" href="css/bootstrap2.css"> -->
<style type="text/css">
body{
	width: 100%;
	height: 100%;
	background-color: #669999;
}

#optionArea{
	width: 862px;
	height: 400px;
	border: 1px solid #ccc;
	box-shadow: 0px 0px 30px #333333;
	margin: 92px auto auto auto;
	border-radius: 10px;
	background-color: #fff;
}

h2.title{
	position:relative;
	top:60px;
	left:65px;
	
}
div.rightSide{
	float:right;
	position:relative;
	right:20px;
	width: 292px;
	height: 112px;
	top:168px;
}
div.leftSide1{
	float:left;
	position:relative;
	left:100px;
	width: 292px;
	height: 112px;
	top:168px;
}
/* .bigButton {
    padding: 20px;
    width: 250px;
    height: 70px;
    margin: 40px 0px 0px 0px;
    font-size: 14px;
    text-align: left;
    border-radius: 8px;
} */
div.divider {
    position: absolute;
    left: 50%;
    height: 200px;
    width: 1px;
    border-right: 1px solid #ccc;
    float: left;
    top:54%;
}
.divider .midLabel {
    margin-top: 80px;
    margin-left: -25px;
    background: white;
    padding: 10px 5px;
    width: 40px;
    text-align: center;
    font-size: 22px;
    color: #888;
    font-weight: bold;
    }
 .headborder{
 	
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
	<div class="headborder">
		<%@ include file="public/head.html"%>
	</div>
	<div id="main">
			<div id="optionArea">
				<h2 class="title">准备以何种方式分享给你的好友？</h2>
				<div class="leftSide1">
		            <div class="bigButton btn" id="copyPasteButton">
		                <h3>微信</h3>
		                	快来分享到我的朋友圈吧~~
		            </div>
		        </div>
				<div class="divider">
		            <div class="midLabel">
		                OR
		            </div>
		        </div>
		        
		        <div class="rightSide">
		            <div class="bigButton btn" id="emailButton">
		                <h3>邮箱</h3>
		               		 通过邮箱来邀请好友加入吧~~
		            </div>
		            <!-- <div class="sync_now">*NEW*  Contact Sync Now Available</div> -->
		        </div>
		        <div style="clear:both"></div>
				<!-- <div style="text-align: center; margin-top:100px;">
		            <button data-toggle="modal" data-target="#myModal" class="btn btn-primary">Help Me Decide</button>
		        </div> -->
			</div>
	</div>
</body>
</html>