<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
#emails .leftSide {
	padding: 25px 30px 0px 0px;
	text-align: right;
	float: left;
	width: 100px;
}

#emails .rightSide {
	position: relative;
	width: 480px;
	float: left;
	border-left: 1px solid #ddd;
	padding: 20px 0px 10px 50px;
}

.inviteNoModal .instruction {
	font-size: 16px;
	margin: 30px 0px 4px 10px;
	font-weight: bold;
}

.reg_can_sync {
	font-weight: normal;
	font-size: 14px;
	color: #4CAEE3;
	padding-right: 80px;
}

.inviteNoModal .msg {
	display: none;
	font-size: 13px;
	padding-left: 6px;
	color: #be1313;
}
.submitArea .spinner {
    display: none;
    position: absolute;
    bottom: 12px;
    right: 20px;
}

.inviteNoModal .nameInput {
    width: 150px;
    margin-left: 10px;
    padding: 5px;
    font-size: 14px;
}

.inviteNoModal .addBtn {
    height: 20px;
    padding: 0px 10px;
    margin-left: 10px;
    margin-bottom: 10px;
    -moz-border-radius: 15px;
    -webkit-border-radius: 15px;
    border-radius: 15px;
}
.sync_btn {
    width: 200px;
    float: left;
    margin: 10px 0 0 10px;
    text-decoration: underline;
}
.submitArea .btn-primary.btn-large.sendBtn{
    float: right;
    margin-right: 80px;
    padding: 7px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
}
</style>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	$(function(){
		for(var i=0;i<3;i++){
			$(".attendeeEmails").append('<div class="inviteRow">'
											+'<input class="nameInput ui-autocomplete-input" type="text" placeholder="name" autocomplete="off" role="textbox"'
											+'aria-autocomplete="list" aria-haspopup="true" name="attendeeName">'
											+'&nbsp;<input class="emailInput" type="text" placeholder="email" name="attendeeEmail">'
											+'</div>');
		}
		$(".btn.addBtn.moreEmails").click(function(){
			for(var i=0;i<3;i++){
				$(".attendeeEmails").append('<div class="inviteRow">'
												+'<input class="nameInput ui-autocomplete-input" type="text" placeholder="name" autocomplete="off" role="textbox"'
												+'aria-autocomplete="list" aria-haspopup="true" name="attendeeName">'
												+'&nbsp;<input class="emailInput" type="text" placeholder="email" name="attendeeEmail">'
												+'</div>');
			}
			
		});
	})


</script>
</head>
<body>
	<div id="emails" style="display: block;">
		<div class="leftSide">
			<a href="#" class="backLink"> ← go back</a>
		</div>

		<div class="rightSide">
			<h1>Send invitations by email</h1>
			<form action="sendtoMail.do" method="post">
			<input type="hidden" name="meetId" value="${param.meetId}">
			<div id="inviteAttendees">
				<div class="inviteNoModal">
					<div class="inviteForm">
						<label class="instruction">Your info</label> 
						<input class="nameInput yourName" type="text" placeholder="your name">
						<input class="emailInput yourEmail" type="text" placeholder="your email" name="selfEmail"> 
						
						<span class="msg">invalid email</span> 
						<br>
						
						<div class="instruction">
								Attendee info
							<span class="reg_can_sync pull-right">
								Registered users can sync &amp; save contacts
							</span>
						</div>
						<div class="attendeeEmails">
								<!-- 邀请人邮箱 -->						
						</div>
						<div class="btn addBtn moreEmails">+ more emails</div>
					</div>
					
					<div class="submitArea">
						<div>
							<a href="#syncModal" data-toggle="modal" class="sync_btn">Sync your contacts</a>
						</div>
						<button class="btn-primary btn-large sendBtn">Send Invites</button>
						<img class="spinner" src="img/loading.gif">
						<div style="clear: both"></div>
					</div>
					
					<div class="privacyNote">
						We never share emails. See our <a href="/privacy" target="_blank">privacy
							policy</a>.
					</div>
					<input type="hidden" name="group_ids" id="group_ids">
				</div>
			</div>
			</form>
	</div>
	</div>
	
</body>
</html>