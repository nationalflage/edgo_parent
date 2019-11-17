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
	<title>编辑</title>
</head>
<body>
	<div class="content">
	    <h1 class="public-title"><b>填写信息</b></h1>
	    <form class="query-list" method="post">
	        <table class="table-query">
	            <tbody>
		            <tr>
		                <th width="130">产品类型</th>
		                <td>
		                    <select class="easyui-combobox">
		                        <option value="0">请选择</option>
		                        <option value="1">选项1</option>
		                        <option value="2">选项2</option>
		                        <option value="3">选项3</option>
		                    </select>
		                </td>
		                <th width="130">产品属性</th>
		                <td>
		                    <select class="easyui-combobox">
		                        <option value="0">请选择</option>
		                        <option value="1">选项1</option>
		                        <option value="2">选项2</option>
		                        <option value="3">选项3</option>
		                    </select>
		                </td>
		            </tr>
		            <tr>
		                <th>统计时间</th>
		                <td>
		                    <input class="easyui-datebox"  type="text" style="width:140px;" />
		                    -
		                    <input class="easyui-datebox"  type="text" style="width:140px;" />
		                </td>
		                <th>是否合格</th>
		                <td>
		                    <label><input name="radio1" type="radio" checked/>是</label>
		                    <label><input name="radio1" type="radio"/>否</label>
		                </td>
		            </tr>
		            <tr>
		                <th>选择类型</th>
		                <td>
		                    <input class="easyui-textbox"  type="text"/><button class="btn btn-info btn-sm">选 择</button>
		                </td>
		                <th>填写内容</th>
		                <td>
		                    <input class="easyui-textbox" type="text"/>
		                </td>
		            </tr>
		            <tr>
		                <th>监测任务类型</th>
		                <td colspan="3">
		                    <label><input name="" type="checkbox"/>食品</label>
		                    <label><input name="" type="checkbox"/>药品</label>
		                    <label><input name="" type="checkbox"/>化妆品</label>
		                    <label><input name="" type="checkbox"/>保健食品</label>
		                    <label><input name="" type="checkbox"/>医疗器械</label>
		                </td>
		            </tr>
		            <tr>
		                <th>上传附件</th>
		                <td colspan="3">
		                    <!-- <div class="upload-file">
								<button class="btn btn-info btn-add">添加附件</button>
								<input class="input-file" type="file"/>
							</div> -->
		                    <input class="easyui-filebox" name="file1" data-options="prompt:'请选择文件'" style="width:450px">
		                </td>
		            </tr>
		            <tr>
		                <th valign="top">主要概述</th>
		                <td colspan="3">
		                    <input class="easyui-textbox" name="message" data-options="multiline:true" style="width:90%;height:100px;"/>
		                </td>
		            </tr>
	            </tbody>
	            <tfoot>
		            <tr height="100">
		                <td colspan="4">
		                    <input class="btn btn-info" type="button" value="保　存" />
		                    <input class="btn" type="button" value="重　置" />
		                </td>
		            </tr>
	            </tfoot>
	        </table>
	    </form>
	</div>
</body>
</html>