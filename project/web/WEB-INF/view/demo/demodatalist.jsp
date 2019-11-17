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
	<title>数据列表</title>
</head>
<body>
<body>
<div class="content">
    <h1 class="public-title"><b>查询条件</b></h1>
    <!-- 查询条件列表 -->
    <form class="query-list" method="post" action="">
        <table class="table-query">
            <tbody>
            <tr>
                <th width="120">备案编号</th>
                <td>
                    <input class="easyui-textbox"  type="text" data-options="required:true"/>
                </td>
                <th width="120">生产企业名称</th>
                <td>
                    <input class="easyui-textbox" type="text"/>
                </td>
                <th width="120">出口企业名称</th>
                <td>
                    <input class="easyui-textbox" type="text"/>
                </td>
            </tr>
            <tr>
                <th>出口产品名称</th>
                <td>
                    <input class="easyui-textbox" type="text"/>
                </td>
                <th>是否境内备案</th>
                <td>
                    <label><input type="radio" name="judge" checked />是</label>
                    <label><input type="radio" name="judge"/>否</label>
                </td>
                <th>注册号/备案号</th>
                <td>
                    <!-- <input class="easyui-textbox" type="text"/> -->
                    <input id='tagId' type='text' class='easyui-textbox hy-userlayer' name="aaa" submitcode="bbb"/>
                </td>
            </tr>
            <tr>
                <th>销往国家</th>
                <td>
                    <select class="easyui-combobox">
                        <option value="1">中国</option>
                        <option value="2">美国</option>
                        <option value="3">意大利</option>
                        <option value="4">中国中国中国中国中国中国中国中国</option>
                    </select>
                </td>
                <th>备案日期</th>
                <td colspan="3">
                    <input class="easyui-datebox"  type="text" style="width:110px;" />
                    至
                    <input class="easyui-datebox"  type="text" style="width:110px;" />
                </td>
            </tr>
            </tbody>
            <tfoot>
            <tr>
                <td colspan="6">
                    <input type="button" class="btn btn-info" value="查　询" />
                    <input type="button" class="btn" value="重　置" />
                </td>
            </tr>
            </tfoot>
        </table>
    </form>
</div>

<div class="content">
    <!-- 查询结果列表 begin-->
    <div class="result-list">
        <h1 class="public-title"><b>查询结果</b></h1>
        <!-- 操作按钮 -->
        <div class="operate">
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'">添加</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'">编辑</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-save'">保存</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cut'">删除</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-cancel'">取消</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'">移除</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-search'">搜索</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-print'">打印</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'">刷新</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-help'">帮助</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-ok'">确定</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-back'">回退</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-export'">导出</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-import'">导入</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-template'">模板</a>
        </div>
        <table class="easyui-datagrid" data-options="pagination:true,singleSelect:false,rownumbers:true">
            <thead>
            <tr>
                <th data-options="field:'name1',width:50" checkbox='true'>序号</th>
                <th data-options="field:'name2',width:330">企业名称</th>
                <th data-options="field:'name3',width:180">注册号/统一代码</th>
                <th data-options="field:'name5',width:100">企业状态</th>
                <th data-options="field:'name6',width:310">住所</th>
                <th data-options="field:'name7',width:150">成立日期</th>
                <th data-options="field:'name8',width:130">推送依据</th>
                <th data-options="field:'name9',width:150">推送时间</th>
                <th data-options="field:'name10',width:100">匹配状态</th>
                <th data-options="field:'name11',width:290">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td></td>
                <td>华宇金信（北京）软件有限公司</td>
                <td>123456789 </td>
                <td> 开业</td>
                <td>北京市海淀区万泉河路68号紫金大厦1801室</td>
                <td>2007-01-01</td>
                <td>行政处罚</td>
                <td>2017-01-22</td>
                <td><span class="orange">未匹配</span></td>
                <td>
                    <!--  <a class="btn btn-info btn-sm" href="javascript:void(0)">编辑</a>
					 <a class="btn btn-info btn-sm" href="javascript:void(0)">删除</a> -->
                    <span class="btn-view" title="查看" onclick="" ></span>
                    <span class="btn-edit" title="编辑" onclick="" ></span>
                    <span class="btn-delete" title="删除" onclick="" ></span>
                    <img class="btn-img" src="<%=basePath%>images/setting.png" alt="设置" onclick="" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>华宇金信（北京）软件有限公司</td>
                <td>123456789 </td>
                <td> 开业</td>
                <td>北京市海淀区万泉河路68号紫金大厦1801室</td>
                <td>2007-01-01</td>
                <td>行政处罚</td>
                <td>2017-01-22</td>
                <td><span class="orange">未匹配</span></td>
                <td>
                    <!-- <a class="btn btn-info btn-sm" href="javascript:void(0)">编辑</a>
					<a class="btn btn-info btn-sm" href="javascript:void(0)">删除</a> -->
                    <span class="btn-start" title="开始" onclick="" ></span>
                    <span class="btn-stop" title="停止" onclick="" ></span>
                    <span class="btn-pause" title="暂停" onclick="" ></span>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>华宇金信（北京）软件有限公司</td>
                <td>123456789 </td>
                <td> 开业</td>
                <td>北京市海淀区万泉河路68号紫金大厦1801室</td>
                <td>2007-01-01</td>
                <td>行政处罚</td>
                <td>2017-01-22</td>
                <td><span class="orange">未匹配</span></td>
                <td>
                    <a class="btn btn-info btn-sm" href="javascript:void(0)">编辑</a>
                    <a class="btn btn-info btn-sm" href="javascript:void(0)">删除</a>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>华宇金信（北京）软件有限公司</td>
                <td>123456789 </td>
                <td> 开业</td>
                <td>北京市海淀区万泉河路68号紫金大厦1801室</td>
                <td>2007-01-01</td>
                <td>行政处罚</td>
                <td>2017-01-22</td>
                <td><span class="blue">已匹配</span></td>
                <td>
                    <a class="btn btn-info btn-sm" href="javascript:void(0)">编辑</a>
                    <a class="btn btn-info btn-sm" href="javascript:void(0)">删除</a>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>华宇金信（北京）软件有限公司</td>
                <td>123456789 </td>
                <td> 开业</td>
                <td>北京市海淀区万泉河路68号紫金大厦1801室</td>
                <td>2007-01-01</td>
                <td>行政处罚</td>
                <td>2017-01-22</td>
                <td><span class="blue">已匹配</span></td>
                <td>
                    <a class="btn btn-info btn-sm" href="javascript:void(0)">编辑</a>
                    <a class="btn btn-info btn-sm" href="javascript:void(0)">删除</a>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>华宇金信（北京）软件有限公司</td>
                <td>123456789 </td>
                <td> 开业</td>
                <td>北京市海淀区万泉河路68号紫金大厦1801室</td>
                <td>2007-01-01</td>
                <td>行政处罚</td>
                <td>2017-01-22</td>
                <td><span class="blue">已匹配</span></td>
                <td>
                    <a class="btn btn-info btn-sm" href="javascript:void(0)">编辑</a>
                    <a class="btn btn-info btn-sm" href="javascript:void(0)">删除</a>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <!-- 查询结果列表 end -->
</div>
</body>
</html>

 <script>
function selectOrg()
{
	openWinCallback('<%=basePath %>orginfo/gotoQueryList.xhtml',"选择组织机构","1100px","560px"
			   ,false,false,function setValue(x){$("#prodOrgName").textbox('setValue',x.orgname);$("#prodOrgId").val(x.orgid);});
}
    </script>