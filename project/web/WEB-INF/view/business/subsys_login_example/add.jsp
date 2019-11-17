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
	<title></title>
</head>
<body>
<div class="content">
<h1 class="public-title">系统设置</h1>

    <div class="query-list" method="post" action="">
        <!-- 个人信息 begin-->
        <h2 class="fold-head">
            个人信息<span class="fold-btn"></span>
        </h2>
        <form class="fold-content" method="post" action="" id="form1">
            <table class="table-query">
                <tbody>
                    <tr>
                        <th width="15%">姓名（必录）</th>
                        <td>
                            <input id="name" class="easyui-textbox"  type="text" data-options="required:true" validType= validType="length[0,50]"/>
                        </td>
                        <th width="15%">性　别</th>
                        <td>
                            <label><input type="radio" name="sex"  checked="checked"  value="0"/>男</label>
                            <label><input type="radio" name="sex"  value="1"/>女</label>
                        </td>
                    </tr>
             
                    <tr>
                        <th>身份证号</th>
                        <td>
                            <input id="idcard" class="easyui-textbox" type="text" name="idcard" data-options="required:true,validType:'idcard'"/>
                        </td>
                        <th>网址</th>
                        <td>
                            <input id="url" class="easyui-textbox" type="text" name="url" data-options="validType:'url'"/>
                        </td>
                    </tr>
                    <tr>
                        <th>手机号</th>
                        <td>
                            <input id="mobile" class="easyui-textbox" type="text" data-options="validType:'mobile'"/>
                        </td>
                         <th>邮编</th>
                        <td>
                            <input id="postcode" class="easyui-textbox" type="text" data-options="validType:'postcode'"/>
                        </td>
                    </tr>
                    <tr>
                        <th>整数</th>
                        <td>
                            <input class="easyui-textbox" type="text" data-options="validType:'number'"/>
                        </td>
                        <th>小数【5,2】</th>
                        <td>
                            <input id="xs" class="easyui-textbox" type="text" validType="decimal[5,2]" />
                        </td>
                    </tr>
                    
                    <tr>
                        <th>固话</th>
                        <td>
                            <input class="easyui-textbox" type="text" data-options="validType:'phonenumber'"/>
                        </td>
                        
                    </tr>
                    
                    <tr>
                        <th>ip地址</th>
                        <td>
                            <input class="easyui-textbox" type="text" data-options="validType:'ipaddress'"/>
                        </td>
                        
                    </tr>
                    
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4">
                            <input type="button" class="btn btn-info" value="确　定" />
                            <input type="reset" class="btn" value="重　置"   />
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
