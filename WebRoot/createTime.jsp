<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">

<style type="text/css">
h2.title{
	/* float:right; */	
	position:relative;
	left:314px;
	word-spacing:250px;
}
div.rightSide{
	float:right;
	position:relative;
	right:314px;
}
div.leftSide{
	float:left;
	position:relative;
	left:314px;
}
.bigButton {
    padding: 20px;
    width: 250px;
    height: 70px;
    margin: 40px 0px 0px 0px;
    font-size: 14px;
    text-align: left;
    -webkit-border-radius: 8px;
    -moz-border-radius: 8px;
    border-radius: 8px;
}
div.divider {
    position: absolute;
    left: 50%;
    height: 200px;
    width: 1px;
    border-right: 1px solid #ccc;
    float: left;
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
</style>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#emailButton").click(function(){
		window.location.href="sendInvitations.jsp?meetId=${param.meetId}";	
	});
})



</script>
</head>
<body>

	<div>
		<h2 class="title">准备以何种方式分享给你的好友？</h2>
		<div class="leftSide">
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
		<div style="text-align: center; margin-top:100px;">
            <button data-toggle="modal" data-target="#myModal" class="btn btn-primary">Help Me Decide</button>
        </div>
	</div>

</body>
</html>