<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="public/headfile.html"%>

<style type="text/css">

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
	float:right;
	width: 638px;
	/* height: 550px; */
	border: 1px solid #ccc;
	margin: 92px 392px auto auto;
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
	margin-bottom: -43px;
}

#inviteAttendees{
	position: relative;
	top:40px;
	padding-left: 80px;
}

.contact{
	position: relative;
	bottom:18px;
	left: 422px;
	width:30px;
	height:30px;
	background-image: url("img/contacts.ico");
	background-repeat: no-repeat;
	background-size:20px 20px;
	visibility: hidden;
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

#contactBox{
	width: 638px;
	height: 426px;
	border: 2px solid #ccc;
	position: fixed;
	top:176px;
	left:356px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0px 0px 40px #333333;
	display: none;
}
#contactBox .title{
	font-size: 20px;
	color: #000;
	font-weight: bolder;
	line-height: 70px;
	
}
#contactBox .list{
	width:600px;
	height:200px;
	border: 1px solid #ccc;
	overflow: auto;
}

#contactBox .list table{
	width: 100%;
	height: 100%;
	border: 0 solid transparent;
	text-align: center;
}

#contactBox #confim{
	width:82px;
	height:35px;
	margin: 30px 0 0 249px;
}
#contactBox #close{
	border-radius: 10px;
	position: absolute;
	top: 0;
	right: 0;
}
.tipMess{

	width: 95%;
	line-height: 30px;
	background-color: #FF6666;
	margin: 0 auto;
	text-align: center;
}

</style>
</head>
<body>

<%@ include file="public/head.html"%>
<div id="wrapper">
	<div id="emails">
		<div class="rightSide">
			<div id="title">通过邮箱发送邀请</div>
			<div class="tipMess"></div>
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
						<input type="submit" class="btn btn-success" id="sendInv" value="发送邀请" >
						<div class="privacyNote">
							我们承诺绝不公开您的邮箱，查看我们的<a href="/privacy" target="_blank">隐私政策</a>.
						</div>
					</div>
					
				</div>
			</div>
			</form>
	</div>
</div>
</div>
<!--/start-copyright-section-->
<div class="clearfix"></div>
		<div class="copyright">
			
		</div>
<!--//end-copyright-section-->
<div id="contactBox">
		<div class="title">我的联系人
			<button type="button" class="btn btn-danger" id="close">X</button>
		</div>
		<div class="list">
			<table border="1">
				<thead>
					<tr>
						<td>姓名</td><td>邮箱</td><td>选择</td>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
				
			</table>
		</div>
		
		<button type="button" class="btn btn-warning" id="confim">确认选择</button>
</div>

<script type="text/javascript">
	var uid = getCookie("organiser");
	var index = 0;
	var emailRex = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
	var selectContact = function(){
		$("body").css("backgroundColor","#fff");
		$("#background").css("opacity",".6");
		$("#contactBox").show();
		$(window).scrollTop(0);
		index = $(this).index();
	}
	
	var closeContactBox =function(){
		$("#contactBox").hide();
		$("body").css("backgroundColor","#669999");
		$("#background").css("opacity","1");
	}

	$(function(){
		for(var i=0;i<3;i++){
			$(".attendeeEmails").append('<input type="text" class="form-control inputName"  placeholder="名字" name="attendeeName">'
										+'<input type="text" class="form-control inputEmail"  placeholder="邮箱" name="attendeeEmail" >'
										+'<div class="contact"></div>');
		}
		$(".moreEmails").click(function(){
			for(var i=0;i<3;i++){
				$(".attendeeEmails").append('<input type="text" class="form-control inputName"  placeholder="名字" name="attendeeName">'
						+'<input type="text" class="form-control inputEmail"  placeholder="邮箱" name="attendeeEmail" >'
						+'<div class="contact"></div>');
					if(uid!=""&&uid!=null){
						$(".contact").last().on("click",selectContact).css("visibility","visible");
					}
			     }
		});
		if(uid!=""&&uid!=null){
			//用户登陆后，查询他的邮箱
			$.get("getUserById.do",{"userid":uid},function(data){
				console.log(data.username);
				$("input[name=selfEmail]").val(data.username);
			});
			
			
			$(".contact").click(selectContact).css("visibility","visible");
			$("#close").click(closeContactBox);
			//loadContact
			$.get("findAllContact.do",{"userid":uid},function(data){
				$.each(data,function(){
					$("tbody").append("<tr><td style='text-align:center;'>"+this.nickname+"</td><td>"+this.username+"</td><td><input type='radio' name='contact'></td></tr>");
				});
			});
			
			$("#confim").click(function(){
				var	$ct_email = $("input[type=radio]:checked").parent().prev();
				var $ct_name = $ct_email.prev();
				closeContactBox();
				var $ch = $(".attendeeEmails").children();
				$ch.eq(index-1).val($ct_email.text())
				$ch.eq(index-2).val($ct_name.text())
				
			});
		}else{
			//没登陆从cookie中取值
			$("input[name=selfEmail]").val(getCookie("organiser_mail"));
		}
		
		
		$("#sendInv").click(function(){
			
			var myEmail = $("input[name=selfEmail]").val();
			if(!emailRex.test(myEmail)){
				$(".tipMess").text("我的邮箱不合法");
				return false;
			}
			
			var num=0;
			var flag = false;
			$("input[name=attendeeEmail]").each(function(){
				var ivalue = $.trim($(this).val());
				if(!ivalue==""){
					if(!emailRex.test(ivalue)){
						$(".tipMess").text("受邀人邮箱不合法");
						flag = false;
						return false;
					}else{
						flag = true;
					}
				}else{
					num++;
				}
			});
			
			if($("input[name=attendeeEmail]").length==num){
				$(".tipMess").text("至少邀请一人");
				return false;
			}
			
			return flag;
		});
		
		
	})


</script>
</body>
</html>