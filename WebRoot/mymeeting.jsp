<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ include file="public/headfile.html"%>
<script type="text/javascript" src="js/jquery.tablesorter.min.js"></script>
<script type="text/javascript">
		$(function() {
			$("table").tablesorter({debug: true});
		});
</script>
<link rel="stylesheet" href="css/tablesorterstyle.css" type="text/css" id="" media="print, projection, screen" />
<style type="text/css">
div.organize{
	width: 791px;
	height: 519px;
	/* border: solid 2px red; */
	box-shadow: 0 0 30px #333;
	background-color: #fff; 
	border-radius: 10px;
	float: right;
	margin:32px 105px 0 20px;
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
				<tr>
					<td><a>聚会1</a></td>
					<td>2015-10-23</td>
					<td>10/20</td>
					<td>8</td>
				</tr>
				<tr>
					<td><a>聚会2</a></td>
					<td>2015-5-24</td>
					<td>4/6</td>
					<td>0</td>
				</tr>
				<tr>
					<td><a>聚会3</a></td>
					<td>2015-5-12</td>
					<td>4/6</td>
					<td>0</td>
				</tr>
				<tr>
					<td><a>聚会4</a></td>
					<td>2015-5-25</td>
					<td>4/6</td>
					<td>0</td>
				</tr>
			</tbody>
			<tfoot><tr><td colspan="4"></td></tr></tfoot>
		</table>
	</div>
</div>
</body>
</html>