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
	<title>常用控件</title>
</head>
<body>

<div class="content">

    <h1 class="public-title"><b>常用控件</b></h1>

    <div class="query-list" method="post" action="">
        <!-- 个人信息 begin-->
        <h2 class="fold-head">
           常用控件<span class="fold-btn"></span>
        </h2>
        <form class="fold-content" method="post" action="" id="form1">
            <table class="table-query">
                <tbody>
                    <tr>
                        <th width="150">文本框</th>
                        <td>
                            <input id="nn" class="easyui-textbox"  type="text" />
                            
                        </td>
                        <th width="150">性别（radio）</th>
                        <td>
                            <label><input type="radio" name="sex"  checked="checked" />男</label>
                            <label><input type="radio" name="sex"/>女</label>
                        </td>
                    </tr>
                    <tr>
                        <th>人员层组件</th>
                        <td colspan="3"><input id='tagId' type='text' class='easyui-textbox hy-userlayer'/></td>
                    </tr>
                    <tr>
                        <th>性别1（radio）</th>
                        <td colspan="3">
                     	   <span id="111" class="hy-radio" options="男:M;女:G" checkoptions="G" name="sex1"></span>
                        </td>
                    </tr>
                    <tr>
                         <th>性别2（checkbox）</th>
                         <td colspan="3">
                               <span id="113" class="hy-checkbox" options="男:M;女:G" checkoptions="G,M" name="sex111"></span>
                         </td>
                    </tr>
                     
                    <tr>
                        <th>下拉列表</th>
                        <td>
                            <select class="easyui-combobox hy-codeselect" type="text" codetable="district" id="districtid" />
                        </td>
                        <th>日期</th>
                        <td>
                            <input class="easyui-datebox"  type="text" style="width:110px;" />
                        </td>
                    </tr>
                    
                    <tr>
                        <th>地　址</th>
                        <td colspan="3">
                            <select class="easyui-combobox hy-codeselect" codetable="district" name="province" id="province" style="width: 140px;" ></select>

                            <select class="easyui-combobox hy-codeselect" name="city" codetable="district" parentobject="province" id="city" style="width: 140px;" ></select>
                            <input class="easyui-textbox" type="text" style="width: 300px;" />
                        </td>
                    </tr>

                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4">
                            <input type="button" class="btn btn-info" value="确　定" />
                            <input type="button" class="btn" value="重　置" />
                        </td>
                    </tr>
                </tfoot>
            </table>
            
            
        </form>
        <!-- 个人信息 end-->
    </div>
</div>
</body>
</html>
