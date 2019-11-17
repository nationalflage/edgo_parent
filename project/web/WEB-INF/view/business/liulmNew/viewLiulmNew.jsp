<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	<table  class="table-query">
		<tbody>
			<tr>
				<th>姓名：</th>
				<td>
					${model.name }
				</td>
				<th>性别：</th>
				<td>
					${model.sex }
				</td>
			</tr>
			<tr>
				<th>年龄：</th>
				<td>
					${model.age }
				</td>
				<th>出生日期：</th>
				<td>
					${model.birthday }
				</td>
			</tr>
			<tr>
				<th>出生省：</th>
				<td>
					${model.csdProvince }
				</td>
				<th>出生市：</th>
				<td>
					${model.csdCity }
				</td>
			</tr>
			<tr>
				<th>出生区：</th>
				<td>
					${model.csdArea }
				</td>
				<th>具体门牌号：</th>
				<td>
					${model.csdAddress }
				</td>
			</tr>
			<tr>
				<th>部门名称：</th>
				<td>
					${model.deptName }
				</td>
				<th>爱好：</th>
				<td>
					${model.hobby }
				</td>
			</tr>
			<tr>
				<th>创建人姓名：</th>
				<td>
					${model.createdName }
				</td>
				<th>创建人部门名称：</th>
				<td>
					${model.createdDeptName }
				</td>
			</tr>
			<tr>
				<th>擅长领域：</th>
				<td>
					${model.scly }
				</td>
			</tr>
		</tbody>
		<tfoot>
           <tr height="100">
               <td colspan="4">
                   <input type="button" class="btn" value="关　闭" onclick="window.parent.closeWin('信息详细')"/>
               </td>
           </tr>
       </tfoot>
	</table>
</body>
</html>