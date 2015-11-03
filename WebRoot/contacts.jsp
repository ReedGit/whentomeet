<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="public/headfile.html"%>
<script type="text/javascript" src="js/back2index.js"></script>
<script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
<link rel="stylesheet" href="css/tablesorterstyle.css" type="text/css" id="" media="print, projection, screen" />
<style type="text/css">
div.contacts{
	width: 791px;
	/* height: 519px; */
	/* border: solid 2px red; */
	box-shadow: 0 0 30px #333;
	background-color: #fff; 
	border-radius: 10px;
	float: right;
	margin:60px 13% 150px 0;
	padding-bottom: 30px;
 }
 
 .title{
 	width: 100%;
 	font-size: 35px;
 	font-weight: bolder;
 	color: #000;
 	padding :60px 0 0 0 ;
 	text-align: center;
 	
 }
 .search{
 	border: none 0 #fff; 
 	width: 100%;
 	padding: 20px 0  0 62px;
 }

</style>

</head>
<body>
<%@ include file="public/head.html"%>
<div id="wrapper">
<%@ include file="public/accountleft.html"%>
<div class="contacts">
	<div class="title">我的联系人</div>
	
	<div class="search">
		搜索：<input type="text" class="form-control" id="name" placeholder="请输入搜索内容" style="width: 220px; display: inline;">
	</div>
	
	<div>
	<table class="tablesorter" border="1">
			<thead>
				<tr>
					<th>姓名</th>
					<th>邮箱</th>
					<th>分组</th>
				</tr>
			</thead>
			<tbody>
			
			</tbody>
			<tfoot><tr><td colspan="3"></td></tr></tfoot>
		</table>
		
		<ul class="pager">
  			<li class="previous"><a href="#">&larr; Older</a></li>
  			<li class="next"><a href="#">Newer &rarr;</a></li>
		</ul>
		
	</div>
</div>
</div>
<div class="clearfix"></div>
<!--/start-copyright-section-->
		<div class="copyright">
			
		</div>
<!--//end-copyright-section-->

<script type="text/javascript">
var curpage = 0;
var loadContacts = function(page){
	$.get("findAllContactForpage.do",{"userid":uid,"start":page,"items":11},function(data){
		$('tbody').empty();
		if(data.length<11){
			$(".pager .next").css("pointer-events","none").addClass("disabled");
			$.each(data,function(){
				$(".contacts tbody").append("<tr><td style='text-align:center;'>"+this.nickname+"</td><td>"+this.username+"</td><td></td></tr>");
			});
		}else{
			for(var i=0;i<10;i++){
				$("tbody").append("<tr><td style='text-align:center;'>"+data[i].nickname+"</td><td>"+data[i].username+"</td><td></td></tr>");
			}
		}
		
		$("table").tablesorter();
	});
}

	$(function(){
		loadContacts(0);
		$(".pager .previous").css("pointer-events","none").addClass("disabled");
		
		$(".pager .previous").click(function(){
			$(".pager .next").css("pointer-events","auto").removeClass("disabled");
			curpage -=10;
			
			loadContacts(curpage);
			if(curpage==0){
				$(this).css("pointer-events","none").addClass("disabled");
			}
				
		});
		$(".pager .next").click(function(){
			$(".pager .previous").css("pointer-events","auto").removeClass("disabled");
			curpage +=10;
			loadContacts(curpage);
		});
		
	})
</script>
</body>
</html>