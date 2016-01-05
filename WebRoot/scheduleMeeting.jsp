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
<style type="text/css">
 .scheduleBox {
    /* width: 522px; */
    height:492px;
    background: white;
    padding: 35px 4% 0 4%;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-shadow: 0 0 30px #333;
    background: #fff;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#e8e8e8', GradientType=0);
    float:right;
   /*  position: relative;
    top: 57px;
    right: 100px; */
    margin: 100px 0 150px 0;
}

 .scheduleBox h1 {
    font-size: 30px;
    text-align: center;
    margin-bottom: 40px;
}
#step1Submit{
	/* position: relative;
	left: 330px;
	width: 120px;
	height: 40px; */
}
.tipMess{
	width: 95%;
	line-height: 30px;
	background-color: #FF6666;
	margin: 0 auto;
	text-align: center;
}

#outtimeTableDiv{
	width: 1270px;
	/* position: relative; */
	margin: 0 auto;
}



#timeTableDiv{
	position: absolute;
	top:15%;
	z-index: 10;
}

</style>
</head>
<body>
<%@ include file="public/head.html" %>
<!-- end of head -->
<div class="container">
<div id="wrapper" class="row">
	<div class="scheduleBox col-xs-12 col-lg-5">
        <div class="titleBar">
            <h1>安排一次聚会吧</h1>
            <!--[if lt IE 9 ]> 
           <div id="browser_warning" style="font-size:16px;margin:-30px 0 20px 0;color:#FF0000;font-weight: bold;text-align: center;">This version of Internet Explorer is not fully supported.<br>Please try using NeedToMeet with a<br>newer version or another browser.</div>
           <![endif]-->

        </div>
        <div class="tipMess"></div>
        <form class="form-horizontal"  id="addMeeting">
                  <div class="input-group">
         				<span class="input-group-addon">主题</span>
        			 	<input type="text" class="form-control" placeholder="马尔代夫7日游" name="title">
      			  </div>
      			  <br>
                  <div class="input-group">
         				<span class="input-group-addon">地点</span>
        			 	<input type="text" class="form-control" placeholder="马尔代夫" name="location">
      			  </div>
      			  <br>
					
				<div class="input-group">
         			<span class="input-group-addon">时长</span>
         			<select class="form-control" id="duration" name="duration">
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
					
				<div class="input-group">
         			<span class="input-group-addon">细节</span>
		  			<textarea  class="form-control" placeholder="描述一下此次聚会的细节吧" name="content"></textarea>
      			</div>
      			<br>
				  <div class="input-group">
         				<span class="input-group-addon">邮箱</span>
        			 	<input type="text" class="form-control" placeholder="此邮箱会收到其他受邀者的时间更新哦~" name="organiser_mail">
      			  </div>
      			  <br>	
				<input id="step1Submit" type="submit" class="btn btn-success" value="确认选择">

        </form>
    </div>
    
</div>
<div id="outtimeTableDiv" class="row">
	<div id="timeTableDiv" class="col-lg-12">
	</div>  
</div>
<!--/start-copyright-section-->
<div class="clearfix"></div>
		<div class="copyright">
			
		</div>
<!--//end-copyright-section-->
</div>
<script type="text/javascript">
	var u = getCookie("user1");
	var uid = getCookie("organiser");
	$(function(){
		if(u!=""&&u!=null){
			$.get('getUserById.do', {"userid":uid},function(data) {
				var d = data.defaultDura;
				$("#duration").val(d);
				if(d=="0"){
					$("#duration").val("4");
				}
				
				$("input[name=organiser_mail]").val(data.username);
			});
		}
		
		
		
		$("#step1Submit").click(function(){
			var title = $("input[name=title]").val();
			if($.trim(title)==""){
				$(".tipMess").text("主题不能为空");
				return false;
			}else{
				
				$.getScript("js/timeTable.js");
				$.getScript("js/zxx.color_exchange.js");
					
				$("#timeTableDiv").load("timeTable.jsp",function(){
					$.getScript("js/timeTable.js");
					$.getScript("js/zxx.color_exchange.js");
				});
				
				
				setCookie("organiser_mail", $("input[name=organiser_mail]").val());
				return false;
			}
			
		});
		
	})
	
</script>

</body>
</html>