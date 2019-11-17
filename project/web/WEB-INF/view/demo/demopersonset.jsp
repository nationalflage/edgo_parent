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
	<title>系统设置</title>
</head>
<body>
	<div class="content">
	    <h1 class="public-title"><b>系统设置</b></h1>
	    <div class="query-list">
	        <!-- 个人信息 begin-->
	        <h2 class="fold-head">个人信息<span class="fold-btn"></span></h2>
	        <form class="fold-content" method="post">
	            <table class="table-query">
	                <tbody>
		                <tr>
		                    <th width="10%">昵　称</th>
		                    <td>
		                        <input class="easyui-textbox" type="text"/>
		                    </td>
		                </tr>
		                <tr>
		                    <th>性　别</th>
		                    <td>
		                        <label><input name="sex" type="radio" checked="checked" />男</label>
		                        <label><input name="sex" type="radio"/>女</label>
		                    </td>
		                </tr>
		                <tr>
		                    <th>邮　箱</th>
		                    <td>
		                        <input class="easyui-textbox" name="email" data-options="required:true,validType:'email'" type="text"/>
		                    </td>
		                </tr>
		                <tr>
		                    <th>地　址</th>
		                    <td>
		                        <select class="easyui-combobox" style="width:100px;">
		                            <option value="">选择省</option>
		                            <option value="">北京</option>
		                            <option value="">辽宁</option>
		                            <option value="">吉林</option>
		                            <option value="">黑龙江</option>
		                        </select>
		                        <select class="easyui-combobox" style="width:100px;">
		                            <option value="">选择市区</option>
		                            <option value="">北京</option>
		                            <option value="">辽宁</option>
		                            <option value="">吉林</option>
		                            <option value="">黑龙江</option>
		                        </select>
		                        <input class="easyui-textbox" type="text"/>
		                    </td>
		                </tr>
	                </tbody>
	                <tfoot>
		                <tr>
		                    <td colspan="2">
		                        <input class="btn btn-info" type="button" value="确　定" />
		                        <input class="btn" type="button" value="重　置" />
		                    </td>
		                </tr>
	                </tfoot>
	            </table>
	        </form>
	        <!-- 个人信息 end-->
	        <!-- 密码修改 begin -->
	        <h2 class="fold-head">密码修改<span class="fold-btn"></span></h2>
	        <form class="fold-content" method="post">
	            <table class="table-query">
	                <tbody>
		                <tr>
		                    <th width="10%">当前密码</th>
		                    <td>
		                        <input class="easyui-textbox"  type="password"/>
		                    </td>
		                </tr>
		                <tr>
		                    <th>新&nbsp;密&nbsp;码</th>
		                    <td>
		                        <input class="easyui-textbox"  type="password"/>
		                    </td>
		                </tr>
		                <tr>
		                    <th>密码强度</th>
		                    <td>
		                        <span class="strong0" alt="初始状态"></span>
		                        <span class="strong1" alt="弱"></span>
		                        <span class="strong2" alt="中"></span>
		                        <span class="strong3" alt="强"></span>
		                    </td>
		                </tr>
		                <tr>
		                    <th>确认密码</th>
		                    <td>
		                        <input class="easyui-textbox"  type="password"/>
		                    </td>
		                </tr>
	                </tbody>
	                <tfoot>
		                <tr>
		                    <td colspan="2">
		                        <input class="btn btn-info" type="button" value="确　定" />
		                        <input class="btn" type="button" value="重　置" />
		                    </td>
		                </tr>
	                </tfoot>
	            </table>
	        </form>
	        <!-- 密码修改 end -->
	    </div>
	</div>
</body>
</html>