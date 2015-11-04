/**
 * 
 */
var u = getCookie("user1");
var uid = getCookie("organiser");
var usermail = getCookie("usermail");
$(function(){
	if(u==""||u==null){
		window.location.href= "index.html";
	}
})