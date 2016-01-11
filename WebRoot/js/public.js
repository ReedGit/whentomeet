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

var deleteCookie = function ( name ) {
	  document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

var loadFoot = function(){
	$("div.copyright").load("public/copyright.html"); 
}

var chinaWeek = function(day){
	switch (day)
	{
		case 0: x="周日"; break;
		case 1: x="周一"; break;
		case 2: x="周二"; break;
		case 3: x="周三"; break;
		case 4: x="周四"; break;
		case 5: x="周五"; break;
		case 6: x="周六"; break;
	}
	return x;
}	

var getDateStr = function (AddDayCount) {
    var dd = new Date();
    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
    var m = dd.getMonth()+1;//获取当前月份的日期
    var d = dd.getDate();
    var week = dd.getDay();
    return m+"月"+d+"日<i class='hidden'>,</i>"+chinaWeek(week);
}
//用户选择开始时间，根据时长算出结束时间
var addHourMin = function(hour,min,dura){
	var d = new Date();
	d.setHours(hour); 
	d.setMinutes(parseInt(min)+dura*15);
	
	var nhour = d.getHours();
	var nmin  = d.getMinutes();
	
	if((nhour+"").length==1){
		nhour="0"+nhour;
	}
	if((nmin+"").length==1){
		nmin="0"+nmin;
	}
	return nhour+":"+nmin;
	
}

var loadHead = function(){
	$("div.header").load("public/head.html",function(){
		var nickname = getCookie("nickname");
		if(null!=nickname && ""!=nickname){
			//进到if里面，说明登陆成功
			//隐藏 登陆注册 visible-xs和hidden互斥
			$(".nav_login").addClass("hidden");
			$(".nav_register").addClass("hidden");
			$(".nav_login_xs").removeClass("visible-xs").addClass("hidden");
			$(".nav_register_xs").removeClass("visible-xs").addClass("hidden");
			//显示用户名 注销
			$(".nav_user").removeClass("hidden").text(nickname);
			$(".nav_remove").removeClass("hidden");
			$(".nav_user_xs").removeClass("hidden").addClass("visible-xs").text(nickname);
			$(".nav_remove_xs").removeClass("hidden").addClass("visible-xs");
			
			//使用懒加载，登陆成功再绑定click事件
			$(".nav_remove,.nav_remove_xs").click(function(){
				//nickname=xx 删除nickname 不是删除xx
				deleteCookie("nickname");
				window.location.href="index.html";
			});
			
		}
		
	}); 
}


$(function(){
	loadHead();
	loadFoot();
})