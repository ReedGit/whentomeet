<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
	.main{
		width: 1289px;
	    height: 800px;
		border: solid 1px transparent;
		margin: 60px auto 200px;
		background-color: #F5F5F5;
		border-radius:5px;
		box-shadow: 0 0 30px #333;
	}
	.main .innerContent{
		margin-left: 40px;
		margin-top: 40px;
		margin-bottom: 40px;
	}
	.header {
	    margin: 0;
	    padding: 0;
	    width: 100%;
	    height: 80px;
	    vertical-align: middle;
    }
	.header h1
{
		color:#e1af32;
	    font-size: 3em;
}
    
    hr {
    border: 1px solid #e1af32;
    /* margin-left: -10px; */
}
    
    .title h2 {
    color: #e1af32;
    letter-spacing: 2em;
    }
    
    .title h2 span {
    color: #fff;
    font-weight: 500;
    letter-spacing: 1em;
}
    
    .resultsTable{
    	margin-top: 75px;
    	/* border: solid green 2px; */
    }
	.table_left,.table_right{
		float: left;
		border: 1px solid #bbb;
		background: #fff;
		
	}
	
	#resultsArea{
		background-color:#fff;
		border: solid 1px #bbb;	
/* 		border: solid 1px red;	 */
		border-radius:8px;
		width: 1209px;
		height: 564px;
		margin: 0 auto;
	}
	
	#resultsArea .headingArea{
		/* border-radius:8px; */
		border-top-left-radius:8px;
		border-top-right-radius:8px;
		background-color:#F6F6F6;
		height: 67px;
		width: 100%;
		border-bottom: solid 1px #bbb;
	}
	
	#resultsArea .headingArea span{
		font-size: 30px;
		position: relative;
		top: 25px;
		left: 45px;
		font-weight: bold;
	}
	.table_left{
		background: #e0e0e0;
		width:242px;
		table-layout:fixed;
		position: relative;
		left: 40px;
		
	}
	.table_right{
		text-align: center;
		table-layout: fixed;
	}
	.table_right .weekDate,.table_right .timeDura{
		background: #e0e0e0;
	} 
	.table_right .weekDate{
		font-weight: bold;
		height: 51px;
	}
	.table_right .timeDura{
		height: 41px;
	}
	.myTime,.reloadRemove,.check_box,.topFill2,.yourName,.response,.decideTime{
		height: 35px;
	}
	.topFill1{
		height: 93px;
	}
	.yourName input#nameCellInput{
		margin-top: 4px;
		font-size: 14px;
	    height: 20px;
	    width: 229px;
	}
	.tableTail{
		height: 17px;
	}
	div.containRtalbe{
		width: 902px;
		overflow: auto;
		border-top-width: 0;
		border-left-width: 0;
		border-right: solid 1px transparent;
		border-bottom: solid 1px transparent;
		position: relative;
		left: 39px;
	}
	
	.submitArea{
		/* position: relative;
		top:300px;
		left:70px; */
		margin-top: 45px;
		margin-left: 14px;
		overflow: auto;
	}
.submitArea #comment {
    float: left;
    width: 320px;
   /*  height: 20px; */
    line-height: 18px;
    padding: 6px;
    margin: 3px 20px 0 24px;
    font-size: 14px;
    color: #999;
}

.submitArea #resultsTableSubmit {
    width: 110px;
    float: left;
    margin: 0 0 0 25px;
}

.table_right tr td.highlight{
	background-color: #F6F6F6;
}
.table_right tr td.checkedTogether{
	background-color: #ffffbb;
}

.photo_small {
    width: 26px;
    height: 26px;
    margin-right: 7px;
}

#selectItem{
	margin-top: 10px;
	margin-left: 40px;
	font-family: "Microsoft Yahei","微软雅黑",Helvetica,SimSun,SimHei;
	line-height: 26px;
}

#selectItem .selectItems{
	
	margin-left: 83px;
}
#selectItem .selectItems a:hover{
    color: #005580;
    text-decoration: underline;
}
#selectItem .selectItems a{
    color: #0088cc;
}

.tipMess{
	line-height: 30px;
}
.MeetingAdmin{
	float: right;
	margin-right: 50px;
	color: #0088cc;
}
.MeetingAdmin a{
	color: #0088cc;
}
</style>


</head>
<body>
<%@ include file="public/head.html"%>
<div class="main">
	
	<div class="innerContent">
           <h1 id="title"></h1>
           	
           	<div class="MeetingAdmin">
           		<i class="icon-plus-sign"></i><a href="sendInvitations.jsp?meetId=${param.meetId }">增加联系人</a>
           	</div>
           	
           	
           <br>
           	时长：<span id="durationLabel"></span>小时
           	
    </div>

	<div id="resultsArea" >
	
		<div class="headingArea">
			<span>你什么时候能参加呢？</span>
		</div>
	
		<div class="resultsTable">
			<table border="1" class="table_left">
				<tr class="topFill1">
					<td>
						<a>Select via calendar</a>
						<a>24h</a>
					</td>
				</tr>
				
				<tr class="topFill2">
					<td class="nameCell fixed" id="nameCell_0">
						<img class="photo_small" width="26" height="26" src="img/defaultHeader.png"> <span></span> (Organizer)
					</td>
				</tr>
				<tr class="yourName">
					<td id="nameCell_1" class="nameCell nameCellInput fixed ">
						<input type="textbox" id="nameCellInput" placeholder="Your Name">
					</td>
				</tr>
				
				<tr class="tableTail">
					<td></td>
				</tr>
			</table>
			<div class="containRtalbe">
				<table border="1" class="table_right">
					<tr class="weekDate">
					</tr>
					
					<tr class="timeDura">
					</tr>
					
					<tr class="myTime">
					</tr>
					
					<tr class="check_box">
						
					</tr>
				</table>
			</div>
			
			<div class="tipMess">
				
			</div>
			
			<div class="submitArea" style="clear:both;">
	              <textarea class="form-control" id="comment" rows="1">增加一条评论 (可选)</textarea>
	              <button type="button" class="btn btn-success" id="resultsTableSubmit">提交</button>
	       </div>
	       
			<div id="selectItem">
				<p>你已经提交了！请选择下列操作中的一个吧。</p>
				<div class="selectItems">
					<a  class="modifyLink">修改已选择的时间</a>
					<br>
					<a  class="removeLink">我不想参加，删除我！</a>
					<br>
					<a  class="modifyLink1">修改已选择的时间</a>
				</div>
			</div>
		</div>



	</div>
	
</div>

<!--/start-copyright-section-->
<div class="clearfix"></div>
		<div class="copyright">
			
		</div>
<!--//end-copyright-section-->

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
							$(this).html("&radic;");
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
					$(".table_left tr:nth-last-child(3)").after("<tr class='reloadRemove'><td><img class='photo_small' width='26' height='26' src='img/defaultHeader.png'>"+data.name+"</td></tr>");
					var ptimeArr = ptime.split(",");
					var num = $(".table_right .check_box td").length;
					for(var i=0;i<num;i++){
						if($.inArray(i+"",ptimeArr)!=-1){
							$(".table_right tr:nth-last-child(2)").append("<td>&radic;</td>");
						}else{
							$(".table_right tr:nth-last-child(2)").append("<td></td>");
						}
					}
				}
			}
		});
		
		//////backgroundcolor
		
		var arr2 = [] ;
		$(".table_right .myTime").nextAll().each(function(index,value){
			if($(value).children(":first-child").has("input").length>0){
				return;
			}
			if(index==0){
				$(value).children().each(function(index,value){
					if($(value).text()=="√"){
						arr.push(index);
					}
				});
			}else{
				if(arr.length==0)
					return;
				$(value).children().each(function(index,value){
					if($(value).text()=="√"){
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
			/*  $("span#location").text(data.location); */
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
								$(".tipMess").empty().append('<img class="spinner" src="img/loading.gif">');
								
								var s = $(".table_right .decideTime td input[name=timeChoice]:checked").parent().index();
								var weekd = $(".weekDate td[index~="+s+"]").text();
								var timed = $(".timeDura").children().eq(s).text();
								
								$.post("sendDecideTime.do",{"contactEmail":JSON.stringify(contactEmail),"contactName":JSON.stringify(contactName),"meetTheme":$("#title").text(),"week":weekd,"time":timed,"meetId":"${param.meetId}","confirmTimeOrder":s},function(data){
									if(data==true){
										$(".spinner").remove();
										$(".tipMess").text("此次的聚会时间已经通过邮件发送给大家了！");
									}
								});
							});
					}
				 
			 }
			
		});
		
		//聚会主办人
		if("${param.personId}"==-1){
			$(".yourName,.check_box,.submitArea,#selectItem").hide();
			
			$(".headingArea span").text("大家选择的时间");
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
				
				$(".check_box").after("<tr class='response'></tr>");
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
						//$(".table_right .weekDate").append("<td colspan='1' index='"+index+"'>"+weekDate+"</td>");
						$(".table_right .weekDate").append("<td style='width:120px' colspan='1' index='"+index+"'>"+weekDate+"</td>");
					}
					
					$(".table_right .timeDura").append("<td>"+args[1]+"</td>");
					$(".table_right .myTime").append("<td>&radic;&nbsp;</td>");
					$(".table_right .check_box").append("<td><input value='"+index+"' type='checkbox'></td>");
					$(".table_right").css("width",120*(index+1)+"px");
					
				});
				 
				 if($(".table_right").width()<$(".containRtalbe").width()){
					 $(".tableTail").hide();
					 /* $(".containRtalbe").css("borderWidth","0"); */
				 }
				 
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
		
		/*修改已选择的时间*/
		$("#selectItem a.modifyLink").click(function(){
			$("#nameCell_1").html('<input type="textbox" id="nameCellInput" value="'+$("#nameCell_1").text()+'" placeholder="Your Name">');
			 $(".table_right .check_box td").each(function(index,value){
				 if($(this).text()=="√"){
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


