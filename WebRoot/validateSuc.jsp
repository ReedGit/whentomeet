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
		line-height: 1.5;
		color: #333;
    	font-family: "Microsoft Yahei","微软雅黑",Helvetica,SimSun,SimHei;
	}
	#validateBox{
		width:1000px;
		height: 600px;
		background-color: #fff;
		margin: 30px auto auto auto;
		border: 1px solid transparent;
	}
	.img{
		width:748px;
		height:235px;
		margin: 30px auto 0 auto;
		text-align: center;
	}
	p{
		margin: .75em 0;
	}
	
	p.verify-result-status{
		font-size: 20px;
	}
	.resend a{
		color: #448aff;
    	text-decoration: none;
	}
	.go-webclient{
		width: 144px;
		/* height: 35px; */
		border-color: #2a64ca;
    	background-color: #448aff;
    	margin: 0 auto;
	}
	.go-webclient a{
		color:#fff;
		line-height: 35px;
		font-size: 16px;
	}
	.app{
		width: 746px;
		height: 242px;
		position: relative;
	}
	
	.app_title::before{
		content: '';
		position: absolute;
	    width: 150px;
	    left: 0;
	    top: 10px;
	    border-bottom: 1px solid #d8d8d8;
	}
	.app_title::after{
		content: '';
		position: absolute;
	    width: 150px;
	    right: 0;
	    top: 10px;
	    border-bottom: 1px solid #d8d8d8;
	}
	.qrcode{
		width: 151px;
		height: 153px;
		border: 1px solid #D3D2D2;
		margin: 20px auto 0 auto;
		padding-top: 11px;
	}
	.qrcode .codepic{
		width: 129px;
		height: 128px;
		margin: 0 auto;
	}
	.download-content{
	/* 	width: 100px; */
		height: 100px;
		text-align: center;
	}
	.download-content p{
		font-size: 20px;
	}
	.resend{
		position: absolute;
		top:-9999em;
	}
</style>
</head>
<body>
<%@ include file="public/head.html"%>
<div id="wrapper">
<div id="validateBox">
	<div class="img">
		<img alt="success" src="img/success.png" id="stapic">
		<p class="verify-result-status">帐户验证成功！</p>
		<p class="resend"><a href="#">点此登录</a>，查看帐户状态，如未验证可重发验证邮件</p>
		<br>
		
		<div class="go-webclient">
			<a href="index.html">
				继续访问网页版
			</a>
		</div>
		
		<br>
		<br>
		<br>	
		<div class="app">
			<div class="app_title">下载移动客户端，离线同步数据，随时随地进行沟通协作</div>
			
			<div class="code">
				<div  class="qrcode">
					<img alt="code" src="img/qrcode.png" class="codepic">
				</div>
				
				<div class="download-content">
					<p>移动端</p>
					<span>
						扫描二维码下载
					</span>
				</div>
			</div>
		</div>
		
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
		/* @javabean: 1:第一次验证    0：重复验证 */
		var sta = "${param.sta}";
		console.log(sta==1);
		if(sta==0){
			$("#stapic").attr("src","img/fail.png");
			$(".verify-result-status").text("帐户已验证或链接失效...");
			$(".resend").css("position","static");
		}
		
	})
</script>
</body>

</html>