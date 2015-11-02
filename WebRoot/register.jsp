<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="public/headfile.html"%>
<style type="text/css">
#register{
	width: 522px;
	/* height: 446px; */
	border: 1px solid #ccc;
	box-shadow: 0 0 30px #333;
	border-radius: 5px;
	float:right;
	margin:60px 60px 150px 0;
	padding-bottom:50px;
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

img[alt=error]{
	position: relative;
	left: 448px;
	bottom: 30px;
	display: none;
}
.error{
    color: #FF0000;
    clear: both;
    position: relative;
    left: 59px;
    display: none;
}
</style>
 <script type="text/javascript">
 var go  = false;
 var go1 = false;
 var go2 = false;

 var exist = function(text){
	 $.get('findUser.do',{"username":text}, function(data) {
			if(data==true){
					$("label[for=username]").show().text("该邮箱已存在！");
					$("img[for=username]").show().attr("src","img/error.png");
					go = false;
			  	}else{
					$("label[for=username]").hide();
					$("img[for=username]").show().attr("src","img/checkmark32.png");
					go = true;
			  	}
		});
 }
 
 
   $(function(){
	   $("input[type=submit]").click(function(){
		   if(go && go1 && go2 && $.trim($("input[name=nickname]").val())!=""){
			   $.post("addUser.do",$("#addUser").serializeArray(),function(data){
				   if(data!=null && data!=""){
					   window.location.href="validateEmail.jsp?provEmail="+data;
				   }
			   });
			   return false;
		   }else{
				$("img[for=nickname]").attr("src","img/error.png");
				$("label[for=nickname],img[for=nickname]").show();
			   return false;
		   }
	   });
	   
	   
	   $("input[type=text],input[type=password]").change(function(){
	   		var text = $(this).val();
	   		var name = $(this).attr("name");
	   		var emailRex = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/ ;
	   		if(name=="nickname"){
	   			if($.trim($("input[name=nickname]").val())==""){
	   				$("img[for=nickname]").attr("src","img/error.png");
					$("label[for=nickname],img[for=nickname]").show();
	   			}else{
	   				$("img[for=nickname]").attr("src","img/checkmark32.png").show();
					$("label[for=nickname]").hide();
	   			}
	   				
	   		}else 
	   			
	   		if(name=="username"){
	   			if(!emailRex.test(text)){
	   				//非法邮箱
	   				$("label[for=username],img[for=username]").show();
	   				go = false;
	   			}else{
	   				exist(text);
	   			}
	   		}else if(name=="password"){
	   			if(text.length<8||text.length>20){
	   				$("label[for=password],img[for=password]").show();
	   				go1 = false;
	   			}else{
	   				$("label[for=password]").hide();
					$("img[for=password]").show().attr("src","img/checkmark32.png");
					var p2 = $("input[name=password1]").val();
					go1 = true;
					if(p2!=""){
						if(p2==text){
							$("label[for=password1]").hide();
							$("img[for=password1]").show().attr("src","img/checkmark32.png");
							go2 = true;
						}else{
							$("label[for=password1]").show();
							$("img[for=password1]").show().attr("src","img/error.png");
							go2 = false;
						}
						
					}
	   			}
	   			
	   			
   			}else if(name=="password1"){
   				var p1 = $("input[name=password]").val();
   				if(text!=p1){
   					$("label[for=password1],img[for=password1]").show();
   					go2 = false;
   				}else{
   					$("img[for=password1]").show().attr("src","img/checkmark32.png");
   					go2 = true;
   				}
   			}
	   		

	   		
	   		 $(this).off('input propertychange').on('input propertychange', function() {
	   			var name = $(this).attr("name");
	   			var text = $(this).val();
	   			if(name=="username"){
	   				if(emailRex.test($(this).val())){
	   					exist(text);
		   			}else{
		   				if(text==""){
		   					$("label[for=username]").text("此处为必填项！");
		   				}else{
		   					$("label[for=username]").text("请输入正确的邮箱格式！");
		   					
		   				}
		   				$("img[for=username]").attr("src","img/error.png");
		   				$("label[for=username],img[for=username]").show();
		   				go = false;
		   			}
	   			}else if(name=="password"){
	   				if(text.length>=8&&text.length<=20){
		   					$("label[for=password]").hide();
							$("img[for=password]").show().attr("src","img/checkmark32.png");
							var p2 = $("input[name=password1]").val();
							go1 = true;
							if(p2!=""){
								if(p2==text){
									$("label[for=password1]").hide();
									$("img[for=password1]").show().attr("src","img/checkmark32.png");
									go2 = true;
								}else{
									$("label[for=password1]").show();
									$("img[for=password1]").show().attr("src","img/error.png");
									go2 = false;
								}
								
							}
		   			}else{
		   				if(text==""){
		   					$("label[for=password]").text("此处为必填项！");
		   				}else{
		   					$("label[for=password]").text("密码为8-20位的任意字符");
		   					
		   				}
		   				$("img[for=password]").attr("src","img/error.png");
		   				$("label[for=password],img[for=password]").show();
		   				go1 = false;
		   			}
	   				
	   			}else if(name=="password1"){
	   				var p1 = $("input[name=password]").val();
	   				if(text==p1&&text!=""){
	   					$("label[for=password1]").hide();
						$("img[for=password1]").show().attr("src","img/checkmark32.png");
						go2 = true;
	   				}else{
	   					if(text==""){
		   					$("label[for=password1]").text("此处为必填项！");
		   				}else{
		   					$("label[for=password1]").text("密码为8-20位的任意字符");
		   					
		   				}
	   					$("img[for=password1]").attr("src","img/error.png");
	   					$("label[for=password1],img[for=password1]").show();
	   					go2 = false;
	   				}
	   			}
	   			
	   		}); 
	   		
	   });
	   
})
   
   </script>
</head>
<body>
<%@ include file="public/head.html"%>
<div id="wrapper">
	<form action="addUser.do" method="post" id="addUser">
		<div id="register">
					<div class="title">
						免费注册
					</div>
					<div class="input-group">
			  				<span class="input-group-addon">昵  &nbsp; &nbsp; &nbsp; 称</span>
			 			 	<input type="text" class="form-control" placeholder="请输入您的昵称" name="nickname">
			      	</div>
			      	<img alt="error" src="img/error.png" for="nickname">
			      	<label class="error" for="nickname">昵称必填！</label>
			      	<br>
			      	<br>
					<div class="input-group">
			  				<span class="input-group-addon">&nbsp;用户名 &nbsp;</span>
			 			 	<input type="text" class="form-control" placeholder="请输入您的邮箱" name="username">
			      	</div>
			      	<img alt="error" src="img/error.png" for="username">
			      	<label class="error" for="username">请输入正确的邮箱格式！</label>
			      	<br>
			      	<br>
			        
					<div class="input-group">
			   				<span class="input-group-addon">用户密码</span>
			  			 	<input type="password" class="form-control" placeholder="密码" name="password">
			      	</div>
			      	<img alt="error" src="img/error.png" for="password">
			      	<label class="error" for="password">密码为8-20位的任意字符</label>
			      	<br>
			      	<br>
					<div class="input-group">
			   				<span class="input-group-addon">确认密码</span>
			  			 	<input type="password" class="form-control" placeholder="确认密码" name="password1">
			      	</div>
			      	<img alt="error" src="img/error.png" for="password1">
			      	<label class="error" for="password1">两次输入的密码不一致！</label>
			      	<br>
					<input type="submit" id="submit" class="btn btn-success" value="注&nbsp;&nbsp;册">
					
					<div class="note">
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