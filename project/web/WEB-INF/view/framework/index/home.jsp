<%@ page import="com.hyjx.framework.service.ConfigManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="theme" uri="/WEB-INF/tlds/theme.tld"%>
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
	<script type="text/javascript" src="<%=basePath%>js/echarts.min.js"></script>
<title><%= ConfigManager.getConfig("sys.title")%></title>
</head>
<body>
<form id="fJump2Login" method="post" style="display: none" action="<%=basePath %>console.xhtml"></form>
 <div class="big-bg"></div><!--固定的大背景-->
    <!-- 头部 -->
 <jsp:include page="top.jsp"></jsp:include>
 
 <!-- 一级导航 -->
 <jsp:include page="nav.jsp"></jsp:include>

    <!-- container begin -->
    <div class="container">
        <!--navigator begin-->
        <div class="nav">
            <ul>
                <li class="active" onclick=""> 
                    <img class="icon" src="<%=basePath %>images/nav-icon1.png"/>
                    <h2 class="title">个人设置</h2>
               </li>
                <li onclick=""> 
                    <img class="icon" src="<%=basePath %>images/nav-icon2.png"/>
                    <h2 class="title">日常工作</h2>
                </li>
                <li onclick=""> 
                    <img class="icon" src="<%=basePath %>images/nav-icon3.png"/>
                    <h2 class="title">特别关注</h2>
                </li>
                <li onclick=""> 
                    <img class="icon" src="<%=basePath %>images/nav-icon4.png"/>
                    <h2 class="title">企业书签</h2>
                </li>
                <li onclick=""> 
                    <img class="icon" src="<%=basePath %>images/nav-icon5.png"/>
                    <h2 class="title">统计分析</h2>
                </li>
                <li onclick=""> 
                    <img class="icon" src="<%=basePath %>images/nav-icon6.png"/>
                    <h2 class="title">个人笔记</h2>
                </li>
                <li onclick=""> 
                    <img class="icon" src="<%=basePath %>images/nav-icon7.png"/>
                    <h2 class="title">下载列表</h2>
                </li>
                <li> 
                    <img class="nav-add" src="<%=basePath %>images/nav-add.png"  onclick=""/>
                </li>
           </ul>
       </div>
       <!--navigator end-->
        
        <!-- 日常监管企业类型（图表） -->
        <div class="box float-l" style="width:60%;">
            <h2 class="public-title">
                <b>访问人数统计示例</b>
                <a class="more" href="###" style="display: none">更多</a>
            </h2>
            <div id="rschart"  style="height: 300px;width: 70%;left:100px;">
            </div>
        </div>

        <!-- 通知公告 -->
        <div class="box float-r" style="width:39%;">
            <h2 class="public-title">
                <b>日常监管企业类型统计</b>
                <a class="more" href="###">更多</a>
            </h2>
            <ul class="ul-list">
                <li>
                    <a href="###">徐柳当选团市委书记|领导班子|团代会_凤凰资讯</a>
                    <span class="date">[2-3]</span>
                </li>
                <li>
                    <a href="###">共青团深化推动春运志愿服务见成效</a>
                    <span class="date">[2-3]</span>
                </li>
                <li>
                    <a href="###">北京共青团去行政化改革 4名副书记没有行政级别</a>
                    <span class="date">[2-3]</span>
                </li>
                <li>
                    <a href="###">图解2016年北京共青团工作要点</a>
                    <span class="date">[2-3]</span>
                </li>
                <li>
                    <a href="###">北京共青团改革创新丛书出版</a>
                    <span class="date">[2-3]</span>
                </li>
                <li>
                    <a href="###">共青团二十届八次全委(扩大)会议召开</a>
                    <span class="date">[2-3]</span>
                </li>
                <li>
                    <a href="###">北京共青团改革创新丛书出版</a>
                    <span class="date">[2-3]</span>
                </li>
                <li>
                    <a href="###">共青团二十届八次全委(扩大)会议召开</a>
                    <span class="date">[2-3]</span>
                </li>
                <li>
                    <a href="###">北京共青团改革创新丛书出版</a>
                    <span class="date">[2-3]</span>
                </li>
                <li>
                    <a href="###">共青团二十届八次全委(扩大)会议召开</a>
                    <span class="date">[2-3]</span>
                </li>
            </ul>
        </div>

        <!-- 访问模块次数统计示例 -->
        <div class="box float-l" style="width:49%;">
            <h2 class="public-title">
                <b>访问模块次数统计示例</b>
                <a class="more" href="###" style="display:none;">更多</a>
            </h2>
            <div id="mkchart" style="height: 300px;width: 70%;left:100px;">
                
            </div>
        </div>

        <!-- 搜索统计 -->
        <div class="box float-r" style="width:50%;">
            <h2 class="public-title">
                <b>阶梯瀑布统计示例</b>
                <a class="more" href="###" style="display: none;">更多</a>
            </h2>
            <div id="jtpbchart" style="height: 280px;width: 90%;left:10px;">
               
            </div>
        </div>

        <!-- 查询结果列表 begin-->
        <div class="result-list" style="display: none;">
            <h1 class="title">用户操作日志</h1>
            <!-- 操作按钮 -->
<!--             <div id="tb" class="operate"> -->
<!--                 <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="javascript:alert('添加')">添加</a> -->
<!--                 <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="javascript:alert('删除')">删除</a> -->
<!--                 <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:alert('保存')">保存</a> -->
<!--             </div> -->
            <table id="tt" class="easyui-datagrid"  iconCls="icon-save" pagination="true">
               
            </table>
        </div>
        <!-- 查询结果列表 end -->
    </div>
    <!-- container end -->

<!-- 换肤按钮 begin-->
<div class="change-skin">
    <img class="button" src="images/change-skin.png"/>
    <img class="words" src="images/skin-remind.png"/>
</div>
<!-- 换肤按钮 end -->
<jsp:include page="skinlayer.jsp"></jsp:include>

</body>
</html>
<script type="text/javascript">
var dom = document.getElementById("rschart");
var myChart = echarts.init(dom);
var app = {};
option = null;
option = {
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'line'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	        data:['访问人数']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis : [
	        {
	            type : 'category',
	            data : ['周一','周二','周三','周四','周五','周六','周日']
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value'
	        }
	    ],
	    series : [
	        {
	            name:'访问人数',
	            type:'bar',
	            stack: '搜索引擎',
	            data:[62, 82, 91, 84, 109, 110, 120]
	        }
	    ]
	};
if (option && typeof option === "object") {
    var startTime = +new Date();
    myChart.setOption(option, true);
    var endTime = +new Date();
    var updateTime = endTime - startTime;
}

$.ajax({
	url:"<%=basePath%>log/",
});

var mkchartdom = document.getElementById("mkchart");
var mkchartmkchart = echarts.init(mkchartdom);
var mkchartapp = {};
mkchartoption = null;
mkchartoption = {
	    title : {
	        text: '模块访问统计',
	        subtext: '示例统计图',
	        x:'center'
	    },
	    tooltip : {
	        trigger: 'item',
	        formatter: "{a} <br/>{b} : {c} ({d}%)"
	    },
	    legend: {
	        orient: 'vertical',
	        left: 'left',
	        data: ['用户管理','部门管理','日志查看','菜单管理','首页']
	    },
	    series : [
	        {
	            name: '访问模块',
	            type: 'pie',
	            radius : '55%',
	            center: ['50%', '60%'],
	            data:[
	                {value:335, name:'用户管理'},
	                {value:310, name:'部门管理'},
	                {value:234, name:'日志查看'},
	                {value:135, name:'菜单管理'},
	                {value:1548, name:'首页'}
	            ],
	            itemStyle: {
	                emphasis: {
	                    shadowBlur: 10,
	                    shadowOffsetX: 0,
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'
	                }
	            }
	        }
	    ]
	};
if (mkchartoption && typeof mkchartoption === "object") {
    var startTime = +new Date();
    mkchartmkchart.setOption(mkchartoption, true);
    var endTime = +new Date();
    var updateTime = endTime - startTime;
}


$(function(){
	//doQuery();
});
function doQuery(){
	var data_attr = $("#form1").serialize();
	$('#tt').datagrid({
		url: '<%=basePath %>logbusiness/queryList.xhtml',
		queryParams: data_attr,
		
		singleSelect: false,
		rownumbers: true,
		
		pageNumber: 1,
		columns:[[
				{field:'oper_time',title:'操作时间',width:140},
				{field:'oper_id',title:'操作人ID',width:80},
				{field:'oper_name',title:'操作人名称',width:80},
				{field:'ip_address',title:'IP地址',width:100},
				{field:'exec_time',title:'执行时间',width:100,formatter:function(value, rowData, rowIndex){
					if(value=="" || value=="null")
						return "";
					else
						return value+"ms";
				}},
				{field:'oper_desc',title:'操作描述',width:500}
		]],
		onDblClickRow:function(index,row){
			view(row.log_id);
		}
	});	
}






var jtpbdom = document.getElementById("jtpbchart");
var jtpbchart = echarts.init(jtpbdom);
var jtpbapp = {};
jtpbchartoption = null;
jtpbchartoption = {
	    title: {
	        text: '阶梯瀑布图',
	        subtext: 'From ExcelHome',
	        sublink: 'http://e.weibo.com/1341556070/Aj1J2x5a5'
	    },
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        },
	        formatter: function (params) {
	            var tar;
	            if (params[1].value != '-') {
	                tar = params[1];
	            }
	            else {
	                tar = params[0];
	            }
	            return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value;
	        }
	    },
	    legend: {
	        data:['支出','收入']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis: {
	        type : 'category',
	        splitLine: {show:false},
	        data :  function (){
	            var list = [];
	            for (var i = 1; i <= 11; i++) {
	                list.push('11月' + i + '日');
	            }
	            return list;
	        }()
	    },
	    yAxis: {
	        type : 'value'
	    },
	    series: [
	        {
	            name: '辅助',
	            type: 'bar',
	            stack: '总量',
	            itemStyle: {
	                normal: {
	                    barBorderColor: 'rgba(0,0,0,0)',
	                    color: 'rgba(0,0,0,0)'
	                },
	                emphasis: {
	                    barBorderColor: 'rgba(0,0,0,0)',
	                    color: 'rgba(0,0,0,0)'
	                }
	            },
	            data: [0, 900, 1245, 1530, 1376, 1376, 1511, 1689, 1856, 1495, 1292]
	        },
	        {
	            name: '收入',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'top'
	                }
	            },
	            data: [900, 345, 393, '-', '-', 135, 178, 286, '-', '-', '-']
	        },
	        {
	            name: '支出',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'bottom'
	                }
	            },
	            data: ['-', '-', '-', 108, 154, '-', '-', '-', 119, 361, 203]
	        }
	    ]
	};
option = {
	    title: {
	        text: '阶梯瀑布图',
	        subtext: 'From ExcelHome',
	        sublink: 'http://e.weibo.com/1341556070/Aj1J2x5a5'
	    },
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        },
	        formatter: function (params) {
	            var tar;
	            if (params[1].value != '-') {
	                tar = params[1];
	            }
	            else {
	                tar = params[0];
	            }
	            return tar.name + '<br/>' + tar.seriesName + ' : ' + tar.value;
	        }
	    },
	    legend: {
	        data:['支出','收入']
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
	        bottom: '3%',
	        containLabel: true
	    },
	    xAxis: {
	        type : 'category',
	        splitLine: {show:false},
	        data :  function (){
	            var list = [];
	            for (var i = 1; i <= 11; i++) {
	                list.push('11月' + i + '日');
	            }
	            return list;
	        }()
	    },
	    yAxis: {
	        type : 'value'
	    },
	    series: [
	        {
	            name: '辅助',
	            type: 'bar',
	            stack: '总量',
	            itemStyle: {
	                normal: {
	                    barBorderColor: 'rgba(0,0,0,0)',
	                    color: 'rgba(0,0,0,0)'
	                },
	                emphasis: {
	                    barBorderColor: 'rgba(0,0,0,0)',
	                    color: 'rgba(0,0,0,0)'
	                }
	            },
	            data: [0, 900, 1245, 1530, 1376, 1376, 1511, 1689, 1856, 1495, 1292]
	        },
	        {
	            name: '收入',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'top'
	                }
	            },
	            data: [900, 345, 393, '-', '-', 135, 178, 286, '-', '-', '-']
	        },
	        {
	            name: '支出',
	            type: 'bar',
	            stack: '总量',
	            label: {
	                normal: {
	                    show: true,
	                    position: 'bottom'
	                }
	            },
	            data: ['-', '-', '-', 108, 154, '-', '-', '-', 119, 361, 203]
	        }
	    ]
	};

if (jtpbchartoption && typeof jtpbchartoption === "object") {
    var startTime = +new Date();
    jtpbchart.setOption(jtpbchartoption, true);
    var endTime = +new Date();
    var updateTime = endTime - startTime;
}
if(top.location!==self.location){
	top.location.href=self.location.href;
}
function jumpToLogin(){
    try{
        //$.hyjx.alert("系统信息","会话超时，您已登出系统。");
        $("#fJump2Login").submit();
    }catch (e){
        console.log(e.message);
    }
}
</script>