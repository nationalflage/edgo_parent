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
	<title>下拉码表</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;}
		.detail-list1 tbody td p{ margin-left: 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
	<div class="content">
		<h1 class="public-title"><b>下拉码表</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
	                    <tr>
	                        <td><strong>简介：</strong>普通代码表，显示codetale中的代码，例如：性别。支持多级显示。sql代码表，通过在global中配置的语句，显示查询结果数据。Json代码表，通过指定json数据，显示代码表。</td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>普通代码表</strong>
	                            <p>&lt;select class="hy-codeselect" id="cs" codetable="sex">&lt;/select></p>
	                            <p>效果预览：</p>
	                            <p><select class="hy-codeselect" id="cs" codetable="sex"></select></p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>sql代码表</strong>
	                            <p>&lt;select class="hy-codeselect" id="cs1" codetable="sys.codetable.bmtree">&lt;/select></p>
	                            <p>效果预览：</p>
	                            <p><select class="hy-codeselect" id="cs1" codetable="sys.codetable.bmtree"></select></p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>多级码表示例：</strong>
	                            <p>&lt;select class="hy-codeselect" id="ss" prompt="请选择" codetable="district">&lt;/select></p>
	                            <p>&lt;select class="hy-codeselect" id="qx" parentobject="ss" prompt="请选择" codetable="district">&lt;/select></p>
	                            <p>效果预览：</p>
	                            <p>
	                                <select class="hy-codeselect" id="ss" prompt="请选择" codetable="district"></select>
	                                <select class="hy-codeselect" id="qx" parentobject="ss" prompt="请选择" codetable="district"></select>
	                            </p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>多级码表回显示例：</strong>
	                            <p>&lt;select class="hy-codeselect"  name="appquestion" id="appquestion"  prompt="请选择"   text="011" codetable="district" required="required">&lt;/select></p>
	                            <p>&lt;select class="hy-codeselect"  name="appquestions" id="appquestions"  prompt="请选择" parentcode="011"  text="0103" required="required" codetable="district" parentobject="appquestion" >&lt;/select></p>
	                            <p>效果预览：</p>
	                            <p>
	                                <select class="hy-codeselect"  name="appquestion" id="appquestion"  prompt="请选择"   text="011" codetable="district" required="required"></select>
	                                <select class="hy-codeselect"  name="appquestions" id="appquestions"  prompt="请选择" parentcode="011"  text="110101" required="required" codetable="district" parentobject="appquestion" ></select>
	                            </p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>年度下拉示例：</strong>
	                            <p>&lt;select class="hy-codeselect" id="yearselect" codetable="year">&lt;/select></p>
	                            <p>效果预览：</p>
	                            <p>
	                                <select class="hy-codeselect" id="yearselect" codetable="year"></select>
	                            </p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>季度下拉示例：</strong>
	                            <p>&ltselect class="hy-codeselect" id="quarterselect" codetable="quarter">&lt;/select></p>
	                            <p>效果预览：</p>
	                            <p>
	                                <select class="hy-codeselect" id="quarterselect" codetable="quarter"></select>
	                            </p>
	                        </td>
	                    </tr>
						<tr>
							<td>
								<strong>必选实例</strong>
								<p>&lt;selec class="hy-codeselect"t id="sex" codetable="sex" required="1">&lt;/select></p>
								<p>效果预览：</p>
								<p><select class="hy-codeselect" id="sex" codetable="sex" required="1"></select></p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>拼音首字母搜索实例</strong>
								<p>&lt;select class="hy-codeselect" id="test" codetable="district" pinyin="1">&lt;/select></p>
								<p>效果预览：</p>
								<p><select class="hy-codeselect" id="test" codetable="district" pinyin="1"></select></p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>otherword与othername用法实例：<span class="red">otherword与othername需要一起出现，otherword里边的值必须是码表里已经有的属性值</span></strong>
								<p>&lt;select class="hy-codeselect" id="test" codetable="bmxz" otherword="食品,药品" othername="applbasque_other">&lt;/select></p>
								<p>效果预览：</p>
								<p><select class="hy-codeselect" id="test1" codetable="bmxz" otherword="食品,药品" othername="applbasque_other"></select></p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>editable测试实例</strong>
								<p>&lt;select class="hy-codeselect" id="test3" codetable="bmxz" editable="1">&lt;/select></p>
								<p>效果预览：</p>
								<p><select class="hy-codeselect" id="test3" codetable="bmxz" editable="1"></select></p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>data测试实例</strong>
								<p>&lt;select id="test5">&lt;/select></p>
								<p>
									$("#test5").codeselect({
									 data:'[{"key":"F","value":"男"},{"key":"M","value":"女"}]'
									});
								</p>
								<p>效果预览：</p>
								<p><select id="test5"></select></p>
								<script>
	                                $("#test5").codeselect({
	                                    data:'[{"key":"F","value":"男"},{"key":"M","value":"女"}]'
	                                });
								</script>
							</td>
						</tr>
						<tr>
							<td>
								<strong>url搜索实例<span class="red">(暂且不好用)</span></strong>
								<p>&lt;select class="hy-codeselect" id="test2" url="&lt;%=basePath%>demo/getHySearchData.xhtml">&lt;/select></p>
								<p>效果预览：</p>
								<p><select class="hy-codeselect" id="test2" url="<%=basePath%>demo/getHySearchData.xhtml"></select></p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>noparent测试实例<span class="red">(暂且不好用)</span></strong>
								<p>&lt;select class="hy-codeselect" id="test4" codetable="district">&lt;/select></p>
								<p>效果预览：</p>
								<p><select class="hy-codeselect" id="test4" codetable="district" noparent="1"></select></p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 属性 -->
			<div class="detail-list">
				<h3 class="title"><strong>属性</strong></h3>
				<table class="detail-list2">
					<thead>
						<tr>
							<th width="15%">属性名</th>
							<th width="15%">中文含义</th>
							<th width="5%">是否必填</th>
							<th width="10%">默认值（非必填项）</th>
							<th width="15%">值集/示例</th>
							<th width="35%">备注</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>class</td>
							<td>根据class的值判断是否为码表</td>
							<td>是</td>
							<td>hy-codeselect</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>id</td>
							<td>元素id</td>
							<td>是</td>
							<td>自定义</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>codetable</td>
							<td>码表名</td>
							<td>是</td>
							<td>对应码表名</td>
							<td></td>
							<td>如果只有此属性并且码表为多级码表（即parentcode不是null），默认查询parent是null的数据。</td>
						</tr>
						<tr>
							<td>pleaseselected</td>
							<td>显示请选择</td>
							<td>否</td>
							<td>已废弃，使用prompt代替</td>
							<td></td>
							<td>pleaseselected =1显示请选择。</td>
						</tr>
						<tr>
							<td>text</td>
							<td>回显</td>
							<td>否</td>
							<td>对应code值</td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>parentobject</td>
							<td>上级对象</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>级联码表，上级select对象的id</td>
						</tr>
						<tr>
							<td>parentcode</td>
							<td>上级代码</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>指定上级的代码，用于级联码表。<br/>
								多个用英文逗号隔开。<br/>
								示例：parentcode="1101,1102"<br/>
								在固定上级的情况下使用。例如：只显示北京市的区县，那么parentcode="010"。<br/>
								注意！！如果当前码表有上级，必须加上此值，不然会不显示码表。</td>
						</tr>
						<tr>
							<td>data</td>
							<td>json格式数据</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>prompt</td>
							<td>默认提示文本</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>例如：请选择</td>
						</tr>
						<tr>
							<td>required</td>
							<td>是否必填</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>required="1"</td>
						</tr>
						<tr>
							<td>pinyin</td>
							<td>拼音首字母搜索</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>pinyin="1"，展现形式：北京市 (BJS)</td>
						</tr>
						<tr>
							<td>otherword</td>
							<td>“其它”特殊功能</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>应用示例：otherword="其它分类,其他种类",多个用英文逗号隔开，当选择“其它分类”，或“其他种类”时，下拉框会变成可编辑状态，提示：“请输入：”，这时可以输入任何文字内容。
								多级码表中，要加在最末级。</td>
						</tr>
						<tr>
							<td>othername</td>
							<td>和otherword同时出现，用于存放选择其他的code值</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>当选择“其它”项时，下拉框的值是实际输入的文本。下拉框的code值保存在othername字段，这是个自动生成的input hidden。
								例如：othername="qita"，后台通过request.getParameter("qita")，或者model.getQita()获取“其它”选项对应的code <br>
								&lt;select class="easyui-combobox hy-codeselect" name="applbasque" id="applbasque"  codetable="wtfl" otherword="其他类型,其他类型许可询问涵" othername="applbasque_other">&lt;/select><br />
								&lt;input type="hidden" name="applbasque_other">此行代码自动生成，以此来理解表单提交applbasque_other的方式,这里的name对应othername<br />
							</td>
						</tr>
						<tr>
							<td>url</td>
							<td>通过url传入json数据</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>
								url返回数据内容为json字符串，格式：
								[{
								"code":1,
								"name":"Java"
								},
								{
								"code":1,
								"name":"C++"
								}]
							</td>
						</tr>
						<tr>
							<td>editable</td>
							<td>是否可编辑</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>默认不可编辑。editable="1"可编辑。</td>
						</tr>
						<tr>
							<td>noparent</td>
							<td>忽略码表的parentcode字段</td>
							<td>否</td>
							<td></td>
							<td></td>
							<td>显示当前码表的全部数据，即查询条件where codetable="qxdm"。</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 方法 -->
			<div class="detail-list">
				<h3 class="title"><strong>方法</strong></h3>
				<table class="detail-list2">
					<thead>
						<tr>
							<th width="10%">方法名</th>
							<th width="25%">中文含义</th>
							<th width="20%">参数</th>
							<th width="15%">返回值</th>
							<th width="30%">使用示例</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
</body>
</html>