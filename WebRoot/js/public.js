/**
 * 
 */

var USER_STA = function(){
	var u = "";
	if(document.cookie.indexOf(";")>0)
		 u = document.cookie.split(";")[1].split("=")[1];
	if(u!=""){
		$(".user_icons .login,.user_icons .register").hide();
		$(".user_icons .userName").text(u+" |");
		$(".removeUser").show();
		$("ul li a.mymeeting").css("visibility","visible");
	}
	$(".removeUser").click(function(){
		$.ajax({
			url:"removeUser.do",
			type:"get",
			dataType:"text",
			success:function(data){
				if(data=="true"){
					console.log("zzz");
					$(".removeUser").hide();
					var exp = new Date();
					exp.setTime(exp.getTime() - 1);
					document.cookie= "user1="+u+";expires="+exp.toGMTString();
					window.location.href="index.html";
					$(".user_icons .login,.user_icons .register").show();
				}
			}
		});
		return false;
	});
	
}
$(function(){
	USER_STA();
})