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
<script type="text/javascript">
	var curpage = 0;
	Date.prototype.yyyymmdd = function() {         
        
        var yyyy = this.getFullYear().toString();                                    
        var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based         
        var dd  = this.getDate().toString();             
                            
        return yyyy + '-' + (mm[1]?mm:"0"+mm[0]) + '-' + (dd[1]?dd:"0"+dd[0]);
   };
	
   
    var getResponseNum = function(meetId){
	   var guys = 0;
	   var response = 0;
	   $.ajax({
		   url:"getAllPersonTime.do",
		   data:{"meetid":meetId},
		   async:false,
		   success:function(data){
			   guys = data.length;
			   $.each(data,function(){
				   if(this.ptime!=null){
					   response++;
				   }
			   });
		   }
	   });
	   return response+"/"+guys;
   }
	var loadData = function(page){
		$.ajax({
			url:"findAllMeeting.do",
			data:{"organiser":uid,"start":page,"items":11},
			dataType:"json",
			type:"get",
			success:function(data){
				$('tbody').empty();
				if(data.length<11){
					$(".pager .next").css("pointer-events","none").addClass("disabled");
					$.each(data,function(){
						var date = new Date(this.createTime);
						$("tbody").append("<tr><td><a href='replyTime.jsp?meetId="+this.meetid+"&personId=-1'>"+this.title+"</a></td><td>"+date.yyyymmdd()+"</td><td>"+getResponseNum(this.meetid)+"</td><td>0</td></tr>");
					});
				}else{
					for(var i=0;i<10;i++){
						var date = new Date(data[i].createTime);
						$("tbody").append("<tr><td><a href='replyTime.jsp?meetId="+data[i].meetid+"&personId=-1'>"+data[i].title+"</a></td><td>"+date.yyyymmdd()+"</td><td>"+getResponseNum(this.meetid)+"</td><td>0</td></tr>");
					}
				}
				$("table").tablesorter({debug: true});
			}
		});
	}


		$(function() {
			loadData(0);
			$(".pager .previous").css("pointer-events","none").addClass("disabled");
			
			$(".pager .previous").click(function(){
				$(".pager .next").css("pointer-events","auto").removeClass("disabled");
				curpage -=10;
				
				loadData(curpage);
				if(curpage==0){
					$(this).css("pointer-events","none").addClass("disabled");
				}
					
			});
			$(".pager .next").click(function(){
				$(".pager .previous").css("pointer-events","auto").removeClass("disabled");
				curpage +=10;
				loadData(curpage);
			});
			
		});
</script>
<link rel="stylesheet" href="css/tablesorterstyle.css" type="text/css" id="" media="print, projection, screen" />
<style type="text/css">
div.organize{
	width: 791px;
	/* height: 519px; */
	/* border: solid 2px red; */
	box-shadow: 0 0 30px #333;
	background-color: #fff; 
	border-radius: 10px;
	float: right;
	margin:32px 105px 50px 20px;
	padding-bottom: 30px;
 }
 
 .title{
 	width: 100%;
 	font-size: 35px;
 	font-weight: bolder;
 	color: #000;
 	padding :60px 0 0 62px ;
 	
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
<div class="organize">
	<div class="title">我组织的会议</div>
	<div class="search">
		搜索：<input type="text" class="form-control" id="name" placeholder="请输入搜索内容" style="width: 220px; display: inline;">
	</div>
	
	<div>
		<table class="tablesorter" border="1">
			<thead>
				<tr>
					<th>聚会名称</th>
					<th>创建日期</th>
					<th>回复</th>
					<th>评论</th>
				</tr>
			</thead>
			<tbody>
				
			</tbody>
			<tfoot><tr><td colspan="4"></td></tr></tfoot>
		</table>
		
		<ul class="pager">
  			<li class="previous"><a href="#">&larr; Older</a></li>
  			<li class="next"><a href="#">Newer &rarr;</a></li>
		</ul>
		
	</div>
</div>
</div>
<!--/start-copyright-section-->
<div class="clearfix"></div>
		<div class="copyright">
			
		</div>
<!--//end-copyright-section-->
</body>
</html>