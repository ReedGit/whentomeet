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

#account{
	/* margin-top:35px; */
	height: 550px;
	width: 522px;
	float: right;
	margin:60px 13% 150px 0;
	padding: 35px 30px 30px 30px;
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
.title1{
	color: #000;
	font-size: 2em;
	width: 100%;
	font-weight:bolder;
	text-align: center;
	padding-bottom: 20px;
	
}
.input-group{
	width: 80%;
	margin: 0 auto;
}
.submit1{
	width: 100%;
}
.submit1 input{
	width: 130px;
	height:41px;
	float: right;
	margin-right: 30px;
	margin-top: 30px;
}
.saveSucc{
	width: 95%;
	background-color: #DFF0D8;
	color: #719150;
	margin: 0  auto 10px auto;
	text-align: center;
	display: none;
}
</style>

</head>
<body>
<%@ include file="public/head.html"%>
	
<div id="wrapper">
	<%@ include file="public/accountleft.html"%>
	<div id="account">
		<div class="title1">账号设置</div>
		<div class="saveSucc">
			账号设置成功
		</div>
			
		<div>
			<form action="" id="accountFrom">
				<input type="hidden" value="" name="userid">
				<input type="hidden" value="" name="password">
				<input type="hidden" value="1" name="validate">
				<div class="input-group">
	  				<span class="input-group-addon">昵  &nbsp; 称</span>
	 			 	<input type="text" class="form-control" placeholder="请输入您的昵称" name="nickname">
			    </div>
			    <br>
			    <br>
				<div class="input-group">
	  				<span class="input-group-addon">邮  &nbsp; 箱</span>
	 			 	<input type="text" class="form-control" placeholder="请输入您的昵称" name="username">
			    </div>
			     <br>
			     <br>
				<div class="input-group">
	  				<span class="input-group-addon">默认时长</span>
	 			 	<select class="form-control" id="duration" name="defaultDura">
                          <option value="1">15 分钟</option>
                          <option value="2">0.5 小时</option>
                          <option value="4" selected="selected">1.0 小时</option>
                          <option value="6">1.5 小时</option>
                          <option value="8">2.0 小时</option>
                          <option value="10">2.5 小时</option>
                          <option value="12">3.0 小时</option>
                          <option value="16">4.0 小时</option>
                          <option value="20">5.0 小时</option>
                          <option value="24">6.0 小时</option>
                          <option value="96">全天</option>
                    </select>
			    </div>
			     <br>
			     <br>
				<div class="input-group">
	  				<span class="input-group-addon">头  &nbsp; 像</span>
	 			 	<input type="text" class="form-control" placeholder="请输入您的昵称" name="image">
			    </div>
			     <br>
			     <br>
				<div class="input-group">
	  				<span class="input-group-addon">更新头像</span>
	 			 	<input type="text" class="form-control" placeholder="请输入您的昵称" name="updateImg">
			    </div>
			    
			    <div class="submit1">
			    	<input type="submit" class="btn btn-success" value="保存">
			    </div>
			</form>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<!--/start-copyright-section-->
		<div class="copyright">
			
		</div>
<!--//end-copyright-section-->
<script type="text/javascript">
	$(function(){
		$.get('getUserById.do', {"userid":uid},function(data) {
			  $("input[name=userid]").val(data.userid);
			  $("input[name=nickname]").val(data.nickname);
			  $("input[name=username]").val(data.username);
			  $("input[name=password]").val(data.password);
			  /* $("input[name=duration]").val(data.nickname); */
			/*   $("input[name=nickname]").val(data.nickname); */
		});
		
		$(".submit1 input[type=submit]").click(function(){
			$.post('updateUser.do', $("#accountFrom").serializeArray(),function(data) {
				console.log($("#accountFrom").serializeArray());
				if(data==true){
					setCookie("user1", $("input[name=nickname]").val());
					$(".saveSucc").show();
				}
			});
			return false;
		});
	})
	
</script>
</body>
</html>