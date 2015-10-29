/**
 * 
 */
var setCookie = function (name,value)
{
    var exp = new Date();
    exp.setTime(exp.getTime() + 60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

var getCookie = function (name)
{
    var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");

    if(arr=document.cookie.match(reg))

        return unescape(arr[2]);
    else
        return null;
}

var loadFoot = function(){
	$(".copyright").load("public/copyright.html"); 
}


var USER_STA = function(){
	var u = getCookie("user1");
	var o = getCookie("organiser");
	if(u!=""&&u!=null){
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
					$(".removeUser").hide();
					var exp = new Date();
					exp.setTime(exp.getTime() - 1);
					document.cookie= "user1="+u+";expires="+exp.toGMTString();
					document.cookie= "organiser="+o+";expires="+exp.toGMTString();
					window.location.href="index.html";
					$(".user_icons .login,.user_icons .register").show();
				}
			}
		});
		return false;
	});
	$(".userName").click(function(){
		$(".dropdownmenu").toggle();
	});
	/*$("body").not(".userName").click(function(){
		$(".dropdownmenu").hide();
	});*/
	
}
$(function(){
	USER_STA();
	loadFoot();
})