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
	<title>滑块</title>
	<style>
		.detail-list1 tbody td{color:#333;padding-top: 20px;word-break: normal;}
		.detail-list1 tbody td p{ margin:5px 0 5px 45px;}
		.detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
	</style>
</head>
<body>
    <div class="content">
		<h1 class="public-title"><b>滑块</b></h1>
		<div class="detail">
			<!-- 基础信息 -->
			<div class="detail-list">
				<h3 class="title">基本信息</h3>
				<table class="detail-list1">
					<tbody>
						<tr>
							<td>
								<strong>简介：</strong>滑块（slider）允许用户从一个有限的范围内选择一个数值。当沿着轨道移动滑块控件时，将显示一个表示当前值的提示框，用户可通过设置它的属性来自定义滑块。
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式一</strong>
								<p>
									&lt;input class="easyui-slider" data-options="showTip:true,rule: [0,'|',25,'|',50,'|',75,'|',100]">
								</p>
								<p>效果预览：</p>
	                            <p style="margin-top: 20px;margin-bottom: 20px;">
									<input class="easyui-slider" data-options="showTip:true,rule: [0,'|',25,'|',50,'|',75,'|',100]" style="width: 300px;">
								</p>
							</td>
						</tr>
						<tr>
							<td>
								<strong>调用方式二</strong>
								<p>
									&lt;input id="ss" style="height:150px" />
								</p>
								<pre>
		$('#ss').slider({
			mode: 'v',
			showTip:true,
			rule: [0,'|',25,'|',50,'|',75,'|',100],
			tipFormatter: function(value){
				return value + '%';
			}
		});
								</pre>
								<p>效果预览：</p>
	                            <p style="margin-top: 20px;margin-bottom: 20px;">
									<input id="ss" style="height:150px" />
								</p>
							</td>
						</tr>
	                    <tr>
	                        <td>
	                            <strong>对调最大最小值</strong>
	                            <p>
	                                &lt;input class="easyui-slider" data-options="reversed:true,showTip:true,step:10">
	                            </p>
	                            <p>效果预览：</p>
	                            <p style="margin-top: 20px;margin-bottom: 20px;">
	                                <input class="easyui-slider" data-options="reversed:true,showTip:true,step:10" style="width: 300px;">
	                            </p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>滑块操作</strong>
	                            <p>
	                                &lt;input class="easyui-slider" data-options="min:-100,max:100,rule: [-100,-50,0,50,100]" />
	                            </p>
	                            <p>效果预览：</p>
	                            <p style="margin-top: 20px;margin-bottom:20px;">
	                                <input class="easyui-slider" id="slider" data-options="min:-100,max:100,rule: [-100,-50,0,50,100]" style="width: 300px;">
	                            </p>
	                            <p>
	                                <input class="btn btn-info" type="button" value="获取值" onclick="getVal()" />&nbsp;&nbsp;&nbsp;&nbsp;$("#slider").slider("getValue");
	                            </p>
	                            <p>
	                                <input class="btn btn-info" type="button" value="设置值" onclick="setVal()"/>&nbsp;&nbsp;&nbsp;&nbsp;$("#slider").slider("setValue",75);
	                            </p>
	                            <p>
	                                <input class="btn btn-info" type="button" value="销毁滑块" onclick="destroy()" />&nbsp;&nbsp;&nbsp;&nbsp;$("#slider").slider("destroy");
	                            </p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>禁用滑块</strong>
	                            <p>
	                                &lt;input class="easyui-slider" data-options="disabled:true,rule: [0,'|',25,'|',50,'|',75,'|',100]">
	                            </p>
	                            <p>效果预览：</p>
	                            <p style="margin-top: 20px;margin-bottom: 20px;">
	                                <input class="easyui-slider" data-options="disabled:true,rule: [0,'|',25,'|',50,'|',75,'|',100]" style="width: 300px;">
	                            </p>
	                        </td>
	                    </tr>
					</tbody>
				</table>
			</div>
        </div>
        <!-- 属性 -->
        <div class="detail-list">
            <h3 class="title"><strong>属性</strong></h3>
            <table class="detail-list2">
                <thead>
	                <tr>
	                    <th width="15%">属性名</th>
	                    <th width="15%">中文含义</th>
	                    <th width="10%">是否必填</th>
	                    <th width="15%">默认值（非必填项）</th>
	                    <th width="25%">值集/示例</th>
	                    <th width="20%">备注</th>
	                </tr>
                </thead>
                <tbody>
	                <tr>
	                    <td>mode</td>
	                    <td>滑块的类型</td>
	                    <td>否</td>
	                    <td>h</td>
	                    <td>h/v</td>
	                    <td>可能的值：'h'(horizontal)、'v'(vertical)。</td>
	                </tr>
	                <tr>
	                    <td>reversed</td>
	                    <td>滑块的类型</td>
	                    <td>否</td>
	                    <td>false</td>
	                    <td>true/false</td>
	                    <td>当设置为 true 时，将会对调最小值和最大值的位置。</td>
	                </tr>
	                <tr>
	                    <td>showTip</td>
	                    <td>定义是否显示值信息提示框</td>
	                    <td>否</td>
	                    <td>false</td>
	                    <td>true/false</td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td>disabled</td>
	                    <td>定义是否禁用滑块</td>
	                    <td>否</td>
	                    <td>false</td>
	                    <td>true/false</td>
	                    <td></td>
	                </tr>
	                <tr>
	                    <td>value</td>
	                    <td>当前的value值</td>
	                    <td>否</td>
	                    <td>0</td>
	                    <td></td>
	                    <td>数字</td>
	                </tr>
	                <tr>
	                    <td>min</td>
	                    <td>允许的最小值。</td>
	                    <td>否</td>
	                    <td>0</td>
	                    <td></td>
	                    <td>数字</td>
	                </tr>
	                <tr>
	                    <td>max</td>
	                    <td>允许的最大值。</td>
	                    <td>否</td>
	                    <td>100</td>
	                    <td></td>
	                    <td>数字</td>
	                </tr>
	                <tr>
	                    <td>step</td>
	                    <td>增加或减少的值。</td>
	                    <td>否</td>
	                    <td>1</td>
	                    <td></td>
	                    <td>数字</td>
	                </tr>
	                <tr>
	                    <td>rule</td>
	                    <td>在滑块旁边显示标签，'|' — 值显示线。</td>
	                    <td>否</td>
	                    <td></td>
	                    <td>[0,'|',25,'|',50,'|',75,'|',100]</td>
	                    <td>数组</td>
	                </tr>
	                <tr>
	                    <td>tipFormatter</td>
	                    <td>格式化滑块值的函数。返回作为提示框显示的字符串值。</td>
	                    <td>否</td>
	                    <td></td>
	                    <td>
	                        tipFormatter: function(value){
	                        return value + '%';
	                        }
	                    </td>
	                    <td></td>
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
				<tbody>
					<tr>
						<td>options</td>
						<td>返回滑块选项</td>
						<td>无</td>
						<td></td>
						<td class="text-left">$(“#slider”).slider(“options”)</td>
					</tr>
	                <tr>
	                    <td>getValue</td>
	                    <td>获取滑块的值。</td>
	                    <td>无</td>
	                    <td></td>
	                    <td class="text-left">$(“#slider”).slider(“getValue”)</td>
	                </tr>
	                <tr>
	                    <td>setValue</td>
	                    <td>设置滑块的值。</td>
	                    <td>value</td>
	                    <td></td>
	                    <td class="text-left">$(“#slider”).slider(“setValue”,20)</td>
	                </tr>
	                <tr>
	                    <td>destroy</td>
	                    <td>销毁滑块</td>
	                    <td>无</td>
	                    <td></td>
	                    <td class="text-left">$(“#slider”).slider(“destroy”)</td>
	                </tr>
				</tbody>
			</table>
		</div>
        <!-- 事件 -->
        <div class="detail-list">
            <h3 class="title"><strong>事件</strong></h3>
            <table class="detail-list2">
                <thead>
	                <tr>
	                    <th width="10%">事件名</th>
	                    <th width="35%">中文含义</th>
	                    <th width="20%">参数</th>
	                    <th width="35%">使用示例</th>
	                </tr>
                </thead>
                <tbody>
	                <tr>
	                    <td>onChange</td>
	                    <td>当文本域的值改变时触发。。</td>
	                    <td>newValue,oldValue</td>
	                    <td class="text-left">
							<pre>
$('#slider').slider({
	onChange: function(newValue,oldValue){
		alert(newValue);
	}
});
							</pre>
	                    </td>
	                </tr>
	                <tr>
	                    <td>onSlideStart</td>
	                    <td>当开始拖拽滑块时触发</td>
	                    <td>value</td>
	                    <td class="text-left">
							<pre>
$('#slider').slider({
	onSlideStart: function(value){
		alert(value);
	}
});
							</pre>
	                    </td>
	                </tr>
	                <tr>
	                    <td>onSlideEnd</td>
	                    <td>当停止拖拽滑块时触发。</td>
	                    <td>value</td>
	                    <td class="text-left">
							<pre>
$('#slider').slider({
	onSlideEnd: function(value){
		alert(value);
	}
});
							</pre>
	                    </td>
	                </tr>
                </tbody>
            </table>
        </div>
	</div>
	<script>
        $(function(){
            $('#ss').slider({
                mode: 'v',
                showTip:true,
                rule: [0,'|',25,'|',50,'|',75,'|',100],
                tipFormatter: function(value){
                    return value + '%';
                }
            });
        });
        function getVal() {
            var val=$("#slider").slider("getValue");
            alert(val);
        }
        function setVal() {
            $("#slider").slider("setValue",75);
        }
        function destroy() {
            $("#slider").slider("destroy");
        }
	</script>
</body>
</html>