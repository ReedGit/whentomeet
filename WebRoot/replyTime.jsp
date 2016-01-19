<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/customer.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/replyTime.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/public.js"></script>
</head>
<body>
<!-- 导航 头-->
<div class="header"></div>

<!-- 桌面 -->
<br>
<br>
<br>
<div class="container well">
	<div class="row">
           	<div class="page-header mypage-header">
   				<h1 id="title"></h1>
   				<span class="col-xs-offset-1 col-sm-offset-0">时长：<small id="durationLabel"></small>小时</span>
   				<small class="pull-right">
   					<a href="sendInvitations.html?meetId=${param.meetId }">增加联系人</a>
   				</small>
			</div>
    </div>

	<div class="row panel panel-default">
		<div class="panel-heading">
      		<h1 class="panel-title">选择合适的时间来参加聚会吧</h1>
  		</div>
	
		<br>
		<!-- 包括tableLeft tableRight -->
		<div class="col-xs-12 scroll tableall">
			<table border="1" class="table_left table-border-bg col-xs-4 col-sm-2">
				<tr class="topFill1">
					<td>
					</td>
				</tr>
				
				<tr class="topFill2">
					<td class="nameCell fixed" id="nameCell_0">
						<img class="photo_small" width="26" height="26" src="img/defaultHeader.png"> <span></span> (组织者)
					</td>
				</tr>
				<tr class="yourName">
					<td id="nameCell_1" class="nameCell nameCellInput fixed ">
						<input type="textbox" id="nameCellInput" placeholder="Your Name">
					</td>
				</tr>
			</table>
			
			<div class="tableR col-xs-1 col-sm-7 no-padding-left">
			<!-- tableRight -->
			<table border="1" class="table_right text-center fixtable">
				<tr class="weekDate table-border-bg" ></tr>
				
				<tr class="timeDura table-border-bg"></tr>
				
				<tr class="myTime table-br"></tr>
				
				<tr class="check_box table-br"></tr>
			</table>
			</div>
		</div>
	</div>
	<div class="visible-xs"><br></div>
	<div class="row submitArea">
             <textarea class="myform-control col-xs-10 col-xs-offset-1 col-sm-4 col-sm-offset-0" rows="1">增加一条评论 (可选)</textarea>
             <div class="visible-xs"><br><br><br></div>
             <button type="button" class="btn btn-success col-xs-10 col-xs-offset-1 col-sm-2 col-sm-offset-1" id="resultsTableSubmit">提交</button>
             
             <!-- load图片 -->
	      	 <div class="text-center">
	      		<div class="error-tip"></div>
	      		<img class="loading center-block hidden" alt="loading" src="img/loading.gif">
	      	 </div>
	      	 <br>
	      	 <br>
	      	 <br>
    </div>
    
	<div id="selectItem" class="msyahei cursor-pointer">
		<p>你已经提交了！请选择下列操作中的一个吧。</p>
		<div>
			<a  class="modifyLink">修改已选择的时间</a>
			<br>
			<a  class="removeLink">我不想参加，删除我！</a>
			<br>
			<a  class="modifyLink1">修改已选择的时间</a>
		</div>
	</div>
	<br><br>
</div>

<br><br><br><br>
<div class="container mycontainer">
	 <div class="row">
		<!-- copyright -->
		<div class="copyright"></div>
	 </div>
</div>

<script type="text/javascript">
var arr = [] ;
var contactEmail = [];
var contactName = [];
var getPt = function(){
	$.post('getAllPersonTime.do',{"meetid":"${param.meetId}"}, function(data) {
		$.each(data,function(index,data){
			var ptime = data.ptime;
			contactEmail.push($.trim(this.personEmail));
			contactName.push($.trim(this.name));
			if(data.personid=="${param.personId}") {
				$("#nameCell_1 #nameCellInput").val(data.name);
				if(ptime!=null){
				$("#nameCell_1").html('<img class="photo_small" width="26" height="26" src="img/defaultHeader.png">'+data.name);
					 $("div.submitArea").hide();
					 var ptimeArr = ptime.split(",");
					 $(".table_right .check_box td").each(function(index,value){
						 if($.inArray(index+"",ptimeArr)!=-1){
							$(this).html("&#10004;");
						 }else{
							 $(this).text("");
						 }
					});
				}else{
					$("#selectItem").hide();
				}
			}else{
				if(ptime!=null){
					$(".table_right tr:nth-last-child(2)").after("<tr class='reloadRemove'></tr>");
					$(".table_left tr:nth-last-child(2)").after("<tr class='reloadRemove'><td><img class='photo_small' width='26' height='26' src='img/defaultHeader.png'>"+data.name+"</td></tr>");
					var ptimeArr = ptime.split(",");
					var num = $(".table_right .check_box td").length;
					for(var i=0;i<num;i++){
						if($.inArray(i+"",ptimeArr)!=-1){
							$(".table_right tr:nth-last-child(2)").append("<td>&#10004;</td>");
						}else{
							$(".table_right tr:nth-last-child(2)").append("<td></td>");
						}
					}
				}
			}
		});
		
		//////backgroundcolor
		
		var arr2 = [] ;
		arr = [];
		$(".table_right .myTime").nextAll().each(function(index,value){
			if($(value).children(":first-child").has("input").length>0){
				return;
			}
			if(index==0){
				$(value).children().each(function(index,value){
					if($(value).text()=="✔"){
						arr.push(index);
					}
				});
			}else{
				if(arr.length==0)
					return;
				$(value).children().each(function(index,value){
					if($(value).text()=="✔"){
						arr2.push(index);
					}
				});
				
				if(arr2.length==0){
					arr=[];
					return;
				}
				arr = arr.filter(function(el) {
				    return arr2.indexOf(el) != -1;
				});
				
				arr2= [];
			}
		});
		if(arr.length>0){
			$.each(arr,function(index1,value1){
				$(".table_right .timeDura").children().eq(value1).addClass("checkedTogether");
			});
			$(".table_right .timeDura").nextAll().each(function(index,value){
				if($(value).children(":first-child").has("input").length>0){
					$.each(arr,function(index1,value1){
						$(value).children().eq(value1).click(function(event){
							$(this).toggleClass("checkedTogether");
							if(event.target.nodeName=="TD"){
								if($(this).children("input").prop('checked')){
									$(this).children("input").prop('checked',false);
								}else{
									$(this).children("input").prop('checked',true);
								} 
							}
						 });
					});
					return;
				}
				
				$.each(arr,function(index1,value1){
					$(value).children().eq(value1).addClass("checkedTogether");
				});
			});
		}
		
		$.post('findMeeting.do',{"meetid":"${param.meetId}"}, function(data) {
			 $("#title").text(data.title);
			//  $("span#location").text(data.location); 
			 $("#durationLabel").text(data.duration/4);
			
			 if("${param.personId}"==-1){
				 var u = getCookie("user1");
					if(u!=""&&u!=null){
						$(".response").after("<tr class='decideTime'></tr>");
						$(".table_left .decideTime").append("<td><div id='senddecideTime' style='background-image:url(img/email_icon.png);width:32px;height:32px;margin:0 auto;'></div></td>");
							
							for(var i=0;i<leh;i++){
								$(".table_right .decideTime").append('<td><input type="radio" name="timeChoice" class="winnerCal"></td>')
							}
							
							//回显最终时间
							var cto = data.confirmTimeOrder;
							$(".table_right .decideTime").children().eq(cto).children().prop("checked", true);
							
							
							//senddecideTime
							$("#senddecideTime").click(function(){
								$("img.loading").removeClass("hidden");
								
								var s = $(".table_right .decideTime td input[name=timeChoice]:checked").parent().index();
								var weekd = $(".weekDate td[index~="+s+"]").text();
								var timed = $(".timeDura").children().eq(s).text();
								
								$.post("sendDecideTime.do",{"contactEmail":JSON.stringify(contactEmail),"contactName":JSON.stringify(contactName),"meetTheme":$("#title").text(),"week":weekd,"time":timed,"meetId":"${param.meetId}","confirmTimeOrder":s},function(data){
									if(data==true){
										$("img.loading").addClass("hidden");
										$(".error-tip").text("此次的聚会时间已经通过邮件发送给大家了！");
									}
								});
							});
					}
				 
			 }
			
		});
		
		//聚会主办人
		if("${param.personId}"==-1){
			$(".yourName,.check_box,.submitArea,#selectItem").hide();
			
			$(".panel-title").text("大家选择的时间");
				var responseArr = [];
				$(".myTime").nextAll().not(".check_box").each(function(){
					$(this).children().each(function(index){
						var res = responseArr[index]==undefined?0:responseArr[index];
						if($(this).text()==""){
							responseArr[index] =res;
						}else{
							responseArr[index] =res+1;
						}
						
					});
				});
				
				$(".check_box").after("<tr class='response table-br'></tr>");
				$(".yourName").after("<tr class='response'><td>&nbsp;有&nbsp;"+$(".table_left .reloadRemove").length+"&nbsp;个人回复</td></tr>");
				//没人回复的状态
				var leh = $(".myTime").children().length;
				if(responseArr.length==0){
					for(var i=0;i<leh;i++){
						$(".table_right .response").append("<td>"+0+"</td>")
					}
				}
				//有人回复的状态
				$.each(responseArr,function(index,value){
					$(".table_right .response").append("<td>"+value+"</td>")
				});
				
				
		}
		
		
	});
}


	$(function(){
		$.ajax({
			url:"findAllTime.do",
			type:"post",
			dateType:"json",
			data:{"meetId":"${param.meetId}"},
			success:function(data){
				var weekDate; 
				var temp = 0;
				 $.each(data,function(index,value){
					var args  = value.date.split("#");
					if(index==0){
						weekDate = args[0];
						$(".table_right .weekDate").append("<td style='width:120px' colspan='1' index='"+index+"'>"+weekDate+"</td>");
					}else if(args[0]==weekDate){
						var $lastTd = $(".weekDate").children().last();
						$lastTd.attr("colspan",parseInt($lastTd.attr("colspan"))+1);
						$lastTd.attr("index",parseInt($lastTd.attr("index"))+" "+index);
						$lastTd.css("width",($lastTd.width()*2)+"px");
					}else{
						weekDate = args[0];
						$(".table_right .weekDate").append("<td style='width:120px' colspan='1' index='"+index+"'>"+weekDate+"</td>");
					}
					
					$(".table_right .timeDura").append("<td>"+args[1]+"</td>");
					$(".table_right .myTime").append("<td>&#10004;</td>");
					$(".table_right .check_box").append("<td><input value='"+index+"' type='checkbox'></td>");
					 /*循环结束，得到一个多少个cell,然后计算宽度*/
					$(".table_right").css("width",120*(index+1)+"px");
				});
				
				 
				$(".table_right tr.check_box td").hover(function(){
						$(this).toggleClass("highlight");
				});
					
					getPt();
				
			},
			error:function(data){
				console.log(data);
			}
			
		});
	
		
		
		$("#resultsTableSubmit").click(function(){
				var ptime = "";
			$(".table_right .check_box td input:checked").each(function(){
				ptime+=$(this).val()+",";
			});
			$.post('addPerson.do',{"personId":"${param.personId}","ptime":ptime,"name": $("#nameCellInput").val()}, function(data) {
				$(".reloadRemove").remove();
				$(".table_right td.checkedTogether").removeClass("checkedTogether");
				getPt();
				$("div.submitArea").hide();
				$("div#selectItem").show();
			}); 
		});
		
		//修改已选择的时间
		$("#selectItem a.modifyLink").click(function(){
			$("#nameCell_1").html('<input type="textbox" id="nameCellInput" value="'+$("#nameCell_1").text()+'" placeholder="Your Name">');
			 $(".table_right .check_box td").each(function(index,value){
				 if($(this).text()=="✔"){
					 $(this).html("<input value='"+index+"' type='checkbox' checked='checked'>");
				 }else{
					 $(this).html("<input value='"+index+"' type='checkbox'>");
				 }
				 
			 });
			 
			 $("#selectItem").hide();
			 $("div.submitArea").show();
			 
			 $(".table_right tr.check_box td").hover(function(){
					$(this).toggleClass("highlight");
			 });
			 
			 
			$.each(arr,function(index,value){
				if(!$(".table_right tr.check_box td").eq(value).data("events")){
					$(".table_right tr.check_box td").eq(value).click(function(event){
						$(this).toggleClass("checkedTogether");
						if(event.target.nodeName=="TD"){
							if($(this).children("input").prop('checked')){
								$(this).children("input").prop('checked',false);
							}else{
								$(this).children("input").prop('checked',true);
							} 
						}
					 });
				}
			});
			return false;
		});
		
		
		
	})
	
</script>
</body>
</html>


