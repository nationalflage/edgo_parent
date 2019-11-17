<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title>操作列表</title>
</head>
<body>
	<div class="content">
		<!-- 左侧操作列表 begin -->
		<div class="operate-list">
			<h2 class="title">操作列表</h2>
			<ul>
				<li class="active" id="operate_nav1">
					<a href="###">
						<img class="icon" src="<%=basePath %>images/operate-list1.png" alt="蓝色图标"/>
						<p class="name">删除</p>
						<p class="date">09.18</p>
						<p class="con" title="您于今天删除食品流通企业食品药品监督管理局数据">您于今天删除食品流通企业食品药品监督管理局数据</p>
					</a>
				</li>
				<li id="operate_nav2">
					<a href="###">
						<img class="icon" src="<%=basePath %>images/operate-list2.png" alt="黄色图标"/>
						<p class="name">增加</p>
						<p class="date">09.18</p>
						<p class="con" title="您于今天删除食品流通企业食品药品监督管理局数据">您于今天删除食品流通企业食品药品监督管理局数据</p>
					</a>
				</li>
				<li id="operate_nav3">
					<a href="###">
						<img class="icon" src="<%=basePath %>images/operate-list2.png" alt="黄色图标"/>
						<p class="name">增加</p>
						<p class="date">09.18</p>
						<p class="con" title="您于今天删除食品流通企业食品药品监督管理局数据">您于今天删除食品流通企业食品药品监督管理局数据</p>
					</a>
				</li>
				<li id="operate_nav4">
					<a href="###">
						<img class="icon" src="<%=basePath %>images/operate-list3.png" alt="红色图标"/>
						<p class="name">增加</p>
						<p class="date">09.18</p>
						<p class="con" title="您于今天删除食品流通企业食品药品监督管理局数据">您于今天删除食品流通企业食品药品监督管理局数据</p>
					</a>
				</li>
				<li id="operate_nav5">
					<a href="###">
						<img class="icon" src="<%=basePath %>images/operate-list1.png" alt="蓝色图标"/>
						<p class="name">增加</p>
						<p class="date">09.18</p>
						<p class="con" title="您于今天删除食品流通企业食品药品监督管理局数据">您于今天删除食品流通企业食品药品监督管理局数据</p>
					</a>
				</li>
				<li id="operate_nav6">
					<a href="###">
						<img class="icon" src="<%=basePath %>images/operate-list3.png" alt="红色图标"/>
						<p class="name">增加</p>
						<p class="date">09.18</p>
						<p class="con" title="您于今天删除食品流通企业食品药品监督管理局数据">您于今天删除食品流通企业食品药品监督管理局数据</p>
					</a>
				</li>
				<li id="operate_nav7">
					<a href="###">
						<img class="icon" src="<%=basePath %>images/operate-list2.png" alt="黄色图标"/>
						<p class="name">增加</p>
						<p class="date">09.18</p>
						<p class="con" title="您于今天删除食品流通企业食品药品监督管理局数据">您于今天删除食品流通企业食品药品监督管理局数据</p>
					</a>
				</li>
				<li id="operate_nav8">
					<a href="###">
						<img class="icon" src="<%=basePath %>images/operate-list1.png" alt="蓝色图标"/>
						<p class="name">增加</p>
						<p class="date">09.18</p>
						<p class="con" title="您于今天删除食品流通企业食品药品监督管理局数据">您于今天删除食品流通企业食品药品监督管理局数据</p>
					</a>
				</li>
				<li id="operate_nav9">
					<a href="###">
						<img class="icon" src="<%=basePath %>images/operate-list1.png" alt="蓝色图标"/>
						<p class="name">增加</p>
						<p class="date">09.18</p>
						<p class="con" title="您于今天删除食品流通企业食品药品监督管理局数据">您于今天删除食品流通企业食品药品监督管理局数据</p>
					</a>
				</li>
				<li id="operate_nav10">
					<a href="###">
						<img class="icon" src="<%=basePath %>images/operate-list3.png" alt="红色图标"/>
						<p class="name">增加</p>
						<p class="date">09.18</p>
						<p class="con" title="您于今天删除食品流通企业食品药品监督管理局数据">您于今天删除食品流通企业食品药品监督管理局数据</p>
					</a>
				</li>
			</ul>
		</div>
		<!-- 左侧操作列表 end -->
		<!-- 右侧操作详情切换区 begin -->
		<div class="operate-right">
			<h2 class="title">操作详情</h2>
			<div id="operate_con1" style="display: block;">
				<!-- 操作详情 begin -->
				<div class="operate-detail">
					<p class="name">1.删除</p>
					<p class="con" style="margin-bottom:8px;">您于今天删除食品流通企业食品药品监督管理局数据</p>
					<p class="date">9月18日 14:23</p>
					<p class="con">消耗时间：3ms</p>
					<p class="con">原始数据：</p>
					<p class="con">最新数据：</p>
					<div class="result-list">
						<table class="table-result">
							<thead>
								<tr>
									<th class="center">序号</th>
									<th>企业名称</th>
									<th>注册号</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="center">1</td>
									<td>无限极（中国）有限公司</td>
									<td>005113654213</td>
								</tr>
								<tr>
									<td class="center">2</td>
									<td>华润集团有限公司</td>
									<td>561354165321</td>
								</tr>
								<tr>
									<td class="center">3</td>
									<td>上海移动通信有限责任公司</td>
									<td>65488998465548</td>
								</tr>
								<tr>
									<td class="center">4</td>
									<td>北京保利国际拍卖有限公司</td>
									<td>466516518498987</td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="clear"/>
				</div>
				<div class="operate-detail">
					<p class="name">2.删除</p>
					<p class="con" style="margin-bottom:8px;">您于今天删除食品流通企业食品药品监督管理局数据</p>
					<p class="date">9月18日 14:23</p>
					<p class="con">消耗时间：3ms</p>
					<p class="con">原始数据：</p>
					<p class="con">最新数据：</p>
					<div class="result-list">
						<table class="table-result">
							<thead>
								<tr>
									<th class="center">序号</th>
									<th>企业名称</th>
									<th>注册号</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="center">1</td>
									<td>无限极（中国）有限公司</td>
									<td>005113654213</td>
								</tr>
								<tr>
									<td class="center">2</td>
									<td>华润集团有限公司</td>
									<td>561354165321</td>
								</tr>
								<tr>
									<td class="center">3</td>
									<td>上海移动通信有限责任公司</td>
									<td>65488998465548</td>
								</tr>
								<tr>
									<td class="center">4</td>
									<td>北京保利国际拍卖有限公司</td>
									<td>466516518498987</td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="clear"/>
				</div>
				<!-- 操作详情 end -->
			</div>
			<div id="operate_con2" style="display: none;">
				<!-- 操作详情 begin -->
				<div class="operate-detail">
					<p class="name">1.增加</p>
					<p class="con" style="margin-bottom:8px;">您于今天增加食品流通企业食品药品监督管理局数据</p>
					<p class="date">9月18日 14:23</p>
					<p class="con">消耗时间：3ms</p>
					<p class="con">原始数据：</p>
					<p class="con">最新数据：</p>
					<div class="result-list">
						<table class="table-result">
							<thead>
								<tr>
									<th class="center">序号</th>
									<th>企业名称</th>
									<th>注册号</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="center">1</td>
									<td>无限极（中国）有限公司</td>
									<td>005113654213</td>
								</tr>
								<tr>
									<td class="center">2</td>
									<td>华润集团有限公司</td>
									<td>561354165321</td>
								</tr>
								<tr>
									<td class="center">3</td>
									<td>上海移动通信有限责任公司</td>
									<td>65488998465548</td>
								</tr>
								<tr>
									<td class="center">4</td>
									<td>北京保利国际拍卖有限公司</td>
									<td>466516518498987</td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="clear"/>
				</div>
				<div class="operate-detail">
					<p class="name">2.增加</p>
					<p class="con" style="margin-bottom:8px;">您于今天增加食品流通企业食品药品监督管理局数据</p>
					<p class="date">9月18日 14:23</p>
					<p class="con">消耗时间：3ms</p>
					<p class="con">原始数据：</p>
					<p class="con">最新数据：</p>
					<div class="result-list">
						<table class="table-result">
							<thead>
								<tr>
									<th class="center">序号</th>
									<th>企业名称</th>
									<th>注册号</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="center">1</td>
									<td>无限极（中国）有限公司</td>
									<td>005113654213</td>
								</tr>
								<tr>
									<td class="center">2</td>
									<td>华润集团有限公司</td>
									<td>561354165321</td>
								</tr>
								<tr>
									<td class="center">3</td>
									<td>上海移动通信有限责任公司</td>
									<td>65488998465548</td>
								</tr>
								<tr>
									<td class="center">4</td>
									<td>北京保利国际拍卖有限公司</td>
									<td>466516518498987</td>
								</tr>
							</tbody>
						</table>
					</div>
					<p class="clear"/>
				</div>
				<!-- 操作详情 end -->
			</div>
			<div id="operate_con3" style="display: none;">3</div>
			<div id="operate_con4" style="display: none;">4</div>
			<div id="operate_con5" style="display: none;">5</div>
			<div id="operate_con6" style="display: none;">6</div>
			<div id="operate_con7" style="display: none;">7</div>
			<div id="operate_con8" style="display: none;">8</div>
			<div id="operate_con9" style="display: none;">9</div>
			<div id="operate_con10" style="display: none;">10</div>
		</div>
		<!-- 右侧操作详情切换区 end -->
		<p class="clear"/><!--clear float-->
	</div>
</body>
</html>