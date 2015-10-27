<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="public/headfile.html"%>
<script type="text/javascript" src="js/back2index.js"></script>
<style type="text/css">
	.changepass{
	    width: 630px;
	    height:396px;
	    background: white;
	    float:left;
	    margin:35px 0 0 70px;
	    border: 1px solid #ccc;
	    border-radius: 5px;
	    box-shadow: 0 0 30px #333;
	    background: #eee;
	    background: -webkit-gradient(linear, left bottom, left top, color-stop(0, #e8e8e8), color-stop(1, #fff));
	    background: -ms-linear-gradient(bottom, #e8e8e8 0, #fff 100%);
	    background: -moz-linear-gradient(center bottom, #e8e8e8 0, #fff 100%);
	    background: -o-linear-gradient(#fff, #e8e8e8);
	    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#e8e8e8', GradientType=0);
	}
	.title{
	font-size: 30px;
	font-weight: bolder;
	color: black;
	text-align: center;
	padding: 30px 0 ;
	
}

.input-group{
	width: 70%;
	margin: 0 auto;
}
.btn-success{
width: 120px;
height: 40px;
margin-left: 93px;
margin-top: 31px;
}
.tipMess{
	width: 95%;
	color: white;
	margin: 0  auto 10px auto;
	text-align: center;
	/* display: none; */
}
</style>
</head>
<body>
<%@ include file="public/head.html"%>
<div id="reg">
	<%@ include file="public/accountleft.html"%>
	<div class="changepass">
		<div class="title">
						修改密码
		</div>
		<div class="tipMess">
			
		</div>
		<div class="input-group">
 				<span class="input-group-addon">旧 密 码</span>
			 	<input type="password" class="form-control" placeholder="请输入您的旧密码" name="oldpassword">
		</div>
		<br>
		<br>
		<div class="input-group">
 				<span class="input-group-addon">新 密 码</span>
			 	<input type="password" class="form-control" placeholder="请输入您的新密码" name="password">
		</div>
		<br>
		<br>
		<div class="input-group">
 				<span class="input-group-addon">确认密码</span>
			 	<input type="password" class="form-control" placeholder="请输入您的确认密码" name="password1">
		</div>
		
		<button type="button" class="btn btn-success">修改</button>
	</div>
</div>

<div class="clearfix"></div>
<!--/start-copyright-section-->
		<div class="copyright">
			
		</div>
<!--//end-copyright-section-->
<script type="text/javascript">
	$(function(){
		$(".btn-success").click(function(){
			var op = $("input[name=oldpassword]").val();
			var p1 = $("input[name=password]").val();
			var p2 = $("input[name=password1]").val();
			if($.trim(op)==""){
				$(".tipMess").css("backgroundColor","#F26752").text("请输入旧密码");
				return false;
			}
			if($.trim(p1)==""){
				$(".tipMess").css("backgroundColor","#F26752").text("请输入新密码");
				return false;
			}
			if($.trim(p1).length<8||$.trim(p1).length>20){
				$(".tipMess").css("background","#F26752").text("新密码长度为8-20位");
				return false;
			}
			if($.trim(p2)==""){
				$(".tipMess").css("background","#F26752").text("请输入确认密码密码");
				return false;
			}
			if(p1!=p2){
				$(".tipMess").css("background","#F26752").text("两次密码不一致");
				return false;
			}
			
			$.post("updatePassword.do",{"oldpassword":op,"password":p1,userid:getCookie("organiser")},function(data){
				console.log(data);
				if(data){
					$(".tipMess").css({"background":"#DFF0D8","color":"red"}).text("修改成功");
				}else{
					$(".tipMess").css("background","#DFF0D8").text("密码错误");
				}
			});
		});
	})
</script>
</body>
</html>