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
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
		background-color: #669999;
	}
	.scheduleBox{
		width: 522px;
		height: 277px;
		border: 1px solid #ccc;
		box-shadow: 0 0 30px #333;
		margin: 0 auto;
		position: relative;
		top:100px;
		background-color: #F4F4F4;
		border-radius: 5px;
	}

</style>

</head>
<body>
<%@ include file="public/head.html"%>
	<div class="scheduleBox" style="padding:35px 30px 20px 30px!important;">
         <div class="titleBar">
             <h1>一封邮箱确认邮件已经发送到 ${provEmail }
             	                
             </h1>
         </div>
         
         <div>
             	请检查您的收件箱，并按照说明完成注册^_^。
             <br><br>
          		  如果您未收到邮件，请检查您的垃圾箱- -！
         </div>
    </div>
    
<!--/start-copyright-section-->
<div class="clearfix"></div>
		<div class="copyright">
			
		</div>
<!--//end-copyright-section-->
</body>
</html>