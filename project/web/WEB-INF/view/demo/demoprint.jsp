<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<script type="text/javascript" src="<%=basePath%>js/LodopFuncs.js"></script>

<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
</head>

<body>
	<div class="content">
		<object id="LODOP_OB"
			classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
			<embed id="LODOP_EM" type="application/x-print-lodop" width=0
				height=0></embed>
		</object>


		<input type="button" id="test" class="btn btn-info"
			divIds="30,20,200,200,printId0;30,250,200,200,printId1" printType="4"
			imageType="3" class="hy-print" value="打印">

		<input type="button" id="test1"
			divIds="30,20,600,600,<img border='0' src='http://imgs.hbsztv.com/2016/0908/20160908012332100.jpg'/>"
			printType="1" imageType="2"  value="打印图片" class="btn btn-info hy-print">
		<table>
			<tr>
				<td colspan="2"><p>事例一:合并打印两个或者多个div的内容</p>&nbsp;&nbsp;&nbsp;&nbsp;

				</td>

			</tr>
			<tr>
				<td>

					<div id="printId0">
						<div style="width: 200px; height: 200px; background-color: cyan;padding: 5px;">此处定义要打印的div1内容</div>
					</div>
				</td>
				<Td>
					<div id="printId1">
						<div style="width: 200px; height: 200px; background-color: grey;color: #fff;padding: 5px;">此处定义要打印的div2内容</div>
					</div>
				</Td>
			</tr>
		</table>
		<br />
		<br />

		<table>
			<tr>
				<td>
					<p>事例二:打印图片</p>
					<input type="button" class="btn btn-info" value="打印" id="test2">
				</td>
			</tr>
			<tr>
				<td><img border='0' src='<%=basePath%>images/bg-blue3.jpg' width="40%" height="40%"/></td>
			</tr>
		</table>
	</div>
</body>
</html>
