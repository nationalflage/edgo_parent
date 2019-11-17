<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String webapp = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	    <title>在线Word模板</title>
	</head>
	
    <script type="text/javascript" language="javascript" src="./edrawoffice.js"></script>
    <script type="text/javascript" language="javascript">
    	function fn_create(){
			document.all.OA1.CreateNew("Word.Application");
    	}
    	
    	function OpenFromLocal() {
            document.all.OA1.OpenFileDialog(".doc");
            if (document.all.OA1.GetCurrentProgID() != "PowerPoint.Application") {
                if (document.all.OA1.IsOpened()) {
                    var x = document.OA1.Toolbars;
                    document.OA1.Toolbars = !x;
                }
            }                        
        }
    	
    	
		function fn_load() {
			if(!'${trackdataFileName}'.length > 0){
				document.all.OA1.CreateNew("Word.Application");
			}else{
            	document.all.OA1.Open("<%=webapp%>/webword/webwordAction!makeword.dhtml?dataMap['TYPE']=worddep&dataMap['TEPID']=${dataMap['TEPID']}&trackdataFileName=word.doc");
            }
        }
		
		function fn_save(){
			$.ajax({
			url: "<%=webapp%>/webword/webwordAction!saveWordTemplateOther.dhtml",
			type: 'post',
			data: $("#form1").serialize(),
			async: true,
			success: function(request, status) {
				if(request) {
					if (document.OA1.IsOpened) {
					    document.OA1.SetAppFocus();
					    document.OA1.HttpInit();
					    document.OA1.HttpAddPostOpenedFile("${dataMap['TEPID']}.doc");
					    document.OA1.HttpPost("<%=webapp%>/webword/webwordAction!saveWordTemplate.dhtml");
					    if (document.OA1.GetErrorCode() == 0) {
					    	alert("提示：保存成功!\n\n模板访问地址:<%=webapp%>/webword/webwordAction!openWordTemplate.dhtml?dataMap['TEPID']=${dataMap['TEPID']}");
					    }
					}else {
					    window.alert("提示：您word文件没有打开，不能保存!");
					}
				} 
			},
			error: function(request, status){
				alert("提示：保存失败!")
			}
			});
		}
		
		

        function CloseDoc() {
            if (document.OA1.IsOpened) {
                document.all.OA1.CloseDoc();
            }
        }
        
        //复制行 
		function addTr() {
			var table = $("#copy_table");
			var size = parseInt(table.find("#maxSize").val());
			if(size == 0)
				size = 1;
			var trs = table.find("tr");
			
			var tr = trs.eq(trs.size()-1);
			var ctr = tr.clone(true);
			ctr.find("input,textarea,select").each(function() {
				var $th = $(this);
				var tem = $th.attr('name');
				var qs = tem.substring(0,tem.lastIndexOf("[")+1);
				var hs = tem.substring(tem.lastIndexOf("]"));
				var name = qs+size+hs;
				if($th.attr('type') != 'checkbox') {
					$th.val('');
				}
				if(name.lastIndexOf("VALID") == -1){
					$th.removeAttr('checked')
				}
				$th.attr("name", name);
			});
			
			table.find("#maxSize").val(size+1);
			ctr.appendTo(table);
		}
        //删除行 
		function deleteTr(th) {
			var table = $("#copy_table");
			if(table.find("tr").size() <= 2) {
				alert("至少一条数据。");
				return false;
			}
			$(th).parent().parent().remove();
		}
    </script>
	<body onload="fn_load();" style="margin: 0;padding:0;">
	<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr>
		<td width="60%">
			<div>
				<object classid="clsid:7677E74E-5831-4C9E-A2DD-9B1EF9DF2DB4" id="OA1" width="100%" height="100%" codebase="<%=webapp %>/common/webword/officeviewer.cab#7,4,0,236">
					<param name="Toolbars" value="-1">
					<param name="LicenseName" value="30daytrial">
					<param name="LicenseCode" value="EDWD-3333-2222-1111">
					<param name="BorderColor" value="15647136">
					<param name="BorderStyle" value="2">
				</object>
			</div>
		</td>
		<td valign="top" style="padding-top:20px">
		<form id = "form1">
				<h1 align="center">模板信息编护维</h1>
				<table width="100%">
					<tr>
						<td align="right">模板名称:</td>
						<td colspan="3">
							<input type="hidden"; name="dataMap['TEPID']" value="${dataMap['TEPID']}"/>
							<input type="text"; name="dataMap['TEPNAME']" value ="${dataMap['TEPNAME']}" style="width:100%"/>
						</td>
					</tr>
					<tr>
						<td align="right">模板分类名称:</td>
						<td colspan="3"><input type="text"; name="dataMap['TEPCATEGORY']" value="${dataMap['TEPCATEGORY']}" style="width:100%"/></td>
					</tr>
					<tr>
						<td align="right">模板全局变量:</td>
						<td>
							<input type="text"; name="dataMap['TEPVAR']" value="${dataMap['TEPVAR']}" style="width:120px"/>
						</td>
						<td align="right">有效性:</td>
						<td>
							<input type="radio" name="dataMap['TEPISVALID']" id="dataMap_TEPISVALID_Y" value="Y" ${dataMap['TEPISVALID']=='Y'||dataMap['TEPISVALID']==null ? 'checked' : ''}><label for="dataMap_TEPISVALID_Y" />有效</label>
							<input type="radio" name="dataMap['TEPISVALID']" id="dataMap_TEPISVALID_N" value="N" ${dataMap['TEPISVALID']=='N' ? 'checked' : ''}><label for="dataMap_TEPISVALID_N" />无效</label>
						</td>
					</tr>
					<tr>
						<td align="right">备注:</td>
						<td colspan="3">
							<textarea name ="dataMap['TEPREMARK']" style="width:100%" rows="2">${dataMap['TEPREMARK']}</textarea>
						</td>
					</tr>
					<tr>
					<td colspan="4">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="4">
							<table width="100%" id="copy_table">
								<tr>
									<td align="center" colspan="2">数据源名称<input type="hidden" id="maxSize" value="${fn:length(dataMap['WTS'])}"/></td>
									<td align="center">数据名称SQL</td>
									<td align="center">行数</td>
									<td align="center">备注</td>
									<td align="center"><a href="javascript:addTr()">添加</a></td>
								</tr>
								 <c:forEach var="WTS" items="${dataMap['WTS']}" varStatus="status">
								<tr>
									<td align="center" width="60px">
										<label><input type="checkbox" name="datasrcList[${status.index}].TEPDSMAIN" value="Y" ${WTS.TEPDSMAIN=='Y' ? 'checked' : ''} />主表</label><br/>
										<label><input type="checkbox" name="datasrcList[${status.index}].TEPDSVALID" value="Y" ${WTS.TEPDSVALID=='Y' ? 'checked' : ''} />有效</label>
									</td>
									<td align="center" width="80px"><textarea name="datasrcList[${status.index}].TEPDSNAME" style="width:100%;" rows="2">${WTS.TEPDSNAME}</textarea></td>
									<td align="center"><textarea name="datasrcList[${status.index}].TEPDSSQL" style="width:100%;" rows="2">${WTS.TEPDSSQL}</textarea></td>
									<td align="center" width="40px"><textarea name="datasrcList[${status.index}].TEPDSROWS" style="width:100%;" rows="2">${WTS.TEPDSROWS}</textarea></td>
									<td align="center" width="80px"><textarea name="datasrcList[${status.index}].TEPDSREMARK" style="width:100%;" rows="2">${WTS.TEPDSREMARK}</textarea></td>
									<td align="center" width="34px"><a href="javascript:void(0)" onclick="deleteTr(this)">删除</a></td>
								</tr>
								</c:forEach>
								<c:if test="${fn:length(dataMap['WTS'])==0}">
								<tr>
									<td align="center" width="60px">
										<label><input type="checkbox" name="datasrcList[0].TEPDSMAIN" value="Y" checked />主表</label><br/>
										<label><input type="checkbox" name="datasrcList[0].TEPDSVALID" value="Y" checked />有效</label>
									</td>
									<td align="center" width="80px"><textarea name="datasrcList[0].TEPDSNAME" style="width:100%;" rows="2">${WTS.TEPDSNAME}</textarea></td>
									<td align="center"><textarea name="datasrcList[0].TEPDSSQL" style="width:100%;" rows="2">${WTS.TEPDSSQL}</textarea></td>
									<td align="center" width="40px"><textarea name="datasrcList[0].TEPDSROWS" style="width:100%;" rows="2">0</textarea></td>
									<td align="center" width="80px"><textarea name="datasrcList[0].TEPDSREMARK" style="width:100%;" rows="2">${WTS.TEPDSREMARK}</textarea></td>
									<td align="center" width="34px"><a href="javascript:void(0)" onclick="deleteTr(this)">删除</a></td>
								</tr>
								</c:if>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="4" align="center">
							<br>
							<a href="<%=webapp%>/webword/webwordAction!openWordTemplate.dhtml" />新建模板</a>&nbsp;&nbsp;&nbsp;
							<a href="javascript:OpenFromLocal();" />载入本地WORD</a><br><br>
							<input type="button" style="width:150px;height:50px" onclick="fn_save()" value="保存模板">
						</td>
					</tr>
				</table>
		</form>
		</td>
		</tr>
	</table>
</body>
</html>
