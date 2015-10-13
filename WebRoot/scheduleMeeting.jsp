<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
 .scheduleBox {
    float: right;
    width: 460px;
    background: white;
    padding: 35px 30px 0 30px;
    border: 1px solid #ccc;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    -moz-box-shadow: 1px 1px 30px #333;
    -webkit-box-shadow: 1px 1px 30px #333;
    box-shadow: 0 0 30px #333;
    background: #eee;
    background: -webkit-gradient(linear, left bottom, left top, color-stop(0, #e8e8e8), color-stop(1, #fff));
    background: -ms-linear-gradient(bottom, #e8e8e8 0, #fff 100%);
    background: -moz-linear-gradient(center bottom, #e8e8e8 0, #fff 100%);
    background: -o-linear-gradient(#fff, #e8e8e8);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#e8e8e8', GradientType=0);
}

 .scheduleBox h1 {
    font-size: 30px;
    text-align: center;
    margin-bottom: 40px;
}
 .scheduleBox form {
    margin-bottom: 5px;
}
 .scheduleBox input[type="text"] {
    width: 300px;
    height: 25px;
    font-size: 18px;
    padding: 4px;
    border: 1px solid #aaa;
    color: #222;
}
 .scheduleBox select {
    width: 100px;
    border: 1px solid #aaa;
    color: #222;
}
 .scheduleBox .form-horizontal label {
    font-size: 18px;
    width: 90px;
}
 .scheduleBox label.control-label {
    font-size: 18px;
    color: black;
    font-weight: bold;
}
 .scheduleBox label .subText {
    font-size: 12px;
    color: #888;
}
 .scheduleBox .controls {
    margin-left: 120px;
}
 .scheduleBox .controls .subText {
    margin-top: 4px;
    font-size: 13px;
    color: #888;
}
 .scheduleBox textArea {
    width: 300px;
   /*  height: 90px; */
    font-size: 15px;
    border: 1px solid #aaa;
    color: #222;
}
 .scheduleBox .errMsg {
    color: #be1313;
    width: 200px;
    height: 15px;
    margin-top: 10px;
    float: right;
    font-style: italic;
    font-size: 15px;
    margin-right: 5px;
}
 .scheduleBox #cancelBtn {
    display: none;
}
 .scheduleBox .submitArea {
    padding: 20px 30px 10px 0;
    text-align: right;
}
 .scheduleBox Submit {
    font-size: 16px;
    width: 130px;
}

.scheduleBox #step1Submit {
    font-size: 16px;
    width: 130px;
}
</style>

</head>
<body>
	<div class="scheduleBox">
        <div class="titleBar">
            <h1>安排一次聚会吧</h1>
            <!--[if lt IE 9 ]> 
           <div id="browser_warning" style="font-size:16px;margin:-30px 0 20px 0;color:#FF0000;font-weight: bold;text-align: center;">This version of Internet Explorer is not fully supported.<br>Please try using NeedToMeet with a<br>newer version or another browser.</div>
           <![endif]-->

        </div>
        <form class="form-horizontal" action="addMeeting.do" method="post">
            <fieldset>

                <div class="control-group">
                    <label class="control-label" for="title" id="titleLabel">标题</label>
                    <div class="controls">
                        <input type="text" class="bigInput" id="title" name="title">
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="venue">
                     	  地点
                    </label>
                    <div class="controls">
                        <input type="text" class="bigInput" id="venue" name="location">
                    </div>
                </div>

                <div class="control-group">
                    <div id="duration_anchor" data-original-title="" title="">
                        <label class="control-label" for="duration">时长</label>
                        <div class="controls">
                            <select class="timeSelect" id="duration" name="duration">
                                <option value="1">15 分钟</option>
                                <option value="2">0.5 小时</option>
                                <option value="4" selected="">1.0 小时</option>
                                <option value="6">1.5 小时</option>
                                <option value="8">2.0 小时</option>
                                <option value="10">2.5 小时</option>
                                <option value="12">3.0 小时</option>
                                <option value="16">4.0 小时</option>
                                <option value="20">5.0 小时</option>
                                <option value="24">6.0 小时</option>
                                <option value="96">全天</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="description">
                       	 细节
                    </label>
                    <div class="controls">
                        <textarea id="description" name="content"> </textarea>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="email" id="emailLabel">
                        <span class="mainText">
                          	  邮箱
                        </span>

                        <span class="subText">
                            (推荐)
                        </span>

                    </label>
                    <div class="controls">
                        <input type="text" class="bigInput" id="email" value="" name="email">
                        <div class="subText">
                            (为了确认这次聚会 以及其他参加者的时间更新)
                            <!--We'll send your meeting confirmation to this address-->
                        </div>
                    </div>
                </div>



                <div class="submitArea">
                    <button id="cancelBtn" class="btn btnLargeGray">Cancel</button>
                    <!--          <button id="step1Submit" type="submit" class="btn-warning btn-large btnLargeOrange"> -->
                    <input id="step1Submit" type="submit" class="btn-primary btn-large" value="确认选择">
                    <!--     	确认选择
                    </button> -->
                    <br>
                    <div class="errMsg"></div>
                    <div style="clear:both"></div>
                </div>

            </fieldset>
        </form>
    </div>
</body>
</html>