/**
 * 
 */
/* 定义时间间隔 */
/*var tds = parseInt("${param.duraValue}");*/
var pencil = false;
var eraser = false;
var tds;
$(function(){
	var url = decodeURI(decodeURI(window.location.href));
	tds = parseInt(url.substring(url.indexOf("duration")+9,url.indexOf("&content")));
	//tds = parseInt($("#duration").val());
	/* 每四行划线 */
	$('td.showTime').nextAll().css('border-top', 'solid 1px #bbb');
	$('td.showTime').first().nextAll().css('border-top', 'solid 0 #bbb');
	$("#containTable td").not(".timeLable").not(".withBg").not(".midFill").css("backgroundColor","#fff");
	
	/* console.log($(this).index()+" : "+$(this).parent().index()); */
	$("#containTable td").not(".timeLable").not(".midFill").css('cursor', 'url(img/pencil.png), auto');
	
	
	$("#containTable td").not(".timeLable").not(".midFill").hover(moveIn,moveOut);
	
	
	$("#containTable td").not(".timeLable").not(".midFill").mousedown(mouseDown).mouseup(mouseUp);
	
	/* 转换时间格式 24/12h */
	var showTime = $(".showTime");
	$("#changeTimeFormat").click(function(){
		if($("#changeTimeFormat a").text()=="12h"){
			$("#changeTimeFormat a").text("24h");
			$(showTime).each(function(index){
				if(index==0){
					$(this).text("12:00am");
				}else if(index<12){
					$(this).text(index+":00am");
				}else{
					if((index-12)==0){
						$(this).text("12:00pm");
					}else{
						$(this).text((index-12)+":00pm");
					}
					
				}
				
			});
		}else{
			$("#changeTimeFormat a").text("12h");
			$(showTime).each(function(index){
				if(index==0){
					$(this).text("00:00");
				}else{
					$(this).text(index+":00");
				}
				
			});
		}
		return false;
	});
	
	/* 初始化 */
	$(showTime).each(function(index){
		if(index==0){
			$(this).text("00:00");
		}else{
			$(this).text(index+":00");
		}
		
	});
	
	/* 初始化 date*/
	var isChange = false;
	var month0 = null;
	$(".date").not(".midFill").each(function(index){
		var date = new Date();
		var week = date.getDay();
		var day  = date.getDate();
		date.setDate(day-week+index);
		
		var month = date.getMonth();
		if(index==0){
			 month0 = month;
		}
		if(month0!=month){
			isChange = true;
		}
		
		$(this).text(month+1+"月"+date.getDate()+"日");
	});
	
	
	/* 设置当前周背景 */
	var dateB = new Date();
	var weekB = dateB.getDay();
	var monthL =dateB.getMonth();
	$(".date").eq(weekB).parent().css("backgroundColor","#FFFDD0");
	/* 设置标题 */
	if(isChange){
		$("#dateLable h2").text(dateB.getFullYear()+" 年 "+(month0+1)+"月 / "+((month0+2)>12?1:(month0+2))+"月");
	}else{
		$("#dateLable h2").text(dateB.getFullYear()+" 年 "+(month0+1)+"月");
		
	}
	
	
	/* 选择日期 */
	var step = 0;
	var step2 = 0;
	var date2 = null;
	$("div.prevArrow").hide();
	$("div.nextArrow").click(function(){
			isChange = false;
		 	if(step2>=14){
		 		step2-=14;
		 	}
		 	if(step==0){
		 		step2 = 0;
		 	}
		 	
			step+=14;
		 	if(step>0){
				$("div.prevArrow").show();
				$(".date").eq(weekB).parent().css("backgroundColor","#F8F8F8");
			}
			$(".date").not(".midFill").each(function(index){
				date2 = new Date();
				var week2 = date2.getDay();
				var day2  = date2.getDate();
				date2.setDate(day2-week2+step+index);
				
				var month = date2.getMonth();
				if(index==0){
					 month0 = month;
				}
				if(month0!=month){
					isChange = true;
				}
				$(this).text(month+1+"月"+date2.getDate()+"日");
			});
			if(isChange){
				$("#dateLable h2").text(date2.getFullYear()+" 年 "+(month0+1)+"月 / "+((month0+2)>12?1:(month0+2))+"月");
			}else{
				$("#dateLable h2").text(date2.getFullYear()+" 年 "+(month0+1)+"月");
				
			}
			
			/* 移动timeTable */
			var classNm = $("#selectTime tr:first-child td:last-child").attr("class");
			var showNm = $("#selectTime tr:first-child td:not(:hidden,.showTime,timeLable)").last().attr("class");
			var cn = classNm.split(/[_\s]/);
			var sn = showNm.split(/[_\s]/);
			var cn_num = parseInt(cn[1]);
			var sn_num = parseInt(sn[1]);
			if(cn_num==sn_num){
				var t = cn_num;
				$("#selectTime tr").append('<td class="col_'+(++cn_num)+' withBg"></td>'
											+'<td class="col_'+(++cn_num)+'"></td>'
											+'<td class="col_'+(++cn_num)+'"></td>'
											+'<td class="col_'+(++cn_num)+'"></td>'
											+'<td class="col_'+(++cn_num)+'"></td>'
											+'<td class="col_'+(++cn_num)+'"></td>'
											+'<td class="col_'+(++cn_num)+' withBg"></td>'
											+'<td class="midFill col_'+(++cn_num)+'"></td>'
											+'<td class="col_'+(++cn_num)+' withBg"></td>'
											+'<td class="col_'+(++cn_num)+'"></td>'
											+'<td class="col_'+(++cn_num)+'"></td>'
											+'<td class="col_'+(++cn_num)+'"></td>'
											+'<td class="col_'+(++cn_num)+'"></td>'
											+'<td class="col_'+(++cn_num)+'"></td>'
											+'<td class="col_'+(++cn_num)+' withBg"></td>');
				/* 每四行划线 */
				$('td.showTime').nextAll().css('border-top', 'solid 1px #bbb');
				$('td.showTime').first().nextAll().css('border-top', 'solid 0 #bbb');
				for(var i=0;i<15;i++){
					$(".col_"+(t-i)).hide();
					$(".col_"+(t+1+i)).not(".midFill").mousedown(mouseDown).mouseup(mouseUp);
					$(".col_"+(t+1+i)).not(".midFill").hover(moveIn,moveOut);
				}
			}else{
				
				for(var i=0;i<15;i++){
					$(".col_"+(sn_num-i)).hide();
					$(".col_"+(sn_num+1+i)).show();
				}
			}
			$("#containTable td").not(".timeLable").not(".withBg").not(".midFill").css("backgroundColor","#fff");
			$("#containTable td").not(".timeLable").not(".midFill").css('cursor', 'url(img/pencil.png), auto');
			$("td.selected,td.selectedTail").css("backgroundColor","#ffde7d");
			
	});
	
	
	$("div.prevArrow").click(function(){
		isChange = false;
		step2+=14;
		if(step>=14){
			step-=14;
		}
		if(step==0){
			$("div.prevArrow").hide();
			$(".date").eq(weekB).parent().css("backgroundColor","#FFFDD0");
		}
		var tempDate = null;
		$(".date").not(".midFill").each(function(index){
			tempDate = new Date(date2);
			
			/* tempDate.setDate(tempDate.getDate()-13-step2+index); */
			tempDate.setDate(tempDate.getDate()-13-step2+index);
			
			var month = tempDate.getMonth();
			if(index==0){
				 month0 = month;
			}
			if(month0!=month){
				isChange = true;
			}
			
			$(this).text(tempDate.getMonth()+1+"月"+tempDate.getDate()+"日");
		});
		
		if(isChange){
			$("#dateLable h2").text(tempDate.getFullYear()+" 年 "+(month0+1)+"月 / "+((month0+2)>12?1:(month0+2))+"月");
		}else{
			$("#dateLable h2").text(tempDate.getFullYear()+" 年 "+(month0+1)+"月");
			
		}
		
		/* 移动timeTable */
		var classNm = $("#selectTime tr:first-child td:not(:hidden,.showTime,timeLable)").first().attr("class");
		var cn = classNm.split(/[_\s]/);
		var cn_num = parseInt(cn[1]);
		for(var i=0;i<15;i++){
			$(".col_"+(cn_num+i)).hide();
			$(".col_"+(cn_num-1-i)).show();
		}
		
		$(".selected,.selectedTail").css("backgroundColor","#ffde7d");
	});
	
	
	/* 提交 */
	$("#step2Submit").click(function(){
		var classNm = $("#selectTime tr:first-child td:last-child").attr("class");
		var cn = classNm.split(/[_\s]/);
		var cn_num = parseInt(cn[1]);
		var timeArray = [];
		for(var i=1;i<=cn_num;i++){
			var timeItem;
			$(".col_"+i+".selected").each(function(){
				timeItem = {};
				var selectIndex = $(this).parent().index();
				timeItem.startTime = selectIndex;
				timeItem.endTime = selectIndex+tds;
				timeItem.day = $(".date").eq((i%15)-1).text();
				timeItem.week = $(".date").eq((i%15)-1).parent().contents().first().text();
				timeArray.push(timeItem);
			});
			
		}
		
		var param = url.substring(url.indexOf("?"));
		$.get("addMeeting.do"+param,function(data){
			if(data!=null){
				$.ajax({
					url:'addTime.do',
					type:"post",
					data:{"times":JSON.stringify(timeArray),"meetId":data.meetid},
					dataType:"text",
					success:function(){
						window.location.href="createTime.jsp?meetId="+data.meetid;
					}
				
				});
				
			}
		});
		
		
		
		
	});
	
	$("#step2Back").click(function(){
		//$('#timeTableDiv').empty();
	});
	
	
})

var mouseDown = function(){
	var currentColor =  $(this).css("backgroundColor").colorHex();
	/*设置跨度*/
	var className = $(this).attr("class");
	var col = className.split(/\s/);
	col = col[0];
	var $sel =$(this).parent().nextAll(":lt("+(tds-1)+")").children("."+col);
	if(currentColor=="#fff1ca"){
		pencil = true;
		/* $(this).css({"backgroundColor":"#ffde7d","border":"solid 1px #836202"}); */
		$(this).css("backgroundColor","#ffde7d");
		$(this).addClass("selected");
		/*设置跨度*/
		$sel.css("backgroundColor","#ffde7d");
		$sel.addClass("selectedTail");
	} /* if(currentColor=="#ffde7d"){ */
		else if($(this).hasClass("selected")){
			var selectedIndex = $(this).parent().index();
			var mixIndex = $(this).parent().nextAll().children(".selected."+col).first().parent().index();
			var mixIndex_prev = $(this).parent().prevAll().children(".selected."+col).first().parent().index();
			eraser = true;
			$(this).css("backgroundColor","#fff1ca");
			$(this).removeClass("selected");
			if($(this).hasClass("selectedTail")){
				$(this).removeClass("selectedTail");
			}
			if($sel.hasClass("selected")){
				var $v = $(this).parent().nextAll(":lt("+(mixIndex-selectedIndex-1)+")").children("."+col);
				$v.css("backgroundColor","#fff1ca");
				$v.removeClass("selectedTail");
				var j = selectedIndex-mixIndex_prev;
				if(mixIndex_prev>=0&&j<tds){
					$(this).addClass("selectedTail");
					$(this).css("backgroundColor","#ffde7d");
					var tds1 =tds-2;
					for(var i=0;i<tds-j-1;i++){
						$($sel[i]).addClass("selectedTail").css("backgroundColor","#ffde7d");
					}
					
				}
				
			}else{
				var j = selectedIndex-mixIndex_prev;
				if(mixIndex_prev>=0 && j<tds){
					$(this).addClass("selectedTail");
					$(this).css("backgroundColor","#ffde7d");
					var tds1 =tds-2;
					for(var i=j;i>0;i--){
						$($sel[tds1--]).css("backgroundColor","#fff1ca").removeClass("selectedTail");
					}
				}else{
					$sel.css("backgroundColor","#fff1ca");
					$sel.removeClass("selectedTail");
				}
			}
			
		}else if($(this).hasClass("selectedTail")){
			pencil = true;
			/* $(this).removeClass("selectedTail");
			$sel.removeClass("selectedTail"); */
			$sel.css("backgroundColor","#ffde7d");
			$(this).addClass("selected");
			$sel.addClass("selectedTail");
		}
		
	
}
	
var mouseUp = function(){
	$(this).css('cursor', 'url(img/eraser.png), auto'); 
	var className = $(this).attr("class");
	var col = className.split(/\s/);
	var $rows = $(this).parent().nextAll(":lt("+(tds-1)+")").children("."+col);
	if(pencil){
		pencil = false;
		$(this).addClass("selected");
		$rows.not(".selectedTail").not(".selected").addClass("selectedTail").css("backgroundColor","#ffde7d");
	}
	
	eraser = false;
}

var moveIn = function(){
	
	/*设置跨度*/
	var className = $(this).attr("class");
	var col = className.split(/\s/);
	var $rows = $(this).parent().nextAll(":lt("+(tds-1)+")").children("."+col);
	
	if(pencil){
		$(this).css("backgroundColor","#ffde7d");
		$(this).css('cursor', 'url(img/pencil.png), auto');
		if(!$(this).hasClass("selected")&&!$(this).hasClass("selectedTail")){
			$(this).addClass("selected");
			$rows.not(".selectedTail").not(".selected").addClass("selectedTail").css("backgroundColor","#ffde7d");
		}
		$rows.not(".selectedTail").not(".selected").css("backgroundColor","#ffde7d");
	}else if(eraser){
		//$(this).css("backgroundColor","#fff");
		$(this).css('cursor', 'url(img/eraser.png), auto');
	}else {
		/* var offColor  =$(this).css("backgroundColor").colorHex(); */
		if($(this).hasClass("selected")){
			$(this).css('cursor', 'url(img/eraser.png), auto');
			$("#containTable td").not(".selected").not(".selectedTail").not(".withBg").not(".midFill").css("backgroundColor","#fff");
			if($(this).hasClass("withBg")){
				$(this).parent().nextAll().children("."+col).not(".selected").not(".selectedTail").css("backgroundColor","#F5F5F8");
			}else{
				$(this).parent().nextAll().children("."+col).not(".selected").not(".selectedTail").css("backgroundColor","#fff");
				
			}
			
		}else if($(this).hasClass("selectedTail")){
			$("#containTable td").not(".selected").not(".selectedTail").not(".withBg").not(".midFill").css("backgroundColor","#fff");
			if($(this).hasClass("withBg")){
				$(this).parent().nextAll().children("."+col).not(".selected").not(".selectedTail").css("backgroundColor","#F5F5F8");
			}else{
				$(this).parent().nextAll().children("."+col).not(".selected").not(".selectedTail").css("backgroundColor","#fff");
				
			}
			$rows.not(".selectedTail").not(".selected").css("backgroundColor","#FFF1CA");
			
			if($(this).parent().index()>96-tds){
				$(this).unbind('mouseenter mouseleave mousedown mouseup');
				$rows.unbind('mouseenter mouseleave mousedown mouseup');
			}
			
			
		}else{
			$(this).css('cursor', 'url(img/pencil.png), auto');
			$("#containTable td").not(".selected").not(".selectedTail").not(".withBg").not(".midFill").css("backgroundColor","#fff");
			$(this).css("backgroundColor","#FFF1CA");
			
			$rows.not(".selected").not(".selectedTail").css("backgroundColor","#FFF1CA");
		}
	}
	
	$(".timeLable").css("backgroundColor","#F8F8F8");
	var $tl = $(this).prevAll(".timeLable");
	$tl.css("backgroundColor","#FFF1CA");
	$tl.parent().nextAll(":lt("+(tds-1)+")").children(".timeLable").css("backgroundColor","#FFF1CA");
	
	
	if($(this).parent().index()>96-tds){
		$(this).not(".selected").not(".selectedTail").css("backgroundColor","#fff").unbind('mouseenter mouseleave mousedown mouseup');
		$rows.not(".selected").not(".selectedTail").css("backgroundColor","#fff").unbind('mouseenter mouseleave mousedown mouseup');
	}
}


var moveOut = function(){
	$(".timeLable").css("backgroundColor","#F8F8F8");
	var offColor =  $(this).css("backgroundColor").colorHex();
	
	var className = $(this).attr("class");
	var col = className.split(/\s/);
	var $cols = $(this).parent().nextAll(":lt("+(tds-1)+")").children("."+col);
	if(offColor=="#ffde7d"){
		$(".withBg").not(".selected").not(".selectedTail").css("backgroundColor","#F5F5F8");
	}else if($(this).hasClass("withBg")){
		
		$(this).css("backgroundColor","#F5F5F8");
		/*设置跨度*/
		$cols.not(".selected").not(".selectedTail").css("backgroundColor","#F5F5F8");
	}else{
		$(this).css("backgroundColor","#fff");
		/*设置跨度*/
		$cols.not(".selected").not(".selectedTail").css("backgroundColor","#fff");
	}
}