<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/flat-ui.css">
<style type="text/css">
	body{
		background-image: url("img/bg2.jpg");
	}
	
	.main{
		width: 1289px;
	    height: 1111px;
		border: solid 2px red;
		margin: 0 auto;
		background-color: #F5F5F5;
		border-radius:8px;
	}
	.main .innerContent{
		font-family:Georgia,"Arial";
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
    .logo {
	    position: relative;
	    width: 40%;
	    float: left;
	    /* border: 1px solid #e1af32; */
	}
	
	.header h1
{
	font-family:"黑体";
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
    font-family: "黑体";
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
		font-family:Georgia,"Arial";
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
	.myTime,.reloadRemove,.check_box,.topFill2,.yourName,.response{
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
		border-right: solid 1px #bbb;
		border-bottom: solid 1px #bbb;
		position: relative;
		left: 39px;
	}
	
	.submitArea{
		/* position: relative;
		top:300px;
		left:70px; */
		margin-top: 45px;
		margin-left: 14px;
	}
.submitArea .comment {
    float: left;
    width: 320px;
    height: 20px;
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
}

#selectItem .selectItems{
	
	margin-left: 83px;
}

</style>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
var arr = [] ;
var getPt = function(){
	$.post('getAllPersonTime.do',{"meetid":"${param.meetId}"}, function(data) {
		$.each(data,function(index,data){
			var ptime = data.ptime;
			if(data.personid=="${param.personId}") {
				$("#nameCell_1 #nameCellInput").val(data.name);
				if(ptime!=null){
				$("#nameCell_1").html('<img class="photo_small" width="26" height="26" src="img/defaultHeader.png">'+data.name);
					 $("div.submitArea").hide();
					 var ptimeArr = ptime.split(",");
					 $(".table_right .check_box td").each(function(index,value){
						 if($.inArray(index+"",ptimeArr)!=-1){
							$(this).text("✓");
						 }else{
							 $(this).text("");
						 }
					});
				}
			}else{
				if(ptime!=null){
					$(".table_right tr:nth-last-child(2)").after("<tr class='reloadRemove'></tr>");
					$(".table_left tr:nth-last-child(3)").after("<tr class='reloadRemove'><td><img class='photo_small' width='26' height='26' src='img/defaultHeader.png'>"+data.name+"</td></tr>");
					var ptimeArr = ptime.split(",");
					var num = $(".table_right .check_box td").length;
					for(var i=0;i<num;i++){
						if($.inArray(i+"",ptimeArr)!=-1){
							$(".table_right tr:nth-last-child(2)").append("<td>✓</td>");
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
					if($(value).text()=="✓"){
						arr.push(index);
					}
				});
			}else{
				if(arr.length==0)
					return;
				$(value).children().each(function(index,value){
					if($(value).text()=="✓"){
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
						$(".table_right .weekDate").append("<td colspan='1'>"+weekDate+"</td>");
					}else if(args[0]==weekDate){
						var $lastTd = $(".weekDate").children().last();
						$lastTd.attr("colspan",parseInt($lastTd.attr("colspan"))+1);
					}else{
						weekDate = args[0];
						$(".table_right .weekDate").append("<td colspan='1'>"+weekDate+"</td>");
					}
					
					$(".table_right .timeDura").append("<td>"+args[1]+"</td>");
					$(".table_right .myTime").append("<td>✓&nbsp;</td>");
					$(".table_right .check_box").append("<td ><input value='"+index+"' type='checkbox'></td>");
					$(".table_right").css("width",120*(index+1)+"px");
					
				});
				 
				 if($(".table_right").width()<$(".containRtalbe").width()){
					 $(".table_right .tableTail").hide();
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
	
		$.post('findMeeting.do',{"meetid":"${param.meetId}"}, function(data) {
			 $("#title").text(data.title);
			/*  $("span#location").text(data.location); */
			 $("#durationLabel").text(data.duration/4);
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
				 if($(this).text()=="✓"){
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

</head>
<body>

	<div class="header">
		<div class="logo">	
			<h1>meeting</h1>
		</div>
		<button type="button"  class="btn btn-link2">register</button>
		<button type="button"  class="btn btn-link2">login</button>
	</div>
<div class="main">
	
	<div class="innerContent">
           <h1 id="title"></h1>
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
						<img class="photo_small" width="26" height="26" src="img/defaultHeader.png">ewr (Organizer)
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
			
			<div class="submitArea" style="clear:both;">
	           <!--    <div class="spinner">
	                        <img src="/images/loading.gif"><br>
	              </div>
	 			-->
	              <textarea name="comment" class="comment" id="comment" style="overflow: hidden; resize: none; height: 20px; color: rgb(153, 153, 153);">Add a comment (optional)</textarea>
	              <button id="resultsTableSubmit" class="btn-primary btn-large">Submit</button>
	              <!-- <button id="cancelBtn" class="btn btnLargeGray">Cancel</button> -->
	
	              <div style="clear:both"></div>
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

</body>
</html>