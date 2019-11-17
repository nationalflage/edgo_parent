<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/tlds/ExtFieldTag.tld" prefix="extfield" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" >
    
	<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
	<title></title>
</head>
<body>
	<h1 class="public-title">
      	详细页面
    </h1>
   <form id="form1" class="query-list" method="post" action="" data-options="novalidate:true" >
			<table  class="table-query">
				<tr>
				<th width="15%">部门编码</th><td width="30%">
				${model.depart_code }
				<th width="15%">完整部门代码</th><td>${model.depart_code_full }</td>
				</tr>
				<tr>
				<th width="15%">部门名称</th><td width="30%">
					${model.depart_name }
				<th width="15%">部门类型</th>
				<td  width="30%">
					 ${model.depart_type =='1' ? '单位' : '部门' }
				</td>
				</tr>
				<tr>
				<th width="15%">部门层级</th><td  width="30%">
					${model.depart_level }
				</td>
				<th width="15%">上级部门id</th><td  width="30%">
					${model.depart_parent_id }
				</td>
				
				</tr>
				<tr>
				<th width="15%">所属单位</th><td  width="30%">
					${model.org_code }
				</td>
				<th width="15%">联系人</th><td  width="30%">
					${model.depart_conta_perso}
				</td>
				</tr>
				<tr>
				<th width="15%">办公电话</th><td  width="30%">
					${model.office_tel }
				</td>
				<th width="15%">传真号码</th><td  width="30%">
					${model.office_fax}
				</td>
				</tr>
				<tr>
				<th width="15%">移动电话</th><td  width="30%">
					${model.mobile }
				</td>
				<th width="15%">通讯地址</th><td  width="30%">
					${model.conta_add}
				</td>
				</tr>
				<tr>
				<th width="15%">邮政编码</th><td  width="30%">
					${model.postal_code }
				</td>
				<th width="15%">街道</th><td  width="30%">
					${model.district_code}
				</td>
				</tr>
				<tr>
				<th width="15%">顺序号</th><td  width="30%">
					${model.order_no }
				</td>
				<th width="15%">是否叶节点</th><td  width="30%">
					${model.is_leaf_node=='1' ? '是':'否'}
				</td>
				</tr>
				<tr>
				<th width="15%">层级id</th><td  width="30%">
					${model.levelid}
				</td>
				<th width="15%">是否有效</th><td  width="30%">
					${model.validity  eq 'Y'?'是' : '否'}
				</td>
				</tr>
				<tr>
				<th width="15%">创建时间</th><td  width="30%">
					<fmt:formatDate value="${model.create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<th width="15%">更新时间</th><td  width="30%">
					<fmt:formatDate value="${model.update_time}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				</tr>
				<extfield:extfield tableName="sys_right_depart" dataId="${model.depart_code}" pkName="depart_code" operateType="3"/>
			</table>

		
			<table id="tt" style="width:100%;"></table>
			<table  class="table-query">
			<tfoot>
				<tr>
				<td>
				<center>
                        <button class="btn" type="button"  onclick="javascript:location.href='<%=basePath%>depart/gotoEdit.xhtml?id=${model.depart_id }';">返回</button>
                 </center> 
				</td>
				</tr>
				</tfoot>
				</table>
		</form>
		
	<script>


	</script>
		
