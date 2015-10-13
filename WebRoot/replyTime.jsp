<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
	.table_left,.table_right{
		float: left;
		border: 1px solid #bbb;
	}
	.table_left{
		background: #e0e0e0;
		width:242px;
		table-layout:fixed;
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
	.myTime,.reloadRemove,.check_box,.topFill2,.yourName{
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
			 $("#duration span").text(data.duration/4);
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

<div class="main">
	<div class="innerContent">
		<h1 id="title">${meet.title}</h1>
		<div id="duration">
				Duration:	<span></span> hour
		</div>
	</div>
	
	<div id="resultsArea">
		<div class="headingArea">
                <h2>When can you attend?</h2>
        </div>
        
        <div id="aboveTableArea">
                    <div class="sortArea">
                        Sort by:
                        <div class="btn-group sortOptions">
                            <button id="sortDates" class="btn disabled chosen">Date</button>
                            <button id="sortAvail" class="btn">Availability</button>
                        </div>
                    </div>
                    <div style="clear:both"></div>
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
			<a  class="modifyLink">修改已选择的时间</a>
		</div>

	</div>
	
</div>


</body>
</html>