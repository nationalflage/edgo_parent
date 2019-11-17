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
	<title>进度条</title>
    <style>
        .detail-list1 tbody td{color:#333;padding-top: 20px;word-break: normal;}
        .detail-list1 tbody td p{ margin: 5px 0 5px 45px;}
        .detail-list1 tbody td strong,.detail-list1 tbody td p strong{color:#999;}
    </style>
</head>
<body>
    <div class="content">
        <h1 class="public-title"><b>进度条</b></h1>
        <div class="detail">
            <!-- 基础信息 -->
            <div class="detail-list">
                <h3 class="title">基本信息</h3>
                <table class="detail-list1">
                    <tbody>
	                    <tr>
	                        <td>
	                            <strong>简介：</strong>进度条提供了一种显示长时间操作进度的反馈。进度可被更新以便让用户知道当前正在执行的操作。
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>调用方式一</strong>
	                            <p>
	                                &lt;div class="easyui-progressbar" id="p" style="width:400px;"> &lt;/div>
	                            </p>
	                            <p>效果预览：</p>
	                            <p>
	                                <a class="btn btn-info" href="#" onclick="start()">开始</a>
	                            </p>
	                            <div class="easyui-progressbar" id="p" style="width:400px;"></div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>调用方式二</strong>
	                            <p>
	                                &lt;div id="p2" style="width:400px;">&lt;/div>
	                            </p>
	                            <pre>
	    $('#p2').progressbar({
	        value: 60,
	        text:'当前进度：{value}'
	    });
								</pre>
	                            <p>效果预览：</p>
	                            <p>
	                                <div id="p2" style="width:400px;"></div>
	                            </p>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <strong>流式进度条</strong>
	                            <p>
	                                &lt;div class="easyui-progressbar" data-options="value:80" style="width:50%;"> &lt;/div>
	                            </p>
	                            <p>效果预览：</p>
	                            <p>
	                                <div class="easyui-progressbar" id="pp" data-options="value:80" style="width:50%;"></div>
	                            </p>
	
	                            <p>
	                                <input class="btn btn-info" type="button" value="设置进度条的值" onclick="setProgress()" />&nbsp;&nbsp;&nbsp;&nbsp; $("#pp").progressbar('setValue', 50);
	                            </p>
	                            <p style="margin-bottom:40px;">
	                                <input class="btn btn-info" type="button" value="获取进度条的值" onclick="getProgress()" />&nbsp;&nbsp;&nbsp;&nbsp; $('#pp').progressbar('getValue');
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
	                    <td>value</td>
	                    <td>设置进度条的当前数值</td>
	                    <td>否</td>
	                    <td>0</td>
	                    <td></td>
	                    <td>百分比值</td>
	                </tr>
	                <tr>
	                    <td>text</td>
	                    <td>显示在组件上的文本模板</td>
	                    <td>否</td>
	                    <td>{value}%</td>
	                    <td></td>
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
	                    <td>返回进度条选项</td>
	                    <td>无</td>
	                    <td></td>
	                    <td class="text-left">$(“#progressbar”).progressbar(“options”)</td>
	                </tr>
	                <tr>
	                    <td>getValue</td>
	                    <td>返回当前的进度值</td>
	                    <td>无</td>
	                    <td></td>
	                    <td class="text-left">$(“#progressbar”).progressbar(“getValue”)</td>
	                </tr>
	                <tr>
	                    <td>setValue</td>
	                    <td>设置一个新的进度值</td>
	                    <td>value</td>
	                    <td></td>
	                    <td class="text-left">$(“#progressbar”).progressbar(“setValue”,20)</td>
	                </tr>
	                <tr>
	                    <td>resize</td>
	                    <td>调整组件尺寸</td>
	                    <td>width</td>
	                    <td></td>
	                    <td class="text-left">
	                        <pre>	    
$('#p').progressbar('resize');  // 调整进度条为初始宽度
$('#p').progressbar('resize', 350);  // 调整进度条为一个新的宽度
	                        </pre>
	                    </td>
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
	                    <td>当值改变时触发。</td>
	                    <td>newValue,oldValue</td>
	                    <td class="text-left">
	                        <pre>
	    $('#p').progressbar({
	        onChange: function(value){
	            alert(value)
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
        $(function () {
            $('#p2').progressbar({
                value: 60,
                text:'当前进度：{value}'
            });
        });
        function start(){
            var value = $('#p').progressbar('getValue');
            if (value < 100){
                value += Math.floor(Math.random() * 10);
                $('#p').progressbar('setValue', value);
                setTimeout(arguments.callee, 200);
            }
        };
        function setProgress(){
            $("#pp").progressbar('setValue', 50);
        }
        function getProgress(){
            var value = $('#pp').progressbar('getValue');
            alert(value);
        }
    </script>
</body>
</html>