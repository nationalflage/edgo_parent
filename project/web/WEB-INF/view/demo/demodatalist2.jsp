<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>非easyui表格</title>
</head>
<body>
	<div class="content">
	    <h1 class="public-title"><b>信息查询</b></h1>
	    <!-- 查询条件列表 -->
	    <form class="query-list" method="post">
	        <table class="table-query">
	            <tbody>
		            <tr>
		                <th width="110">备案编号</th>
		                <td>
		                    <input class="text"  type="text"/>
		                </td>
		                <th width="110">生产企业名称</th>
		                <td>
		                    <input class="text" type="text"/>
		                </td>
		                <th width="110">出口企业名称</th>
		                <td>
		                    <input class="text" type="text"/>
		                </td>
		            </tr>
		            <tr>
		                <th>出口产品名称</th>
		                <td>
		                    <input class="text" type="text"/>
		                </td>
		                <th>是否境内备案</th>
		                <td>
		                    <label><input name="judge" type="radio" checked/>是</label>
		                    <label><input name="judge" type="radio"/>否</label>
		                </td>
		                <th>注册号/备案号</th>
		                <td>
		                    <input class="text" type="text"/>
		                </td>
		            </tr>
		            <tr>
		                <th>销往国家</th>
		                <td>
		                    <select>
		                        <option value="1">中国</option>
		                        <option value="2">美国</option>
		                        <option value="3">意大利</option>
		                    </select>
		                </td>
		                <th>备案日期</th>
		                <td colspan="3">
		                    <input class="text" type="text" style="width:85px;" />
		                    至
		                    <input class="text" type="text" style="width:85px;" />
		                </td>
		            </tr>
	            </tbody>
	            <tfoot>
		            <tr>
		                <td colspan="6">
		                    <input class="btn btn-info" type="button" value="查　询" />
		                    <input class="btn" type="button" value="重　置" />
		                </td>
		            </tr>
	            </tfoot>
	        </table>
	    </form>
	</div>
	<div class="content">
	    <!-- 查询结果列表 begin -->
	    <div class="result-list">
	        <h1 class="title"><b>信息列表</b></h1>
	        <div class="operate">
	            <a class="ok" href="javascript:void(0)" title="确认"></a>
	            <a class="add" href="javascript:void(0)" title="添加"></a>
	            <a class="delete" href="javascript:void(0)" title="删除"></a>
	            <a class="save" href="javascript:void(0)" title="保存"></a>
	        </div>
	        <table class="table-result">
	            <thead>
		            <tr>
		                <th>序号</th>
		                <th>抽查任务名称</th>
		                <th>申请部门</th>
		                <th>计划抽查日期</th>
		                <th>执行状态</th>
		                <th>操作</th>
		            </tr>
	            </thead>
	            <tbody>
		            <tr>
		                <td>1</td>
		                <td>涉嫌虚假注册类企业定向抽查</td>
		                <td>北京市工商局</td>
		                <td>2017-01-03至2017-07-27</td>
		                <td>待执行</td>
		                <td>
		                    <span class="btn-view" title="查看" onclick="" ></span>
		                    <span class="btn-edit" title="编辑" onclick="" ></span>
		                    <span class="btn-delete" title="删除" onclick="" ></span>
		                    <img class="btn-img" src="<%=basePath%>images/setting.png" title="设置" onclick="" />
		                </td>
		            </tr>
		            <tr>
		                <td>2</td>
		                <td>涉嫌虚假注册类企业定向抽查</td>
		                <td>北京市工商局</td>
		                <td>2017-01-03至2017-07-27</td>
		                <td>待执行</td>
		                <td>
		                    <span class="btn-view" title="查看" onclick="" ></span>
		                    <span class="btn-edit" title="编辑" onclick="" ></span>
		                    <span class="btn-delete" title="删除" onclick="" ></span>
		                    <img class="btn-img" src="<%=basePath%>images/setting.png" title="设置" onclick="" />
		                </td>
		            </tr>
		            <tr>
		                <td>3</td>
		                <td>涉嫌虚假注册类企业定向抽查</td>
		                <td>北京市工商局</td>
		                <td>2017-01-03至2017-07-27</td>
		                <td>待执行</td>
		                <td>
		                    <span class="btn-view" title="查看" onclick="" ></span>
		                    <span class="btn-edit" title="编辑" onclick="" ></span>
		                    <span class="btn-delete" title="删除" onclick="" ></span>
		                    <img class="btn-img" src="<%=basePath%>images/setting.png" title="设置" onclick="" />
		                </td>
		            </tr>
		            <tr>
		                <td>4</td>
		                <td>涉嫌虚假注册类企业定向抽查</td>
		                <td>北京市工商局</td>
		                <td>2017-01-03至2017-07-27</td>
		                <td>待执行</td>
		                <td>
		                    <span class="btn-view" title="查看" onclick="" ></span>
		                    <span class="btn-edit" title="编辑" onclick="" ></span>
		                    <span class="btn-delete" title="删除" onclick="" ></span>
		                    <img class="btn-img" src="<%=basePath%>images/setting.png" title="设置" onclick="" />
		                </td>
		            </tr>
		            <tr>
		                <td>5</td>
		                <td>涉嫌虚假注册类企业定向抽查</td>
		                <td>北京市工商局</td>
		                <td>2017-01-03至2017-07-27</td>
		                <td>待执行</td>
		                <td>
		                    <span class="btn-view" title="查看" onclick="" ></span>
		                    <span class="btn-edit" title="编辑" onclick="" ></span>
		                    <span class="btn-delete" title="删除" onclick="" ></span>
		                    <img class="btn-img" src="<%=basePath%>images/setting.png" title="设置" onclick="" />
		                </td>
		            </tr>
		            <tr>
		                <td>6</td>
		                <td>涉嫌虚假注册类企业定向抽查</td>
		                <td>北京市工商局</td>
		                <td>2017-01-03至2017-07-27</td>
		                <td>待执行</td>
		                <td>
		                    <span class="btn-view" title="查看" onclick="" ></span>
		                    <span class="btn-edit" title="编辑" onclick="" ></span>
		                    <span class="btn-delete" title="删除" onclick="" ></span>
		                    <img class="btn-img" src="<%=basePath%>images/setting.png" title="设置" onclick="" />
		                </td>
		            </tr>
		            <tr>
		                <td>7</td>
		                <td>涉嫌虚假注册类企业定向抽查</td>
		                <td>北京市工商局</td>
		                <td>2017-01-03至2017-07-27</td>
		                <td>待执行</td>
		                <td>
		                    <span class="btn-view" title="查看" onclick="" ></span>
		                    <span class="btn-edit" title="编辑" onclick="" ></span>
		                    <span class="btn-delete" title="删除" onclick="" ></span>
		                    <img class="btn-img" src="<%=basePath%>images/setting.png" title="设置" onclick="" />
		                </td>
		            </tr>
		            <tr>
		                <td>8</td>
		                <td>涉嫌虚假注册类企业定向抽查</td>
		                <td>北京市工商局</td>
		                <td>2017-01-03至2017-07-27</td>
		                <td>待执行</td>
		                <td>
		                    <span class="btn-view" title="查看" onclick="" ></span>
		                    <span class="btn-edit" title="编辑" onclick="" ></span>
		                    <span class="btn-delete" title="删除" onclick="" ></span>
		                    <img class="btn-img" src="<%=basePath%>images/setting.png" title="设置" onclick="" />
		                </td>
		            </tr>
		            <tr>
		                <td>9</td>
		                <td>涉嫌虚假注册类企业定向抽查</td>
		                <td>北京市工商局</td>
		                <td>2017-01-03至2017-07-27</td>
		                <td>待执行</td>
		                <td>
		                    <span class="btn-view" title="查看" onclick="" ></span>
		                    <span class="btn-edit" title="编辑" onclick="" ></span>
		                    <span class="btn-delete" title="删除" onclick="" ></span>
		                    <img class="btn-img" src="<%=basePath%>images/setting.png" title="设置" onclick="" />
		                </td>
		            </tr>
		            <tr>
		                <td>10</td>
		                <td>涉嫌虚假注册类企业定向抽查</td>
		                <td>北京市工商局</td>
		                <td>2017-01-03至2017-07-27</td>
		                <td>待执行</td>
		                <td>
		                    <span class="btn-view" title="查看" onclick="" ></span>
		                    <span class="btn-edit" title="编辑" onclick="" ></span>
		                    <span class="btn-delete" title="删除" onclick="" ></span>
		                    <img class="btn-img" src="<%=basePath%>images/setting.png" title="设置" onclick="" />
		                </td>
		            </tr>
	            </tbody>
	        </table>
	    </div>
	    <!-- 查询结果列表 end -->
	</div>
</body>
</html>