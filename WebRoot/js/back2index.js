/**
 * 
 */
var u = getCookie("user1");
var uid = getCookie("organiser");
$(function(){
	if(u==""||u==null){
		window.location.href= "index.html";
	}
})