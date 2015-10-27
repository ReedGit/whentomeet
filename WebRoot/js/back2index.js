/**
 * 
 */
$(function(){
	var u = getCookie("user1");
	if(u==""||u==null){
		window.location.href= "index.html";
	}
})