//document.write("<script type='text/javascript' src='"+baseUrl+"/js/easyui/jquery.easyui.min.js'");

function getprojectNameuri()
{
	return baseUrl;
}

var innerCallback;
var ck;
var processingWindowRestore;
var tmp_obj_id;

//打开窗口
function openWinW2(URL,winName,winWidth,winHeight,isMax,isMin,callbackMethod,isManyWin){

	if(isManyWin==undefined){
        isManyWin=false;
	}
    isManyWin=!isManyWin;
    innerCallback=callbackMethod;
	if(winName == null) {
		winName = "";
	}
	if(!isMin) {
		isMin = false;
	}
	if($("#win_div_"+winName).size() > 0) {
		$("#win_div_"+winName).window('close');
		$("#win_iframe_"+winName).remove();
		$("#win_div_"+winName).remove();
	}
	var boardDiv = "<div id=\"win_div_"+winName+"\" class=\"easyui-window \" title=\"My Window\" style=\"width:"+winWidth+";height:"+winHeight+";padding:0px;background: #fafafa;overflow:hidden;\">" +
			"<\/div>";
	$(document.body).append(boardDiv);
	var boardIframe = "<iframe class=\"hyjx-iframe\" id=\"win_iframe_"+winName+"\" src=\""+URL+"\" frameborder=\"no\" border=\"0\" marginwidth=\"0\" marginheight=\"0\" style=\"width:100%;height:100%\" ></iframe>";
	$("#win_div_"+winName).html(boardIframe);
	$("#win_div_"+winName).window({title:winName,shadow: isManyWin, modal: isManyWin,maximizable:isMax,minimizable:isMin,onResize:function(){
		if($("#win_iframe_"+winName).contents().find(".datagrid-f").length > 0)
		{
			$("#win_iframe_"+winName)[0].contentWindow.openwinresize();
		}
    },onMinimize: function () {
        if(!isManyWin ) {
            $(this).parent('.panel.window').css("z-index", 1000);

            var winCount=0;
            var openedWin=$("#openedWindowDropMenu");

			var winZIndex=0;
			var maxName="";
			openedWin.find("li").each(function () {
				var winName = $(this).text();

				var windowObj=$("#win_div_"+winName);
				var winDiv=windowObj.parent('.panel.window');
				var currentZIndex=winDiv.css("z-index");
				if(currentZIndex>winZIndex){
					winZIndex=currentZIndex;
					maxName=winName;
				}
			})
			activeWindow(maxName);
        }
    },onOpen:function () {
    	if(!isManyWin ){
            var openedWin=$("#openedWindowDropMenu");
            if(openedWin.length >0){
                if(processingWindowRestore){
                    openedWin.find("li").each(function () {
                        var openName = $(this).text();
                        if(openName == winName){
                            $(this).addClass('active').siblings().removeClass('active');
                        }
                    })
                }else {
                    var winCount=0;
                    openedWin.find("li").each(function () {
                        var openName = $(this).text();
                        if(openName == winName){
                            $(this).remove();   //避免已打开或重名的窗口多次添加到列表中
                        }else{
                            winCount++;
                        }
                    })

                    if(winCount>8){
                        //如果已经打开了9个，则把已打开的第一个窗口关掉
                        var firstWinName=$('#openedWindowDropMenu').find("li:first").text();
                        $("#win_div_"+firstWinName).window('close');
                        $("#win_iframe_"+firstWinName).remove();
                        $("#win_div_"+firstWinName).remove();
                        winCount--;
                    }

                    //找到了该ul对象
                    var appendObj=$("<li title=\""+winName+"\" >"+winName+"</li>");
                    appendObj.appendTo(openedWin);
                    appendObj.addClass('active').siblings().removeClass('active');
                    openedWin.parent().css("display","");

                    winCount++;
                    $("#openedWindowNumber").html(winCount);
                }
            }
        }
    }, onClose:function(){
        $("#win_iframe_"+winName).remove();
        $("#win_div_"+winName).remove();

        var winCount=0;
        var openedWin=$("#openedWindowDropMenu");
        //louhx 从已打开窗口列表中移除当前关闭的窗口名称
        openedWin.find("li").each(function () {
            var openName = $(this).text();
            if(openName == winName){
                $(this).remove();
            }else{
                winCount++;
            }
        })

        if(winCount==0){
            var windowBox=$("#dropdown-toggle-index");
            if(windowBox.length >0){
				$('.dropdown-toggle').toggleClass('active');
				//$('.dropdown-toggle').find('.dropdown-menu').slideToggle();
                $('.dropdown-toggle').css('display','none');
            }
        }else{
            $("#openedWindowNumber").html(winCount);

            var winZIndex=0;
            var maxName="";
            openedWin.find("li").each(function () {
                var winName = $(this).text();

                var windowObj=$("#win_div_"+winName);
                var winDiv=windowObj.parent('.panel.window');
                var currentZIndex=winDiv.css("z-index");
                if(currentZIndex>winZIndex){
                    winZIndex=currentZIndex;
                    maxName=winName;
                }
            })
            activeWindow(maxName);
        }
    }});

    if(!isManyWin){
        $("#win_div_"+winName).prev().find(".panel-title:first").on("click",function () {
			var title=$(this).text();
            activeMenu(title);
        });
    }
}
function activeMenu(title) {

}
function activeWindow(maxName){

}

function openWinW(URL,winName,winWidth,winHeight,isMax,isMin,isManyWin)
{
	if(top.openWinW2==undefined)
		openWinW2(URL,winName,winWidth,winHeight,isMax,isMin,null,isManyWin);
	else
		top.openWinW2(URL,winName,winWidth,winHeight,isMax,isMin,null,isManyWin);
}
function openWinCallback(URL,winName,winWidth,winHeight,isMax,isMin,callbackMethod)
{
	top.openWinW2(URL,winName,winWidth,winHeight,isMax,isMin,callbackMethod);
}

function reloadRightframeDatagrid(tt)
{
	parent.rightFrame.$('#'+tt).datagrid("reload");
}
function closeWin(winName){
	var len= arguments.length;
	if(innerCallback!=null)
	{
		if(len==1){

		}else if(len==2){
			innerCallback.call(this,arguments[0],arguments[1]);
		}else if(len==3){
			innerCallback.call(this,arguments[0],arguments[1],arguments[2]);
		}else if(len==4){
			innerCallback.call(this,arguments[0],arguments[1],arguments[2],arguments[3]);
		}
	}
	if(winName == null) {
		winName = "";
	}
	$("#win_div_"+winName).window('close');
	$("#win_iframe_"+winName).remove();
	$("#win_div_"+winName).remove();
	innerCallback=null;
}

function getexportdatauri()
{
    return baseUrl+"common/doExcelExport.xhtml";
}

//导出当前页数据
function exportpagedata(obj)
{
    var url=getexportdatauri();
    var tab= obj.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.childNodes[0].childNodes[2];
    var tableId=tab["id"];
    var opts = $('#'+tableId).datagrid('options');
    var columns=opts["columns"];
    var exportDataInfo=opts["exportDataInfo"];

    var data=JSON.stringify($('#'+tableId).datagrid('getData'));
    var paramdata=JSON.stringify({columns:columns,exportDataInfo:exportDataInfo});

    var form = $("<form>");
    form.attr('style', 'display:none');
    form.attr('target', '_self');
    form.attr('method', 'post');
    form.attr('action', url);

    var input1 = $('<input>');
    input1.attr('type', 'hidden');
    input1.attr('name', 'paramdata');
    input1.attr('value', paramdata);

    var input2 = $('<input>');
    input2.attr('type', 'hidden');
    input2.attr('name', 'data');
    input2.attr('value', data);

    $('body').append(form);
    form.append(input1);
    form.append(input2);

    form.submit();
    form.remove();
}

//导出所有数据
function exportalldata(obj)
{
    var url=getexportdatauri();
    var tab= obj.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.childNodes[0].childNodes[2];
    var tableId=tab["id"];
    var opts = $('#'+tableId).datagrid('options');
    var dataurl=opts["url"];
    var queryParams=opts["queryParams"];
    var columns=opts["columns"];
    var paramdata=JSON.stringify({columns:columns});

    var paramdata={page:'1',rows:'999999'};
    var arr=queryParams.split("&");
    for(var item in arr){
        if(typeof item  === 'string'){
            var itemstring=decodeURIComponent(arr[item]);
            var pos=itemstring.indexOf("=");
            var kk=itemstring.substring(0,pos);
            var vv=itemstring.substring(pos+1);

            if(paramdata.hasOwnProperty(kk)){
                paramdata[kk]=paramdata[kk]+','+vv;
            }else{
                paramdata[kk]=vv;
            }
        }
    }

    $.ajax({
        type: "POST",
        url: dataurl,
        data:paramdata,
        success: function(result){
            var form = $("<form>");
            form.attr('style', 'display:none');
            form.attr('target', '_self');
            form.attr('method', 'post');
            form.attr('action', url);
            form.attr('enctype','multipart/form-data');

            var input1 = $('<input>');
            input1.attr('type', 'hidden');
            input1.attr('name', 'paramdata');

            var v1=JSON.stringify({columns:columns});
            input1.attr('value', v1);

            var input2 = $('<input>');
            input2.attr('type', 'hidden');
            input2.attr('name', 'data');
            var v2=JSON.stringify(result);
            input2.attr('value',v2);

            $('body').append(form);
            form.append(input1);
            form.append(input2);

            form.submit();
            form.remove();
        }
    });
}


var arry = [];

function getOptionsi(id){

    for(var i=0;i<arry.length;i++){
        if(id==arry[i].id){
            return arry[i];
        }
    }
}

$(function() {
	$(".hy-usertree").each(function() {
		$(this).usertree();
	});
	$(".hy-userlayer").each(function() {
		$(this).userlayer();
	});
	$(".hy-menutree").each(function(i){
		$(this).menutree();
	});
	$(".hy-menunav").each(function() {
		$(this).menunav();
	});
	$(".hy-pagemenu").each(function() {
		$(this).pagemenu();
	});
	$(".hy-pagemenu2").each(function() {
		$(this).pagemenu2();
	});
	$(".hy-echarts").each(function() {
		$(this).echarts();
	});
	$(".hy-cutscreen").each(function() {
		$(this).cutscreen();
	});
	$(".hy-searchselect").each(function() {
		$(this).searchselect();
	});
	$(".hy-print").each(function() {
		$(this).print();
	});

	$(".hy-richtext").each(function() {
		$(this).richtext();
	});
	$(".hy-orgtree").each(function() {
		$(this).orgtree();
	});
	$(".hy-radio").each(function() {
		$(this).radio();
	});
	$(".hy-checkbox").each(function() {
		$(this).checkbox();
	});
	$(".hy-wordviewer").each(function() {
		$(this).wordviewer();
	});
		
	$(".hy-codeselect").each(function() {
		$(this).codeselect();
	});
    $(".hy-imageupload").each(function() {
        $(this).imageupload();
    });
    $(".hy-imgupload").each(function() {
        $(this).imgupload();
    });
	$(".hy-attupload").each(function() {
		$(this).attupload();
	});
	$(".hy-searchinput").each(function() {
		$(this).searchinput();
	});

	$(".hy-qrcode").each(function(){
		$(this).qrcode();
	});
	$(".hy-exportword").each(function(){
		$(this).exportword();
	});
	$(".hy-exportpdf").each(function(){
		$(this).exportpdf();
	});
	$(".hy-checkcode").each(function(){
		$(this).checkcode();
	});
	$(".hy-departselwin").each(function(){
		$(this).departselwin();
	});
	$(".hy-h5imgcompress").each(function(){
		$(this).h5imgcompress();
	});
	$(".hy-swfimgcompress").each(function(){
		$(this).swfimgcompress();
	});
});

(function($) {
	/**
	 * 用户树
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.usertree = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.usertree.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "usertree");
			var defaults = {
				departtype:"2",
				multiselect:"0",
				checkedvalue:"",
				rootid:"",
				isreadonly:"0"
			};
			var opts;
			if (cData) {
				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},defaults,
					$.fn.usertree.parseOptions(this), methodName);
			}

			usertreeload(this,opts);
		});

		function usertreeload(obj,opt){
			var isinput=$(obj).is("input");
			if(isinput){
				var url=baseUrl+'user/easyuiusertree.xhtml?rootid='+opt.rootid+'&departtype='+opt.departtype+'&checked='+opt.checkedvalue;
				$(obj).combotree({
					url:url
				});
			}else{
				var url=baseUrl+'user/usertree.xhtml?rootid='+opt.rootid+'&departtype='+opt.departtype+'&checked='+opt.checkedvalue;
				var onclick = opt.onnodeclick;
				$.ajax({
					type:'get',
					url:url,
					dataType:"text",
					success:function(msg)
					{
						var setting = {};
						setting.check={enable:opt.multiselect=='1'};
						var cb;
						if(onclick!=undefined){
							if (typeof onclick == "string") {
								cb={onClick:function(event, treeId, treeNode, clickFlag){
									eval(onclick+'(event, treeId, treeNode, clickFlag)');
								}};
								setting.callback=cb;
							}else{
								var func = new Function();
								func = eval(onclick);
								cb={onClick:function(event, treeId, treeNode, clickFlag){
									func(event, treeId, treeNode, clickFlag);
								}};
								setting.callback=cb;
							}
						}
						try{
							var zNodes=eval('('+msg+')');
							$.fn.zTree.init($(obj), setting, zNodes);
						}catch(e){}
					},
					error:function(msg){
					}
				});
			}
		}
	};

	$.fn.usertree.methods = {
		options : function(jq) {
			return $.data(jq[0], "usertree").options;
		},
		getValue:function(jq){
			if($(jq).is("input")){
				return $(jq).combotree('getValue');
			}else{
				var treeObj = $.fn.zTree.getZTreeObj($(jq).attr('id'));
				var nodes = treeObj.getCheckedNodes(true);
				var result=',';
				for(var i=0; i<nodes.length; i++){
					result += nodes[i].id+",";
				}
				return result;
			}
		},
		getText:function(jq){
			if($(jq).is("input")){
				return $(jq).combotree('getText');
			}else{
				var treeObj = $.fn.zTree.getZTreeObj($(jq).attr('id'));
				var nodes = treeObj.getCheckedNodes(true);
				var result=',';
				for(var i=0; i<nodes.length; i++){
					result += nodes[i].name+",";
				}
				return result;
			}
		}
	};

	$.fn.usertree.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.parser.parseOptions(obj,["rootid","multiselect","onnodeclick","departtype","checkedvalue"]),{});
	};

	/**
	 * 用户层
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.userlayer = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.userlayer.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "userlayer");
			var opts;
			if (cData) {
				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.userlayer.parseOptions(this), methodName);
			}

			userlayerload(this,opts);
		});

		function userlayerload(obj,options){
			$(obj).textbox('textbox').attr('readonly',true);
			var thisid=$(obj).attr('id');
			var submitcode=$(obj).attr('submitcode');
			var nextobj=$(obj).next();
			$(obj).before('<p id="'+thisid+'_p" class="select-data"></p>')

			$('#'+thisid+'_p').append($(obj));
			$('#'+thisid+'_p').append($(nextobj));

			var tbox=$(($(nextobj[0]).find('.textbox-text'))[0]);
			var app='<img id="'+thisid+'_img" class="select-img" src="'+baseUrl+'images/select-data.png" /><input id="'+thisid+'_hidden" type="hidden"/>';
			if(submitcode!=undefined){
				app+='<input id="'+thisid+'_submit" name="'+submitcode+'" type="hidden"/>';
			}
			tbox.after(app);

			$('#'+thisid+'_img').on('click',function(){
				openWinCallback(baseUrl+'user/gotoSelectList.xhtml', '选择用户', '1000px', '550px', true, false
					,function setValue(title,x){
						var ids='';
						var names='';
						for(var key in x)
						{
							if(ids!=''){
								ids+=',';
								names+=',';
							}
							ids+=key;
							names+=x[key].user_name;
						}

						$(obj).textbox('setValue',names);
						$('#'+thisid+'_hidden').val(ids);
                        if(submitcode!=undefined){
                            $('#'+thisid+'_submit').val(ids);
                        }
					});
			});
		}
	}
	$.fn.userlayer.methods = {
		options : function(jq) {
			return $.data(jq[0], "userlayer").options;
		},
		getText:function(jq){
			return $(jq).textbox('getValue');
		},getValue:function(jq){
			var thisid=$(jq).attr('id');
			return $('#'+thisid+'_hidden').val();
		}
	};
	$.fn.userlayer.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,[]),{});
	};
})(jQuery);
(function($) {
	/**
	 * 一级菜单导航
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.menunav = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.menunav.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "menunav");
			var opts;
			if (cData) {
				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.menunav.parseOptions(this), methodName);
			}

			menunavload(this,opts);
		});

		function menunavload(obj,options){
			//具体实现代码
			$(obj).empty();
			var activemenuid=options['activemenuid'];
			if(options['homeurl']){
				var active='';
				if(activemenuid=='home'){
					active=' class="active"';
				}
				var li='<li '+active+'><a href='+options['homeurl']+'>首页</a></li>'
				$(obj).append(li);
			}
			if(options['menuurl']){
				$.ajax({
					type:'get',
					url:baseUrl+'/index/menunav.xhtml',
					dataType:"text",
					success:function(msg)
					{
						var data=eval('('+msg+')');
						for(var i = 0; i < data.length; i++){
							var code = data[i].code;
							var name = data[i].name;
							var active='';
							if(code==activemenuid){
								active=' class="active"';
							}

							var li='<li'+active+'><a href="'+options['menuurl']+'?menuId='+code+'">'+name+'</a></li>'
							$(obj).append(li);
						}
					},
					error:function(msg){
					}
				});
			}
		}
	}
	$.fn.menunav.methods = {
		options : function(jq) {
			return $.data(jq[0], "menunav").options;
		}
	};

	$.fn.menunav.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["homeurl","menuurl","activemenuid"]),{});
	};

	/**
	 * 页面内菜单导航
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.pagemenu = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.pagemenu.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "pagemenu");
			var opts;
			if (cData) {
				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.pagemenu.parseOptions(this), methodName);
			}

			pagemenuload(this,opts);
		});

		function pagemenuload(obj,options){
			//具体实现代码
			var url=baseUrl+'index/pagemenu.xhtml';
			$.ajax({
				type:'post',
				url:url,
				dataType:"text",
				success:function(msg)
				{
					try {
                        $(obj).append(msg);
                        _initLeftMenu();
					}catch (e){

					}

				},
				error:function(msg){
				}
			});
		}
	}
	$.fn.pagemenu.methods = {
		options : function(jq) {
			return $.data(jq[0], "pagemenu").options;
		}
	};

	$.fn.pagemenu.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,[]),{});
	};
	/**
	 * 页面内菜单导航
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.pagemenu2 = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.pagemenu2.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "pagemenu2");
			var opts;
			if (cData) {
				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.pagemenu2.parseOptions(this), methodName);
			}

			pagemenu2load(this,opts);
		});

		function pagemenu2load(obj,options){
			//具体实现代码
			var url=baseUrl+'index/pagemenu2.xhtml';
			$.ajax({
				type:'post',
				url:url,
				dataType:"text",
				success:function(msg)
				{
					$(obj).append(msg);
					_initLeftMenu();
				},
				error:function(msg){
				}
			});
		}
	}
	$.fn.pagemenu2.methods = {
		options : function(jq) {
			return $.data(jq[0], "pagemenu2").options;
		}
	};

	$.fn.pagemenu2.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,[]),{});
	};
	/**
	 * echarts组件
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.echarts = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.echarts.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "echarts");
			var opts;
			if (cData) {
				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.echarts.parseOptions(this), methodName);
			}

			echartsload(this,opts);
		});

		function echartsload(obj,options){
			//具体实现代码
			$.ajax({
				type:'get',
				url:baseUrl+'/echarts/getEcartsDataByCode.xhtml?code='+options.code,
				dataType:"text",
				success:function(msg)
				{
					var dom = $(obj)[0];
					var myChart = echarts.init(dom);

					var option=eval('('+msg+')');
					myChart.setOption(option);
				},
				error:function(msg){
				}
			});
		}
	}
	$.fn.echarts.methods = {
		options : function(jq) {
			return $.data(jq[0], "echarts").options;
		}
	};

	$.fn.echarts.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,['code']),{});
	};

	/**
	 * 页面内菜单导航
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.cutscreen = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.cutscreen.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "cutscreen");
			var opts;
			if (cData) {
				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.cutscreen.parseOptions(this), methodName);
			}

			cutscreenload(this,opts);
		});

		function cutscreenload(obj,options){
			captureInit();

			$(obj).on("click",function(e){
                StartCapture();
				//setTimeout(StartCapture,500);
			});
		}
	}
	$.fn.cutscreen.methods = {
		options : function(jq) {
			return $.data(jq[0], "cutscreen").options;
		}
	};

	$.fn.cutscreen.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,[]),{});
	};

	/**
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.searchselect = function(methodName,arg) {
		var defaults = {
			sourcetype:"codetable",
			codetable:"",
			parentobjid:""
		}
		if (typeof methodName == "string") {
			var methodObj = $.fn.searchselect.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "searchselect");
			var opts;
			if (cData) {
				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},defaults,
					$.fn.searchselect.parseOptions(this), methodName);
			}

			searchselectload(this,opts);
		});

		function searchselectload(obj,opts){
			//具体实现代码
			if(opts.sourcetype=='codetable'){
				if(opts.parentobjid){
					var option_str = "<option value=''>请选择</option>";
					$(option_str).appendTo($(obj));

					$(obj).comboSelect(opts);
					if(opts.codetable==''){
						opts.codetable=$("#"+opts.parentobjid).attr('codetable');
						$(obj).attr('codetable',opts.codetable);
					}
					$("#"+opts.parentobjid).change(function(e, v) {
						$.ajax({
							url:baseUrl+"codetable/codeSelect.xhtml?codetable=" + opts.codetable + "&parentcode=" + e.target.value,
							dataType:"json",
							success:function(data)
							{
								var option_str = "<option value=''>请选择</option>";
								for(var i = 0; i < data.length; i++){
									code = data[i].code;
									name = data[i].name;
									option_str += "<option value='"+code+"'";
									var select_value = $(obj).attr("text");
									if( select_value &&  (select_value == code || select_value == name)) {
										option_str += " selected";
									}
									option_str += ">" + name + "</option>";
								}
								$(obj).html("");
								$(obj).html(option_str);
								$(obj).comboSelect(opts);
							}
						});
					});

				}else {

					var url = baseUrl+"codetable/codeSelect.xhtml?codetable=" + opts.codetable + "&parentcode=";
					$.ajax({
						url: url,
						type: 'get',
						dataType: 'json',
						async: false,
						success: function (data) {
							var code;
							var name;

							var option_str = "<option value=''>请选择</option>";
							var select_value = $(obj).val();
							for (var i = 0; i < data.length; i++) {
								code = data[i].code;
								name = data[i].name;
								option_str += "<option value='" + code + "'";

								if (select_value && (select_value == code || select_value == name)) {
									option_str += " selected";
								}
								option_str += ">" + name + "</option>";
							}
							$(obj).html("");
							$(option_str).appendTo($(obj));
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
						}
					});
					$(obj).comboSelect(opts);
				}
			}else {
				//对应的数据源不是码表的情况
				var urltemp=opts['url'];
				$.ajax({
					url: urltemp,
					type: 'get',
					dataType: 'json',
					async: false,
					success: function (json) {
						//返回格式必须为json [{"code":"","name":""},{"code":"","name":""}]
						var code;
						var name;
						var data = json;
						var option_str = "";
						for(var i = 0; i < data.length; i++){
							code = data[i].code;
							name = data[i].name;
							option_str += "<option value='"+code+"'";
							var select_value = $(obj).attr("text");
							if( select_value &&  (select_value == code || select_value == name)) {
								option_str += " selected";
							}
							option_str += ">" + name + "</option>";
						}
						$(obj).html("");
						$(obj).html(option_str);
						$(obj).comboSelect(opts);
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
						var option_str = "<option value=''>请选择</option>";
						$(obj).html("");
						$(obj).html(option_str);
						$(obj).comboSelect(opts);
					}
				});
			}
		}
	}
	$.fn.searchselect.methods = {
		options : function(jq) {
			return $.data(jq[0], "searchselect").options;
		},
		getText:function(jq){
			return '';
		},getValue:function(jq){
			return '';
		}
	};
	$.fn.searchselect.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.parser.parseOptions(obj,['sourcetype','codetable','parentobjid','url']),{});
	};


	/**
	 * 打印组件
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.print = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.menunav.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "print");
			var opts;
			if (cData) {

				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.print.parseOptions(this), methodName);
			}

			printload(this,opts);
		});
		function printload(obj,options){
			//具体实现代码
			var sourceid=options['id'];
			var sdivIds=options['divIds'];
			var sprintType=options['printType'];
			var simageType=options['imageType'];
			$("#"+sourceid).click(function (){
				var  LODOP ;
				var  imageType=simageType;
				var divIds=sdivIds;
				var printType =sprintType;
				LODOP=getLodop(document.getElementById('LODOP_OB'), document.getElementById('LODOP_EM'));
				/*	LODOP=getLodop(); */
				if(printType==1||printType==2||printType==3){
					var top = divIds.split(';')[0].split(',')[0];
					var left = divIds.split(';')[0].split(',')[1];
					var width = divIds.split(';')[0].split(',')[2];
					var height = divIds.split(';')[0].split(',')[3];
					var objId = divIds.split(';')[0].split(',')[4];
					if(1==printType){/*图片打印*/
						LODOP.PRINT_INIT("打印控件功能演示_Lodop功能_打印图片");
						if(imageType==0){/*直接打印*/
							/*30,150,400,400*/
							/*LODOP.ADD_PRINT_IMAGE(30,150,400,400,imageHtml);*/
							LODOP.ADD_PRINT_IMAGE(top,left,width,height,objId);
							LODOP.PRINT();
						}else if(imageType==1){/*缩放打印*/
							/*LODOP.ADD_PRINT_IMAGE(30,20,600,250,imageHtml);*/
							LODOP.ADD_PRINT_IMAGE(top,left,width,height,objId);
							LODOP.SET_PRINT_STYLEA(0,"Stretch",1);/*(可变形)扩展缩放模式*/
							LODOP.PREVIEW();
						}else if(imageType==2){/*原图打印*/
							/*LODOP.ADD_PRINT_IMAGE(30,20,600,600,imageHtml);*/
							LODOP.ADD_PRINT_IMAGE(top,left,width,height,objId);
							LODOP.SET_PRINT_STYLEA(0,"Stretch",2);/*按原图比例(不变形)缩放模式*/
							LODOP.PREVIEW();
						}else if(imageType==3){/*打印维护*/
							/*LODOP.ADD_PRINT_IMAGE(30,150,400,400,imageHtml);*/
							LODOP.ADD_PRINT_IMAGE(top,left,width,height,objId);
							LODOP.PRINT_SETUP();
						}
					}else if(2==printType){/*打印表格*/
						LODOP.PRINT_INIT("打印表格");
						/*LODOP.ADD_PRINT_TABLE(10,1,\"99.8%\",\"100%\",document.getElementById(tableDivId).innerHTML);*/
						LODOP.ADD_PRINT_TABLE(top,left,width,height,document.getElementById(objId).innerHTML);
						LODOP.PREVIEW();
					}else if(3==printType){/*打印当前整个页面*/
						LODOP.PRINT_INIT("打印整个页面");
						/*LODOP.ADD_PRINT_HTM(0,0,\"100%\",\"100%\",document.documentElement.innerHTML);*/
						LODOP.ADD_PRINT_HTM(top,left,width,height,document.documentElement.innerHTML);
						LODOP.PREVIEW();
					}
				}else if(4==printType){/*组合打印，多个div块组合成一块打印*/
					LODOP.PRINT_INIT("多个div组合打印");
					LODOP.SET_PRINT_STYLEA(2,"FontSize",18);
					LODOP.SET_PRINT_STYLEA(2,"Bold",1);
					var t=divIds.split(';').length;
					for(var i=0;i<divIds.split(';').length;i++){
						var top = divIds.split(';')[i].split(',')[0];
						var left = divIds.split(';')[i].split(',')[1];
						var width = divIds.split(';')[i].split(',')[2];
						var height = divIds.split(';')[i].split(',')[3];
						var objId = divIds.split(';')[i].split(',')[4];
						LODOP.ADD_PRINT_HTM(top,left,width,height,document.getElementById(objId).innerHTML);

					}
					LODOP.PREVIEW();
				}
			});


		}
	}
	$.fn.print.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["id","divIds","printType","imageType"]),{});
	};

	/**
	 * 富文本
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.richtext = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.richtext.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}
		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "richtext");
			var opts;
			if (cData) {

				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.richtext.parseOptions(this), methodName);
			}
			richtextload(this,opts);
		});
		function richtextload(obj,options){
			//具体实现代码
			var editor=options['id'];
			ck = CKEDITOR.replace(editor);
			CKEDITOR.config.toolbar_Full =
				[
					{ name: 'document',		items : [ 'Save','NewPage','DocProps','Preview','Print','-','Templates' ] },
					{ name: 'clipboard',	items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
					{ name: 'editing',		items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
					{ name: 'forms',		items : [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
					{ name: 'basicstyles',	items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
					{ name: 'paragraph',	items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
					{ name: 'links',		items : [ 'Link','Unlink','Anchor' ] },
					{ name: 'insert',		items : [ 'Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] },//'Flash',
					//'/',换行符
					{ name: 'styles',		items : [ 'Styles','Format','Font','FontSize' ] },
					{ name: 'colors',		items : [ 'TextColor','BGColor' ] },
					{ name: 'tools',		items : [ 'Maximize', 'ShowBlocks','-','About' ] }
				];
			CKEDITOR.config.toolbar = 'Full';
		}
	}
	$.fn.richtext.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["id","name","rows","cols"]),{});
	};

	$.fn.richtext.methods = {
		getValue:function(obj)
		{
			return ck.getData();
		}
	};

	/**
	 * radio单选
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.radio = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.menunav.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}
		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "radio");
			var opts;
			if (cData) {

				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.radio.parseOptions(this), methodName);
			}
			radioload(this,opts);
		});
		function radioload(obj,options){
			//具体实现代码
			var fin="";
			var id=options['id'];
			var name=options['name'];
			var opt=options['options'];
			var checkopt=options['checkoptions'];
			var codetable = $(obj).attr("codetable");

			if(codetable)
			{
				var url = baseUrl+"codetable/codeSelect.xhtml?codetable=" + codetable ;
				$.ajax({
					url: url,
					type: 'get',
					dataType: 'json',
					async: false,
					success: function(data){
							var optionshtml = "";
							for(var i=0;i<data.length;i++)
							{
								if(checkopt==data[i].code)
								{
									optionshtml+="<label><input type=\"radio\" checked=\"checked\" name=\""+name+"\""+"value=\""+data[i].code+"\"/>"+data[i].name+"</label>";
								}else
									optionshtml+="<label><input type=\"radio\" name=\""+name+"\""+"value=\""+data[i].code+"\"/>"+data[i].name+"</label>";
							}
							$(obj).html(optionshtml);
					}});
				return;
			}
			opt=$.trim(opt);
			checkopt=$.trim(checkopt);

			var tt=opt.split(';').length;
			for(var i=0;i<opt.split(';').length;i++){
				var optfirst = opt.split(';')[i].split(':')[0];
				var optsecond = opt.split(';')[i].split(':')[1];

				if(checkopt==optsecond){
					fin=fin+"<label><input type=\"radio\" name=\""+name+"\" checked=\"checked\""+"value=\""+optsecond+"\"/>"+optfirst+"</label>";
				}else{
					fin=fin+"<label><input type=\"radio\" name=\""+name+"\""+"value=\""+optsecond+"\"/>"+optfirst+"</label>";
				}
			}
			$(obj).html(fin);
		}
	}
	$.fn.radio.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["options","checkoptions","name","id"]),{});
	};


	/**
	 * checkbox多选
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.checkbox = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.menunav.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
			return;
		}
		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "checkbox");
			var opts;
			if (cData) {

				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.checkbox.parseOptions(this), methodName);
			}
			checkboxload(this,opts);
		});
		function checkboxload(obj,options){
			//具体实现代码
			var fin="";
			var id=options['id'];
			var name=options['name'];
			var opt=options['options'];
			var checkopt=options['checkoptions'];
			var codetable = $(obj).attr("codetable");
			if(codetable)
			{
				var url = baseUrl+"codetable/codeSelect.xhtml?codetable=" + codetable ;
				$.ajax({
					url: url,
					type: 'get',
					dataType: 'json',
					async: false,
					success: function(data){
							var optionshtml = "";
							for(var i=0;i<data.length;i++)
							{
								if(checkopt==data[i].code)
								{
									optionshtml+="<label><input type=\"checkbox\" checked=\"checked\" name=\""+name+"\""+"value=\""+data[i].code+"\"/>"+data[i].name+"</label>";
								}else
									optionshtml+="<label><input type=\"checkbox\" name=\""+name+"\""+"value=\""+data[i].code+"\"/>"+data[i].name+"</label>";
							}
							$(obj).html(optionshtml);
					}});
				return;
			}
			opt=$.trim(opt);
			checkopt=$.trim(checkopt);

			var tt=opt.split(';').length;
			for(var i=0;i<opt.split(';').length;i++){
				var optfirst = opt.split(';')[i].split(':')[0];
				var optsecond = opt.split(';')[i].split(':')[1];

				var ischeck=false;
				for(var j=0;j<checkopt.split(',').length;j++){
					var tempcheck=checkopt.split(',')[j];
					tempcheck=$.trim(tempcheck);
					if(tempcheck==optsecond){
						ischeck=true;
						break;
					}
				}
				if(ischeck){
					fin=fin+"<label><input type=\"checkbox\" name=\""+name+"\" checked=\"checked\""+"value=\""+optsecond+"\"/>"+optfirst+"</label>";
				}else{
					fin=fin+"<label><input type=\"checkbox\" name=\""+name+"\""+"value=\""+optsecond+"\"/>"+optfirst+"</label>";
				}
			}
			$(obj).html(fin);
		}
	}
	$.fn.checkbox.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["options","checkoptions","name","id"]),{});
	};


	$.fn.hybase = function(methodName, arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.hybase.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return;
			}
		}
	}
	$.fn.hybase.methods = {
		options : function(jq) {
			return $.data(jq[0], "hybase").options;
		},
		getValue:function(obj)
		{
			var values="";
			if($(obj[0]).is("input")) {
				var t = $(obj[0]).combotree("tree");
				var nodes = t.tree('getSelected');
				values = nodes.id;
			}else{
				var nodes = $(obj[0]).tree("getSelected");
				values = nodes.code;
			}
			return values;
		},
		getALLValue:function(obj)
		{
			var values="";
			var length1=$(obj[0]).tree('getChecked').length;
			for(var i=0;i<length1;i++){
				var temp=$(obj[0]).tree('getChecked')[i];
				values+=temp.id+",";
			}
			return values;
		},
		getselected : function() {
			var nodes = $(this).tree('getChecked');
			var s = '';
			for (var i = 0; i < nodes.length; i++) {
				if (s != '')
					s += ',';
				s += nodes[i].id;
			}
			return s;
		}
	};

})(jQuery);

(function($) {
	/**
	 * 附件上传
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
    var num=0;
	$.fn.attupload = function(methodName,arg) {
		var defaults={
            dataRight:"1" ,
            viewRight:"0" ,
            downloadRight:"1" ,
            nameSuffix:"",
            maxFileSize:"100000000",
            maxFileCount:"20" ,
            osmFlag:"0",
            vchr_entityid:"undefined",
            vchr_domain:"att",
            fileType:"0"
		};

		if (typeof methodName == "string") {
			var methodObj = $.fn.attupload.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodObj, arg);
			}
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "attupload");
			var opts;
			if (cData) {
				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},defaults,
					$.fn.attupload.parseOptions(this), methodName);
                cData = $.data(this, "attupload",{options: opts});
			}
			var exdate=new Date();
			exdate.setDate(exdate.getDate()+1);
			opts.id = "id"+arry.length;
			attuploadload(this,opts);
		});

		function attuploadload(obj,options){
			var temp="";
			if(options.dataRight=="1"){
                num++;
                temp="<div class=\"add-file\" id='hyAddFile"+num+"' name='hyAddFile"+num+"'>上传文件</div>" +
                    "<div class=\"hy-attupload2\"></div>";
			}else{
                temp="<div class=\"hy-attupload2\"></div>";
			}
			$(obj).html(temp);
            _loadFile(obj);
            if(options.dataRight=="1"){
                _createAttUpload(obj,num);
			}
		}
	};

	$.fn.attupload.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["vchr_entityid",
			"vchr_domain",  "dataRight","viewRight","downloadRight","nameSuffix","maxFileSize", "maxFileCount","osmFlag","fileType"]),{});
	};

    $.fn.attupload.methods = {
        options : function(jq) {
            return $.data(jq[0], "attupload").options;
        },
		del:function(jq){
            _delAtt(jq);
		},
        view:function(jq){
            _viewAtt(jq);
        }
    };

    function _createAttUpload(obj,num) {
    	var options=$(obj).attupload("options");
    	var nameSuffix=options.nameSuffix;
        var maxFileCount=parseInt(options.maxFileCount);
        var maxFileSize=parseInt(options.maxFileSize);
        var domain=options.vchr_domain;
        var entityid=options.vchr_entityid;
        var osmFlag=options.osmFlag;
        var fileEXT=options.fileType;
        var picker='#hyAddFile'+num;

        var uploader = WebUploader.create({
            auto: true,
            // swf文件路径
            swf: baseUrl + '/js/component/upload/Uploader.swf',
            // 文件接收服务端。
            server: baseUrl+'upload/doupload.xhtml?vchr_domain='+domain+'&vchr_entityid='+entityid+'&fileType='+fileEXT+'&&osmFlag='+osmFlag,

            // 选择文件的按钮。可选。
            pick: picker,
			prepareNextFile:true,  //对下一个上传的文件进行预处理
			threads:1,  //上传的并发数
            duplicate:true,
            fileSingleSizeLimit:maxFileSize,
            fileNumLimit:maxFileCount,
            // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
            resize: false
        });
        // 当有文件被添加进队列的时候
        uploader.on( 'fileQueued', function( file ) {
            var temp="";
            var fileType=file.ext;
            var fileName=file.name;
            var fileSize=file.size;
			var fileCount=$(obj).find(".attach-wrap").size();

			var url1=baseUrl+'upload/doupload.xhtml?vchr_domain='+domain+'&vchr_entityid='+entityid+'&fileType=1&osmFlag='+osmFlag;
            var url2=baseUrl+'upload/doupload.xhtml?vchr_domain='+domain+'&vchr_entityid='+entityid+'&fileType=0&osmFlag='+osmFlag;
            if(fileType=="png" || fileType=="jpg" || fileType=="jpeg" || fileType=="gif"){
                uploader.options.server=url1;
            }else{
                uploader.options.server=url2;
            }

            //检测上传文件数、文件类型、文件大小
            if(fileCount>=maxFileCount){
                uploader.removeFile(file,true);
                $.hyjx.alert("提示信息", "您上传的文件已经超过最大数量"+options.maxFileCount+",请删除后再上传", "info",
                    function() {});
                return;
            }
            if(nameSuffix!="" && nameSuffix.indexOf(fileType)<0){
                uploader.removeFile(file,true);
                $.hyjx.alert("提示信息", "请上传"+nameSuffix+"格式的文件", "info",
                    function() {});
				return;
			}else{
                fileType=getIcon(fileType);
			}
            if(fileSize>maxFileSize){
                uploader.removeFile(file,true);
                fileSize=bytesToSize(fileSize);
                $.hyjx.alert("提示信息", "您上传的附件大小已经超过"+fileSize+",请上传其他文件", "info",
                    function() {});
                return;
            }else{
                fileSize=bytesToSize(fileSize);
			}

            temp+="<div class=\"attach-wrap temp\" id="+file.id+">" +
                "<b class='attach-bg ico "+fileType+"'></b><!--与文件类型对应的图标-->" +
                "<div class=\"attach-info-wrap\">" +
                "<p class=\"attach-name ellipsis\">"+fileName+"</p>" +
                "<p class=\"attach-size\">"+fileSize+
                "</p>" +
                "<img class=\"attach-loading\" src=\"http://gwebmail4.alicdn.com/static/5094153/images/loading/round_big.gif\" alt=\"加载中\"/>" +
                "<div class=\"attach-toolbar-wrap\">" +
                "<div class=\"attach-toolbar-mask\"></div>" +
                "<p class=\"attach-remove\" title=\"删除\"><b class=\"ico ico-attach-remove\"></b></p>" +
                "</div>"+
                "<div class=\"attach-progress\"></div><!--进度条-->" +
                "</div>" +
                "</div>";
            $(obj).find(".hy-attupload2").append(temp);
        });

        // 文件上传过程中创建进度条实时显示。
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $percent =$("#"+file.id).find('.attach-progress');
            $percent.css( 'width', percentage * 100 + '%' );
        });

        uploader.on( 'uploadSuccess', function( file ) {
            $("#"+file.id).find('.attach-progress').remove();
            _loadFile(obj,true,file.id);
            $.hyjx.alert("提示信息", "上传成功 ", "info",
                function() {});
        });
        uploader.on( 'uploadError', function( file ) {
            $("#"+file.id).remove();
            $.hyjx.alert("提示信息", "出错啦 ", "info",
                function() {});
        });

        uploader.on( 'uploadComplete', function( file ) {
            uploader.removeFile(file,true);
        });

        /**
         * 验证文件格式以及文件大小
         */
        uploader.on("error", function (type) {
            if (type == "Q_TYPE_DENIED") {
                $.hyjx.alert("提示", "上传格式错误", "info",
                    function() {});
            } else if (type == "Q_EXCEED_SIZE_LIMIT") {
            	var fileSize=$(obj).attupload("options").maxFileSize;
                fileSize=bytesToSize(fileSize);
                $.hyjx.alert("提示", "您上传的附件大小已经超过"+fileSize+",请上传其他文件", "info",
                    function() {});
            }else {
                uploader.reset();
                $.hyjx.alert("提示", "上传出错！请检查后重新上传！", "info",
                    function() {});
            }
        });

        $(document).on("click",".temp .attach-remove",function(){
            var id=$(this).parents(".attach-wrap").attr("id");
            uploader.removeFile(id,true);
            $(this).parents(".attach-wrap").remove();
        });
    }


    function _delAtt(obj) {
        $.hyjx.confirm("提示信息", "确定要删除选择的数据吗？",
            function(result) {
                var id=obj.parents(".attach-wrap").attr('id');
                if (result == true) {
                    $.ajax({
                        url: baseUrl+"upload/gotoDelete.xhtml?ids=" + id+"&random="+Math.random(),
                        success: function(msg) {
                            if ("success" == msg) {
                                obj.parents(".attach-wrap").remove();
                                $.hyjx.alert("提示", "删除操作成功！", "info",
                                    function() {});
                            } else {
                                $.hyjx.alert("提示", "操作失败", "info",
                                    function() {});
                            }
                        }
                    });
                }
            }
        );
    }

    //文件预览
    function _viewAtt(obj) {
        var opts=obj.parents(".hy-attupload2").parent().attupload("options");
        var id=obj.parents(".attach-wrap").attr('id');
        var fileName=obj.parents(".attach-wrap").find(".attach-name").attr("name");
        var fileType=fileName.split(".");
        fileType=fileType[fileType.length-1];
        var domain=opts.vchr_domain;
        var entityid=opts.vchr_entityid;
        if(domain==undefined) domain="";
        if(entityid==undefined) entityid="";
        var url=baseUrl+"common/attview.xhtml?id="+id+"&vchr_domain="+domain+"&vchr_entityid="+entityid;
        if(fileType=="png" || fileType=="jpg" || fileType=="jpeg" || fileType=="gif"){
            // 图片预览
            var src=baseUrl+"upload/getPreview.xhtml?fileName=" + fileName + "&vchr_domain=" + domain + "&vchr_entityid=" + entityid + "&vchr_id=" + id;
            window.parent.showw(src);
        }else if (fileType=="html" || fileType=="xhtml" || fileType=="jsp" || fileType=="java" || fileType=="js" || fileType=="txt"){
            url=url+"&viewType=2";
            openWinW(url,"附件预览","100%","100%",false,false,false);
        }
        else if (fileType=="pdf" || fileType=="docx" || fileType=="doc" || fileType=="xls" || fileType=="xlsx" || fileType=="ppt" || fileType=="pptx"){
            url=url+"&viewType=1";
            openWinW(url,"附件预览","100%","100%",false,false,false);
        }
        else{
            $.hyjx.alert("提示信息", "暂不支持预览", "info",
                function() {});
        }
    }

    function _loadFile(jq,flag,tempfileId) {
        var options=$(jq).attupload("options");
        var domain=options.vchr_domain;
        var entityid=options.vchr_entityid;
        $.ajax({
            url: baseUrl+"upload/queryList.xhtml?vchr_domain="+domain+"&fileType=0&rows=100&vchr_entityid="+entityid+"&Random="+Math.random(),
            datatype: "json",
            success: function(res) {
                if (res != 'failure') {
                    if (res && res.total>0) {
                        var tabStr = "";
                        if(!!flag){
                            var oo = res.rows[0];
                            var	viewStr="";
                            var maskStr = "";
                            var delStr = "";
                            var downloadStr="";
                            var fileType="0";
                            var fileName = oo.vchr_originname;
                            var fileSize=oo.num_filesize;
                            var storagename=oo.vchr_storagename;
                            fileSize=bytesToSize(fileSize);
                            var fileId=oo.vchr_id;
                            var fileIcon=getIcon(fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase());
                            var url="";

                            if(options.viewRight==="1"&&(fileIcon=="ico-file-code" || fileIcon=="ico-file-txt" || fileIcon=="ico-file-img" || fileIcon=="ico-file-docx" || fileIcon=="ico-file-excel" || fileIcon=="ico-file-ppt" || fileIcon=="ico-file-pdf")){
                                viewStr="<p class=\"attach-preview\" title=\"预览\" onclick=\"$(this).attupload('view')\" ><b class=\"ico ico-attach-preview\"></b></p>";
							}
							if(options.dataRight=="1"){
                                delStr="<p class=\"attach-remove\" title=\"删除\" onclick=\"$(this).attupload('del')\"><b class=\"ico ico-attach-remove\"></b></p>";
							}
                            if(fileIcon=="ico-file-img"){
                                fileType="1";
                            }
                            url=baseUrl+"upload/download.xhtml?id="+fileId+"&vchr_domain="+domain+"&vchr_entityid="+entityid+"&fileType="+fileType;
                            if(options.downloadRight==="1"){
                                downloadStr="<a class=\"attach-download\" href="+url+" target=\"_blank\" title=\"下载\"><b class=\"ico ico-attach-download\"></b></a>";
                            }
                            if(viewStr == "" && delStr == "" && downloadStr==""){
                            	maskStr="";
							}else{
                                maskStr="<div class=\"attach-toolbar-mask\"></div>";
							}

                            tabStr+="<div class=\"attach-wrap\" id="+fileId+">" +
                                "<b class=\"attach-bg ico "+fileIcon+"\"></b>"+
                                "<div class=\"attach-info-wrap\">" +
                                "<p class=\"attach-name ellipsis\" name="+storagename+">"+fileName+"</p>" +
                                "<p class=\"attach-size\">"+fileSize+"</p>" +
                                "<div class=\"attach-toolbar-wrap\">" +
								maskStr+viewStr+downloadStr+delStr+"</div>" +
                                "</div>"+
                                "</div>";

                            $("#"+tempfileId).before(tabStr);
                            $("#"+tempfileId).remove();
                        }else{
                            for (var i = 0; i < res.rows.length; i++) {
                                var	viewStr="";
								var maskStr = "";
								var delStr = "";
                                var downloadStr="";
                                var oo = res.rows[i];
                                var fileType="0";
                                var fileName = oo.vchr_originname;
                                var storagename=oo.vchr_storagename;
                                var fileSize=oo.num_filesize;
                                fileSize=bytesToSize(fileSize);
                                var fileId=oo.vchr_id;
                                var fileIcon=getIcon(fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase());
                                var url="";

                                //判断预览和删除按钮是否显示
                                if(options.viewRight==="1"&&(fileIcon=="ico-file-code" || fileIcon=="ico-file-txt" || fileIcon=="ico-file-img" || fileIcon=="ico-file-docx" || fileIcon=="ico-file-excel" || fileIcon=="ico-file-ppt" || fileIcon=="ico-file-pdf")){
                                    viewStr="<p class=\"attach-preview\" title=\"预览\" onclick=\"$(this).attupload('view')\" ><b class=\"ico ico-attach-preview\"></b></p>";
                                }
                                if(options.dataRight=="1"){
                                    delStr="<p class=\"attach-remove\" title=\"删除\" onclick=\"$(this).attupload('del')\"><b class=\"ico ico-attach-remove\"></b></p>";
                                }
                                if(fileIcon=="ico-file-img"){
                                	fileType="1";
                                }
                                url=baseUrl+"upload/download.xhtml?id="+fileId+"&vchr_domain="+domain+"&vchr_entityid="+entityid+"&fileType="+fileType;
                                if(options.downloadRight==="1"){
                                    downloadStr="<a class=\"attach-download\" href="+url+" target=\"_blank\" title=\"下载\"><b class=\"ico ico-attach-download\"></b></a>";
                                }
                                if(viewStr == "" && delStr == "" && downloadStr==""){
                                    maskStr="";
                                }else{
                                    maskStr="<div class=\"attach-toolbar-mask\"></div>";
                                }

                                tabStr+="<div class=\"attach-wrap\" id="+fileId+">" +
                                    "<b class=\"attach-bg ico "+fileIcon+"\"></b>"+
                                    "<div class=\"attach-info-wrap\">" +
                                    "<p class=\"attach-name ellipsis\" name="+storagename+">"+fileName+"</p>" +
                                    "<p class=\"attach-size\">"+fileSize+"</p>" +
                                    "<div class=\"attach-toolbar-wrap\">" +
                                    maskStr+viewStr+downloadStr+delStr+"</div>" +
                                    "</div>" +
                                    "</div>";
                            }
                            $(jq).find(".hy-attupload2").append(tabStr);
                        }
                    }

                }
            },
            error: function(res) {
                $.hyjx.alert("提示信息", "出错啦 ", "info",
                    function() {});
            }
        });
    }

    function getIcon(obj) {
        var fileType=obj.substring(obj.lastIndexOf(".")+1).toLowerCase();
        if(fileType=="docx" || fileType=="doc" ){
            return "ico-file-docx";
        }else if (fileType=="txt"){
            return "ico-file-txt";
        }else if (fileType=="pdf"){
            return "ico-file-pdf";
        }else if (fileType=="png" || fileType=="jpg" || fileType=="jpeg" || fileType=="gif" || fileType=="bmp"){
            return "ico-file-img";
        }else if (fileType=="xlsx" || fileType=="xls"){
            return "ico-file-excel";
        }else if (fileType=="ppt" || fileType=="pptx"){
            return "ico-file-ppt";
        }else if (fileType=="ai"){
            return "ico-file-ai";
        }else if (fileType=="html" || fileType=="jsp" || fileType=="java" || fileType=="js" || fileType=="css"){
            return "ico-file-code";
        }else if(fileType=="psd"){
            return "ico-file-ps";
        }else if (fileType=="zip" || fileType=="rar"){
            return "ico-file-zip";
        }else if (fileType=="wav" || fileType=="mp3" || fileType=="wma" || fileType=="asf" || fileType=="aac"){
            return "ico-file-audio";
        }else if (fileType=="rmvb" || fileType=="wmv" || fileType=="mp4" || fileType=="avi" || fileType=="3gp"){
            return "ico-file-video";
        }else if (fileType=="fla" || fileType=="flv" || fileType=="swf"){
            return "ico-file-flash";
        }else{
            return "ico-file-error";
        }
    }

})(jQuery);



(function($) {
	/**
	 * 菜单树
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.menutree = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.menutree.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodObj, arg);
			}
			return;
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "menutree");
			var opts;
			if (cData) {
				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.menutree.parseOptions(this), methodName);
                cData = $.data(this, "menutree",{options: opts});
			}

			menutreeload(this,opts);
		});

		function menutreeload(obj,options){
			var checkbox = options["checkbox"];
			var checkedvalue = options["checkedvalue"];

			if(checkedvalue==undefined)
				checkedvalue = "";
			if(checkbox==undefined) checkbox=false;
			else if(checkbox=="1")
				checkbox=true;
			else if(checkbox=="0"){
				checkbox=false;
			}

			var showOperate = options["showOperate"];
			if(showOperate==undefined) showOperate="0";
			else if(showOperate!="1"&&showOperate!="0")
				showOperate="0";

			var isreadonly = options["isreadonly"];
			if(isreadonly==undefined) isreadonly="0";
			else if(isreadonly!="1"&&isreadonly!="0")
				isreadonly="0";
			
			var applyRight = options["applyRight"];
			if(applyRight==undefined) applyRight="1";
			
			var showSystemId = options["showSystemId"];
			if(showSystemId==undefined) showSystemId="";

			var menuonclick= options["onclick"];
			var rootFlag=false;
			var beginChildFlag=false;
			var tmpNode=null;
			var checkedAll=true;
			
            var url = baseUrl+'/role/doMenuTree.xhtml?showOperate='+showOperate+'&checked='+checkedvalue+"&applyRight="+applyRight;
			if(options["showAll"]=="1")
			url = url +"&showAll=all";
			else 
				url = url +"&showAll=none";
			url = url +"&showSystemId="+showSystemId ;
			$(obj).tree({
				url:url,
				animate:true,
				checkbox:checkbox,
				cascadeCheck:false,
				onBeforeExpand:function(node,param){
				},
				onSelect:function(node){
					if(menuonclick!=undefined){
						eval(menuonclick+"(node)");
					}
				},
				onCheck:function(node, checked){
					if(rootFlag&&checked){
						rootFlag =false ;
						beginChildFlag=false;
						tmpNode=null;
						return ;
					}
						
					if(checked){
						if(!beginChildFlag){
							beginChildFlag=true;
							tmpNode=node;
						}
						if(beginChildFlag){//找到最上层之后，
							var getChildrenNode = $(obj).tree('getChildren', tmpNode.target);
							if(getChildrenNode != null) {//遍历子孙节点，选中
								for(var i=0;i<getChildrenNode.length;i++){
									if(getChildrenNode[i].parent_id!= tmpNode.parent_id)
									$(obj).tree('check', getChildrenNode[i].target);
								}
							}

						}

						if(checked){//找到最上层，停止执行
							var parentNode = $(obj).tree('getParent', node.target);//找到父节点
							if(parentNode!=null){
								if(parentNode.parent_id==null||parentNode.parent_id==""){
									rootFlag = true ;
								}
								if (parentNode != null) {//级联递归选中上级节点
									$(obj).tree('check', parentNode.target);
								}
							}
						}
					}else{//级联取消子孙节点
						rootFlag=false;
						beginChildFlag=false;
						tmpNode=null;
						var getChildrenNode = $(obj).tree('getChildren', node.target);
						if(getChildrenNode != null) {
							for(var i=0;i<getChildrenNode.length;i++){
								$(obj).tree('uncheck', getChildrenNode[i].target);
							}
						}
					}
				},
				onLoadSuccess:function(node,data){
					if("1"==isreadonly){
						$(obj).find('span.tree-checkbox').unbind().click(function(){
							return false;
						});
					}
					if("0"==showOperate){

						var getChildrenNode = $(obj).tree('getChildren');
						for(var i=0;i<getChildrenNode.length;i++){
							var node = getChildrenNode[i];
							if(node.parent_id==""||node.parent_id==null){
								var url =baseUrl+ "/subsys/gotoView.xhtml?id="+node.id+"&showFlag=0";
                                $("#treeFrame").attr("src",url);
								$(obj).tree('select',node.target);
								break;
							}
						}

					}

				}
			});
		}
	}
	$.fn.menutree.methods = {
		options : function(jq) {
			return $.data(jq[0], "menutree").options;
		},getCheckedValues:function(jq){
			var nodes = $(jq).tree('getChecked');
			var s = "";
			var operateIds="";
			var sysIds="";
			for(var i=0; i<nodes.length; i++){
				if(nodes[i].id.indexOf("operate")==0)
					operateIds+="3"+nodes[i].code+",";
				else if(nodes[i].parent_id==""||nodes[i].parent_id==null)
					sysIds+="1"+nodes[i].id+",";
				else
				s += "2"+nodes[i].code+",";
			}
			alert(s+operateIds+sysIds);
			return s+operateIds+sysIds;
		}
	};

	$.fn.menutree.parseOptions=function(obj){
		var t=$(obj);
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["checkedvalue","showOperate","checkbox","isreadonly","onclick","showAll","applyRight","showSystemId"]),{});
	};

})(jQuery);

//头像上传
(function($) {
    /**
     * 头像上传组件
     * methodName 方法名或构造函数的options
     * arg 方法传参
     */
    $.fn.imageupload = function(methodName,arg) {
        //默认参数
        var defaults = {
            width:"",
            height:"",
            edit:"0",
            vchr_entityid:"",
            vchr_domain:"userPhoto"
        };
        if (typeof methodName == "string") {
            var methodObj = $.fn.imageupload.methods[methodName];
            if (methodObj) {
                return methodObj(this, arg);
            } else {
                return this.hybase(methodObj, arg);
            }
        }

        methodName = methodName || {};
        return this.each(function() {
            var cData = $.data(this, "imageupload");
            var opts;
            if (cData) {
                opts = $.extend(cData.options, methodName);
            } else {
                opts = $.extend(
                    {},defaults,
                    $.fn.imageupload.parseOptions(this), methodName);
                cData = $.data(this, "imageupload", {options: opts});
            }
            imageupload(this,opts);
        });
        function imageupload(obj,options){
            $(obj).html("<div class='image-container'><img class=\"image\" src="+baseUrl+"images/component/image-default.jpg /></div>");
            //是否可编辑
            if(options.edit=="1"){
                $(obj).find(".image-container").append("<p class=\"image-edit\" onclick=\"$(this).imageupload('add')\">编辑头像</p>");
            }
			if(options.width!=""){
            	var imgWidth=parseInt(options.width);
                $(obj).find(".image-container").width(imgWidth);
			}
            if(options.height!=""){
                var imgHeight=parseInt(options.height);
                $(obj).find(".image-container").height(imgHeight);
            }

            loadImage(obj,true);
        }
    };
    $.fn.imageupload.methods = {
        options : function(jq) {
            return $.data(jq[0], "imageupload").options;
        },
		add:function (jq) {
            addImage(jq);
        },
		loadImage:function (jq) {
            loadImage(jq);
        }
    };

    $.fn.imageupload.parseOptions=function(obj){
        var t=$(obj);
        return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["width","height","edit","vchr_entityid","vchr_domain"]),{});
    };

    function addImage(jq){
		var opts=jq.parents(".image-container").parent().imageupload("options");
		$(".image-container").removeClass("fileChecked");
        jq.parents(".image-container").addClass("fileChecked");
        openWinW2(baseUrl+'common/imagecrop.xhtml?vchr_domain='+opts.vchr_domain+'&vchr_entityid='+opts.vchr_entityid,"头像上传","700px","550px",false,false);
    }
    function loadImage(jq,flag) {
    	if(!!flag){
            jq=$(jq);
		}

        var opts=jq.imageupload("options");
        var domain=opts.vchr_domain;
        var entityid=opts.vchr_entityid;
        $.ajax({
            url: baseUrl+"upload/loadImage.xhtml?vchr_domain="+domain+"&fileType=1&vchr_entityid="+entityid+"&"+Math.random(),
            datatype: "json",
            success: function(res) {
                if (res != 'failure') {
                    var obj = JSON.parse(res);
                    var len=obj.rows.length;
                    if(len==0){
                    	return false;
					}
                    var oo = obj.rows[0];
                    var imgSrc=baseUrl+"upload/getPreview.xhtml?fileName=" + oo.vchr_storagename + "&vchr_domain=" + domain + "&vchr_entityid=" + entityid + "&vchr_id=" + oo.vchr_id;
                    jq.find(".image-container .image").attr('src',imgSrc);
                }
            },
            error: function(res) {
                $.hyjx.alert("提示信息", "出错啦 ", "info",
                    function() {});
            }
        });
    }

})(jQuery);

//图片上传
(function($) {
    /**
     * 图片上传组件
     * methodName 方法名或构造函数的options
     * arg 方法传参
     */
    var num=0;
    $.fn.imgupload = function(methodName,arg) {
        //默认参数
        var defaults={
            imageWidth:"" ,
            imageHeight:"",
            dataRight:"1" ,
            wordRight:"1",
            maxFileSize:"100000000",
            maxFileCount:"5" ,
            osmFlag:"0",
            vchr_entityid:"",
            vchr_domain:"",
            nameSuffix:"png,jpg,jpeg"
        };
        if (typeof methodName == "string") {
            var methodObj = $.fn.imgupload.methods[methodName];
            if (methodObj) {
                return methodObj(this, arg);
            }
            else {
                return this.hybase(methodObj, arg);
            }
        }

        methodName = methodName || {};
        return this.each(function() {
            var cData = $.data(this, "imgupload");
            var opts;
            if (cData) {
                opts = $.extend(cData.options, methodName);
            } else {
                opts = $.extend(
                    {},defaults,
                    $.fn.imgupload.parseOptions(this), methodName);
                cData = $.data(this, "imgupload", {
                    options: opts});
			}
            imgupload(this,opts);
        });
        function imgupload(obj,options){
        	if(options.dataRight=="1"){
        		num++;
        		var temp="<div class=\"upload-btn\" id='upload"+num+"'>" +
                    "<input class=\"add-file\" type=\"file\" id='file"+num+"' name='file"+num+"' onchange=\"$(this).imgupload('upload')\" />" +
                    "</div>";
        		$(obj).html(temp);
			}else{
                $(obj).html("");
			}

            //设置上传按钮
            if(options.imageWidth!=""){
                var imageWidth=parseInt(options.imageWidth);
                $(obj).find(".upload-btn").width(imageWidth);
            }
            if(options.imageHeight!=""){
                var imageHeight=parseInt(options.imageHeight);
                $(obj).find(".upload-btn").height(imageHeight);
            }

            _loadImage(obj,true);
        }

    };

    $.fn.imgupload.parseOptions=function(obj){
        var t=$(obj);
        return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["imageWidth", "imageHeight", "dataRight","wordRight", "maxFileSize", "maxFileCount", "osmFlag","vchr_entityid","vchr_domain","nameSuffix"]),{});
    };
    //针对jquery的扩展方法
    $.fn.imgupload.methods = {
        options : function(jq) {
            return $.data(jq[0], "imgupload").options;
        },
        del:function (jq) {
            _delimg(jq);
        },
        show:function (jq) {
            _showImg(jq);
        },
        upload:function (jq) {

            _uploadImg(jq);
        }
    };

    //删除已上传的图片
    function _delimg(obj) {
        $.hyjx.confirm("提示信息", "确定要删除选择的数据吗？",
            function(result) {
                var id=obj.parent().attr('id');
                if (result == true) {
                    $.ajax({
                        url: baseUrl+"upload/gotoDelete.xhtml?ids=" + id+"&random="+Math.random(),
                        success: function(msg) {
                            if ("success" == msg) {
                                obj.parent().remove();
                                $.hyjx.alert("提示", "删除操作成功！", "info",
                                    function() {});
                            } else {
                                $.hyjx.alert("提示", "操作失败", "info",
                                    function() {});
                            }
                        }
                    });
                }
            });
    }

    //图片放大预览功能
    function _showImg(obj) {
        var value=obj.attr('src');
        window.parent.showw(value);
    }

    //显示上传图片
    function _loadImage(jq,flag) {
    	if(!!flag){
    		jq=$(jq);
		}else{
    		jq=jq.parent().parent();
		}
        var options=jq.imgupload("options");
        var domain=options.vchr_domain;
        var entityid=options.vchr_entityid;

        $.ajax({
            url: baseUrl+"upload/loadImage.xhtml?vchr_domain="+domain+"&fileType=1&vchr_entityid="+entityid+"&Random="+Math.random(),
            datatype: "json",
            success: function(res) {
                if (res != 'failure') {
                    var obj = JSON.parse(res);
                    if (obj && obj.rows) {
                        var tabStr = "";
                        var deleteStr="";
                        var wordStr="";
                        for (var i = 0; i < obj.rows.length; i++) {
                            var oo = obj.rows[i];
                            var fileName = oo.vchr_originname;
                            var fileSize=oo.num_filesize;
                            var fileId=oo.vchr_id;
                            fileSize=bytesToSize(fileSize);

                            //是否显示删除按钮
							if (options.dataRight==="1"){
                                deleteStr="<a class='delete' onclick='$(this).imgupload(\"del\")'></a>";
							}
                            if (options.wordRight==="1"){
                                wordStr="<p class='img-title' title='"+fileName+"' >" +  fileName + " </p><p class='img-size' title='"+fileSize+"' >" +  fileSize + "</p>";
                            }

                            tabStr = tabStr + "<div class='upload-image' id="+fileId+"><div class='image-list'>" +
                                "<b><img onclick='$(this).imgupload(\"show\")' src='"+baseUrl+"upload/getPreview.xhtml?fileName=" + oo.vchr_storagename + "&vchr_domain=" + oo.vchr_domain + "&vchr_entityid=" + oo.vchr_entityid + "&vchr_id=" + oo.vchr_id + "' /></b>" +
                                "</div>"
                                +wordStr+ deleteStr;
                            tabStr = tabStr + "</div>";
                        }
                    }
                    jq.find(".upload-image").remove();
                    jq.prepend(tabStr);

                    //设置图片宽高
                    if(options.imageWidth!=""){
                        var imageWidth=parseInt(options.imageWidth);
                        jq.find(".upload-image,b").width(imageWidth);
                    }
                    if(options.imageHeight!=""){
                        var imageHeight=parseInt(options.imageHeight);
                        jq.find(".image-list,b").height(imageHeight);
                    }
                    
                    $("#file1").show();
                }
            },
            error: function(res) {
                $.hyjx.alert("提示信息", "出错啦 ", "info",
                    function() {});
                $("#file1").show();
            }
        });
    }
    
    function _uploadImg(obj) {
        var fileElementId=obj.attr("id");
        var ext=obj.val().substring(obj.val().lastIndexOf(".")+1).toLowerCase();
        var fileCount=obj.parent().parent().find(".upload-image").size();
		var options=obj.parent().parent().imgupload("options");
        var domain=options.vchr_domain;
        var entityid=options.vchr_entityid;
        var nameSuffix=options.nameSuffix;

        //检测上传文件数
		if(fileCount>=parseInt(options.maxFileCount)){
			//alert("您上传的图片已经超过最大数量"+options.maxFileCount+",请删除图片后再上传");
			 $.hyjx.alert("提示", "您上传的图片已经超过最大数量"+options.maxFileCount+",请删除图片后再上传", "info",
                     function() {});
			return;
		}

        // gif在IE浏览器暂时无法显示
        if(nameSuffix.indexOf(ext)=="-1"){
            //alert("图片的格式必须为png或者jpg或者jpeg格式！");
        	 $.hyjx.alert("提示", "图片的格式必须为png或者jpg或者jpeg格式！", "info",
                     function() {});
            return;
        }
        
        obj.hide();

        $.ajaxFileUpload({
            url:baseUrl+'upload/doupload.xhtml?vchr_domain='+domain+'&vchr_entityid='+entityid+'&fileType=1',
            secureuri :false,
            async: true,
            fileElementId :fileElementId,//file控件id
            dataType:'text',
            success:function(data, status){
                if(status=='success'){
                    _loadImage(obj);
                }
            },
            error: function(data, status, e){
                alert(e);
            }
        });
    }

})(jQuery);

(function($) {
	/**
	 * 类百度组件
	 * methodName 方法名或构造函数的options
	 * arg 方法传参
	 */
	$.fn.searchinput = function(methodName,arg) {
		if (typeof methodName == "string") {
			var methodObj = $.fn.searchinput.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodObj, arg);
			}
			return;
		}

		methodName = methodName || {};
		return this.each(function() {
			var cData = $.data(this, "searchinput");
			var opts;
			if (cData) {
				opts = $.extend(cData.options, methodName);
				cData.options = opts;
			} else {
				opts = $.extend(
					{},
					$.fn.searchinput.parseOptions(this), methodName);
			}

			var id = $(this).attr("id");
			var value = $(this).val();
			var showText = opts.text;
			if(typeof(opts.text)=="undefined")
				showText="";

			var html ="<div id='content"+id+"' class='search-content'> <p id='search-first"+id+"' class='search-first'>";
			html = html +"<input class='search-text' id='"+$(this).attr("id")+"' value='"+showText+"' type='text' /> </p>";
			html = html +"<input type='hidden'  id='"+id+"value' name='"+$(this).attr("id")+"' value='"+opts.code+"' />";
			html = html +"<ul id='"+$(this).attr("id")+"_append' class='search-append'></ul> </div>";

			$(this).after(html);
			$(this).remove();
			var obj = $("#"+id);

			$(obj).bind("focus",function (){
				$(obj).bind('input propertychange', function() {
					searchinput(obj,opts);
					tmp_obj_id = $(obj).attr("id");
				});
			});
			
			$(obj).bind("blur",function (){
				$(obj).unbind('input propertychange');
			});

			$("#content"+id).click(function(e){
				$(this).show();
				var id = $(this).attr("id");
				e.stopPropagation();//阻止冒泡
				$("[id$='_append']").each(function(){
					if($(this).attr("id")!=(id+"_append")){
						$(this).hide();
					}
				});
			});
			$(document).click(function(){
				$("#"+$(obj).attr("id")+"_append").hide();
			});
		});
		function searchinput(obj,opts){
			var _search_kw_id='';
			var kw = jQuery.trim($(obj).val());
			_search_kw_id=$(obj).attr("id");
			if(kw == ""){
				$("#"+_search_kw_id+"_append").hide().html("");
				return false;
			}
			var html = "";
			var url=baseUrl+opts["url"];
			globalShowMask=false;
			var pdata={keyWord:$(obj).val()};
			$.ajax({
				type:'post',
				url:url,
				data:pdata,
				dataType:"text",
				success:function(result)
				{   
					var flag= false ;
					var data=eval('('+result+')');
					for(var i = 0; i < data.length; i++){
						var code = data[i].code;
						var name = data[i].name;
						if (name.indexOf(kw) >= 0) {
							if(kw==name){
								$("#"+$(obj).attr("id")+"value").val(code);
								flag =true ;
							}
							html = html + "<li id='"+_search_kw_id+"_"+code+"' class='item' onmouseenter='getFocus(this)' onClick=\"getCon(this,"+opts["callback"]+");\">" + name + "</li>";
						}
					}
					  if(!flag){
						$("#"+$(obj).attr("id")+"value").val(kw);	
					   }
					$("#"+_search_kw_id+"_append").hide().html("");
					if(html != ""){
						
						$("#"+_search_kw_id+"_append").show().html(html);
					}
				}
			});
			globalShowMask=false;
		}
	}

	$(document).keydown(function(e){
		e = e || window.event;
		var keycode = e.which ? e.which : e.keyCode;
		var _search_kw_id = tmp_obj_id ;
		var appendId=_search_kw_id+"_append";
		if(jQuery.trim($("#"+appendId).html())==""){
			return;
		}
		var appendObj=$("#"+appendId);
		if(keycode == 38){
			//Up Arrow
			$("#"+_search_kw_id).blur();
			var index = appendObj.find(".addbg").prevAll().length;
			if(index == 0){
				appendObj.find(".item").removeClass('addbg').eq(appendObj.find(".item").length-1).addClass('addbg');
			}else{
				appendObj.find(".item").removeClass('addbg').eq(index-1).addClass('addbg');
			}
		}else if(keycode == 40){
			//Dw Arrow
			$("#"+_search_kw_id).blur();
			if(appendObj.find(".item").hasClass("addbg")){
				var index = appendObj.find(".addbg").prevAll().length;
				if(index == appendObj.find(".item").length-1){
					appendObj.find(".item").removeClass('addbg').eq(0).addClass('addbg');
				}else{
					appendObj.find(".item").removeClass('addbg').eq(index+1).addClass('addbg');
				}
			}else{
				appendObj.find(".item").removeClass('addbg').eq(0).addClass('addbg');
			}

		}else if(keycode == 13){
			$("#"+_search_kw_id).blur();
			var value = appendObj.find(".addbg").text();
			$("#"+appendObj.find(".addbg").attr("id").split("_")[0]+"value").val(appendObj.find(".addbg").attr("id").split("_")[1]);
			$("#"+_search_kw_id).val(value);
			appendObj.find(".addbg").click();
			$("#"+_search_kw_id+"_append").hide().html("");
		}
	});

	$.fn.searchinput.methods = {
		options : function(jq) {
			return $.data(jq[0], "searchinput").options;
		},getText : function(obj){
			return $(obj).val();
		},
		getValue : function(obj){
			return $("#"+$(obj).attr("id")+"value").val();
		}
	};

	$.fn.searchinput.parseOptions=function(obj){
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["url","callback","text","code"]),{});
	};

})(jQuery);
function callback_(callback,name,code){
	if(callback!=undefined){
		if(typeof(callback)=="function")
		{
			var func = new Function();
			func = eval(callback);
			func(name,code);
		}
		else
			eval(callback+"('"+name+"','"+code+"')");
	}
}
function getFocus(obj){
	$(".item").removeClass("addbg");
	$(obj).addClass("addbg");
}
function getCon(obj,callback){
	var value = $(obj).text();
	$("#"+$(obj).attr("id").split("_")[0]).val(value);
	$("#"+$(obj).attr("id").split("_")[0]+"_append").hide().html("");
	$("#"+$(obj).attr("id").split("_")[0]+"value").val($(obj).attr("id").split("_")[1]);
	callback_(callback,value,$(obj).attr("id").split("_")[1]);
}


(function($){
	$.fn.orgtree = function(methodName,arg){
		var defaults = {
			validity:"",
			showtype:"1",
			departtype:"2",
			multiselect:"",
			checkedvalue:"",
			rootid:"-1",
			isreadonly:"",
			onclick:function(){}
		};

		if(typeof methodName == 'string')
		{
			var methodObj = $.fn.orgtree.methods[methodName];
			if(methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
		}
		methodName = methodName || {};
		var options = $.extend({},defaults,methodName);

		return this.each(function(){
			options = $.extend({},options,$.fn.orgtree.parseOptions(this),methodName);
			var url = baseUrl+'/depart/doTree.xhtml?departtype='+options.departtype+'&rootid='+options.rootid+"&checked="+options.checkedvalue+"&pid=-1"+"&validity="+options.validity;;
			if($(this).is("input"))
			{
				$(this).combotree({
					url:url,
					multiple:options.multiselect=='1',
					onBeforeExpand:function(node,param){
						$(this).tree('options').url = baseUrl+'/depart/doTree.xhtml?departtype='+options.departtype+'&rootid='+options.rootid+"&checked="+options.checkedvalue+"&pid="+node.id;
					},
					onLoadSuccess:function(node,data)
					{
						$("#_easyui_tree_1").addClass("tree-node-selected");
						$(this).tree('expandAll');
					}
				});
				$(this).combotree('setValue', {
					id: options.checkedvalue.toLowerCase(),
					text: ''
				});
			}else if($(this).is("ul"))
			{
				var onclick = options.onclick;
				var onloadsuccess = options.onloadsuccess;
				$(this).tree({
					url:url,
					checkbox:options.multiselect=='1',
					onBeforeExpand:function(node,param){
						$(this).tree('options').url = baseUrl+'/depart/doTree.xhtml?departtype='+options.departtype+'&rootid='+options.rootid+"&checked="+options.checkedvalue+"&pid="+node.id+"&validity="+options.validity;
					},
					onSelect:function(node){
						if(onclick!=undefined){
							if(typeof(onclick)=="function")
							{
								var func = new Function();
								func = eval(onclick);
								func(node);
							}
							else
								eval(onclick+"(node)");
						}
					},
					onLoadSuccess:function(node,data)
					{
						$("#_easyui_tree_1").addClass("tree-node-selected");
						if(onloadsuccess!=undefined)
						{
							eval("onloadsuccess(node,data)");
						}
						$(this).tree("expand",$(this).tree("getRoots")[0].target);

                        if(options.isreadonly){
							$(this).find('span.tree-checkbox').unbind().click(function(){
								return false;
							});
						}
					}
				});

			}
		});

	};
	$.fn.orgtree.methods={
		getvalue:function(obj)
		{
			var values="";
			$($(obj).tree('getChecked')).each(function(){
				values+=$(this)[0].code+",";
			});
			return values;
		}
	};
	$.fn.orgtree.parseOptions=function(obj)
	{
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["validity","departtype","multiselect","checkedvalue","rootid","isreadonly","onclick","onloadsuccess"]),{});
	};

	$.fn.wordviewer = function(arg){
		var src = arg.src == undefined ? $(this).attr("src") : arg.src;
		//var a = $(this).replaceWith("<iframe style='width:100%' src='"+baseUrl+"component/edrawoffice/webwordView.jsp?src="+src+"'></iframe>");
	};

	$.fn.exportword = function(methodName,arg)
	{
		//$(this).replaceWith(" <input type='button' class='btn btn-info' onclick='exportword();' value='"+$(this).val()+"' />");
	};

    $.fn.exportpdf=function(obj)
    {
        //$(this).replaceWith(" <input type='button' class='btn btn-info' onclick='exportpdf();' value='"+$(this).val()+"' />");
    };

    //二维码
	$.fn.qrcode = function(methodName,arg)
	{
		var defaults = {
			text:"",
			size:"7"
		}
		var options = $.extend({},defaults,methodName,arg);
		return this.each(function(){
			options = $.extend({},options,$.fn.qrcode.parseOptions(this),methodName);
			$(this).replaceWith("<img src="+baseUrl+"QRCodeServlet?content="+encodeURI(options.text)+"&size="+options.size+">");
		});

	};
	$.fn.qrcode.parseOptions=function(obj)
	{
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["text","size"]),{});
	};

	//	验证码
	$.fn.checkcode=function(obj)
	{
		$(this).replaceWith("<img src="+baseUrl+"checkcode?"+Math.random()+" onclick=$(this).attr('src',baseUrl+'checkcode?'+Math.random()) title='点击刷新验证码'></img>");
	}

	$.fn.departselwin=function(methodName,arg)
	{
		var defaults = {
			value:"点击此处选择...",
			reset:function(){}
		}
		if(typeof methodName == 'string')
		{
			var methodObj = $.fn.departselwin.methods[methodName];
			if(methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
		}
		methodName = methodName || {};
		var options = $.extend({},defaults,methodName);
		return this.each(function(){
			options = $.extend({},options,$.fn.orgtree.parseOptions(this),methodName);
			var id = $(this).attr("id");
			$(this).after("<input type='hidden' id='"+id+"' value=''>");
			$(this).bind("click",function(){
				openWinCallback(baseUrl+"component/publicpage/queryuserdept.jsp?type=1&id="+id, '部门选择框', '600px', '380px', true, false,function setvalue(x,b){
				});
			});
			$(this).attr("id",id+"name");
		});
	}
	$.fn.departselwin.methods={
		reset:function(obj)
		{
			$(obj).val("");
			$(obj).prev().val("");
		}
	}
	function loadSelect(select_obj,text){
		var codetable = $(select_obj).attr("codetable");//代码表名称
		var lazyload=$(select_obj).attr("lazyload");
		if(lazyload==undefined) lazyload="0";
		if(codetable) {
			var parentobject = $(select_obj).attr("parentobject");//保存上级代码的对象
			var parentcode = $(select_obj).attr("parentcode");//上级代码
			var parentct = '';
			if(parentobject != undefined)
				parentct = $("#"+parentobject).attr("codetable");
			var pinyin = $(select_obj).attr("pinyin");
			var othername = $(select_obj).attr("othername");
			var otherword = $(select_obj).attr("otherword");
			var editable = $(select_obj).attr("editable");
			var noparent = $(select_obj).attr("noparent");
			var readonly = $(select_obj).attr("readonly");
			var alltext = $(select_obj).attr("alltext");
			pinyin =pinyin == undefined?"":pinyin;
			noparent = noparent == undefined?"":noparent;
			if((pinyin=="") && (editable==undefined || editable==""))
			{
				$(select_obj).combobox({
			    	editable:false
			    });
			}else if(editable=="1")
			{
				$(select_obj).combobox({
			    	editable:true
			    });
			}
			if(!parentcode) {
				parentcode = "";
			}
			if(parentobject) {
			if($("#"+parentobject).attr("type")=="hidden")
			{
				parentcode = $("#"+parentobject).val();
			}else
			{
					var pv = "";
					try{
						pv=$("#"+parentobject).combobox("getValue");
					}catch(e)
					{
						//console.log(e);
					}
				$("#"+parentobject).combobox({
					editable:editable=="1"?true:false,
					onSelect:function(rec){
						$.ajax({
						url:baseUrl+"codetable/codeSelect.xhtml?codetable=" + codetable + "&parentcode=" 
						+ $("#"+parentobject).combobox("getValue")
						+"&noparent="+noparent
						,
							dataType:"json",
							success:function(data)
							{
								try{
									if($.data(select_obj,"combobox")){
										$(select_obj).combobox("clear");
									}
									$(select_obj).combobox('loadData', data);
								}catch(e){
									//console.log(e);
								}
							}
						});
					}
				});
				$("#"+parentobject).combobox("setValue",pv);
			}
		}
		if(lazyload=='1'){
			var option_str = "<option value=''>请选择</option>";
			$(obj).html("");
			$(option_str).appendTo($(obj));
		}else{
			var url = baseUrl+"codetable/codeSelect.xhtml?codetable=" + codetable + "&parentcode=" + parentcode+"&parentct="+parentct+"&pinyin="+pinyin+"&noparent="+noparent;
			$.ajax({
				url: url,
				type: 'get',
				dataType: 'json',
				async: false,
				success: function(data){
					if(select_obj.id!="")
						$("#" + select_obj.id + " option").length = 0;
					else{
						//console.log("缺少id属性");
						return;
					}
					try{
						if($.data(select_obj,"combobox")){
							$(select_obj).combobox("clear");
						}
						$(select_obj).combobox({
							textField:"name",
							valueField:"code"
						});
						if(alltext!=undefined)
						{
							var alltext_obj = {"name":alltext,"code":""};
							data.reverse().push(alltext_obj);
							data = data.reverse();
						}
						$(select_obj).combobox('loadData', data);
						if(text!="")
							$(select_obj).combobox('setValue', text);
						if(othername!=undefined)
						{
							if($("#"+othername).length==0)
							{
								$("<input type='hidden' id='"+othername+"' name='"+othername+"'/>").insertBefore(select_obj);
								$("<input type='hidden' id='"+select_obj.id+"_val' name='"+select_obj.id+"'/>").insertBefore(select_obj);
							}
							$(select_obj).combobox({
								editable:editable=="1"?true:false,
								onSelect:function(rec)
								{
									var text = $(this).combobox('getText');
									if(checkother(text,otherword))//选择其他
									{
										var othervalue=$(this).combobox("getValue");
										$("#"+select_obj.id+"_val").val(othervalue);
										
										var org_name = $("#"+select_obj.id).attr("name");
										$("#"+select_obj.id).attr("name","");
										
										$(this).combobox({editable:true});
										$(this).attr("editable",true);
										$(this).combobox("setText","请输入：");
									}else
									{//选择非其他
										if($(this).attr("editable")=="true")
										{
											var v=$(this).combobox("getValue");
											$(this).combobox({editable:false});
											$(this).attr("editable",false);
											$(this).combobox("setValue",v);
											$("#"+othername).val("");
										}
									}
								},
								onChange:function(n,o)
								{
									$(this).combobox("setValue",n.replace("请输入：",""));
									var othervalue=$(this).combobox("getValue");
									$("#"+othername).val(othervalue);
								}
						    });
						}
						if(readonly!=undefined)
						{
							$(select_obj).next().find("input[type='text']").css('background-color',"#eee");
						}
						if(text!=""){
							$(select_obj).combobox('setValue', text);
							//回显不匹配，显示空
							if(text==$(select_obj).combobox('getText'))
							{
								$(select_obj).combobox('setValue', "");
							}
						}
					}catch(e){
						//console.log(e);
					}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					//console.log(XMLHttpRequest.responseText);
				}
			});
		}
	}
}
	function checkother(text,otherword)
	{
		if(otherword.indexOf(",")>-1)
		{
			var a = otherword.split(',');
			for(var i=0;i<a.length;i++)
			{
				if(text==a[i])
				{
					return true;
					break;
				}
			}
		}else
		{
			return text == otherword;
		}
	}
	$.fn.codeselect = function(methodName,arg)
	{
		var defaults = {
			codetable:"",
			text:"",
			parentobject:"",
			data:"",
			parentcode:"",
			othername:"",
			editable:false
		}
		if(typeof methodName == 'string')
		{
			var methodObj = $.fn.codeselect.methods[methodName];
			if (methodObj) {
				return methodObj(this, arg);
			} else {
				return this.hybase(methodName, arg);
			}
		}
		methodName = methodName || {};
		var options = $.extend({},defaults,methodName);

		return this.each(function(){
			options = $.extend({},options,$.fn.codeselect.parseOptions(this),methodName);
			if(options!=null && options.data!=undefined && options.data!="")
			{
				var jsondata = JSON.parse(options.data);
				for(var a=0;a<jsondata.length;a++)
				{
					$(this).append("<option value="+jsondata[a].key+">"+jsondata[a].value+"</option>");
				}
				return;
			}
			if(options!=null && options.codetable!=undefined & options.codetable!="")
				$(this).attr("codetable",options.codetable);
			if(options!=null && options.parentobject!=undefined & options.parentobject!="")
				$(this).attr("parentobject",options.parentobject);
			if(options!=null && options.parentcode!=undefined & options.parentcode!="")
				$(this).attr("parentcode",options.parentcode);
			if(options!=null && options.pinyin!=undefined & options.pinyin!="")
				$(this).attr("pinyin",options.pinyin);
			if(options!=null && options.othername!=undefined & options.othername!="")
				$(this).attr("othername",options.othername);
			if(options!=null && options.otherword!=undefined & options.otherword!="")
				$(this).attr("otherword",options.otherword);
			if(options!=null && options.editable!=undefined & options.editable!="")
				$(this).attr("editable",options.editable);
			if(options!=null && options.noparent!=undefined & options.noparent!="")
				$(this).attr("noparent",options.noparent);
			loadSelect(this,options.text);
		});
	}
	$.fn.codeselect.methods={
		getValue:function(obj)
		{
			return $(obj).combobox("getValue");
		}
	}
	$.fn.codeselect.parseOptions=function(obj)
	{
		return $.extend({},$.fn.panel.parseOptions(obj),$.parser.parseOptions(obj,["codetable","pleaseselected","text","parentobject","data","othername"]),{});
	}
})(jQuery);


$.fn.h5imgcompress = function()
{
	$(this).after("<img src='' id='preview' alt=''>");
	document.getElementById($(this).attr("id")).addEventListener('change', handleFileSelect, false);
}

function handleFileSelect (evt) {
	var files = evt.target.files;
	for (var i = 0, f; f = files[i]; i++) {
      // Only process image files.
      if (!f.type.match('image.*')) {
        continue;
      }
      var reader = new FileReader();
      // Closure to capture the file information.
      reader.onload = (function(theFile) {
        return function(e) {
          var i = document.getElementById("preview");
          i.src = event.target.result;
          $(i).css('width',$(i).width()/10+'px');
          //$(i).css('height',$(i).height()/10+'px');
          var quality =  50;
          i.src = jic.compress(i,quality).src;
          i.style.display = "block";
        };
      })(f);
      reader.readAsDataURL(f);
    }
  }
var jic = {
        /**
         * Receives an Image Object (can be JPG OR PNG) and returns a new Image Object compressed
         * @param {Image} source_img_obj The source Image Object
         * @param {Integer} quality The output quality of Image Object
         * @return {Image} result_image_obj The compressed Image Object
         */
        compress: function(source_img_obj, quality, output_format){
             var mime_type = "image/jpeg";
             if(output_format!=undefined && output_format=="png"){
                mime_type = "image/png";
             }
             var cvs = document.createElement('canvas');
             //naturalWidth真实图片的宽度
             cvs.width = source_img_obj.naturalWidth;
             cvs.height = source_img_obj.naturalHeight;
             var ctx = cvs.getContext("2d").drawImage(source_img_obj, 0, 0);
             var newImageData = cvs.toDataURL(mime_type, quality/100);
             var result_image_obj = new Image();
             result_image_obj.src = newImageData;
             return result_image_obj;
        }
};

$.fn.swfimgcompress=function(){
	
	$("<div id='divFlash'><a href='https://get.adobe.com/cn/flashplayer' target='_blank'>您未安装flash插件，无法使用【上传】功能，<br>请点击此处下载最新的flash插件，安装完毕请关闭所有浏览器，并重新登录本系统。</a></div>").insertAfter($(this));
	$("<img id='img1' style='display:none;'/>").insertAfter($(this));

	var action = $(this).attr("action");
	var btnText = $(this).attr("btnText");
	var imgWidth=$(this).attr("imgWidth");
	var imgHeight=$(this).attr("imgHeight");
	if(imgWidth==undefined || imgWidth=="")
		imgWidth = "1000";
	if(imgHeight==undefined || imgHeight=="")
		imgHeight = "1000";
	if(btnText==undefined || btnText=="")
		btnText = "选择图片...";
	var params = {
			serverUrl: action,
			jsFunction: "flashReturn",
			imgWidth:imgWidth,
			imgHeight:imgHeight,
			imgQuality:50,
			btnText:btnText
		};
	swfobject.embedSWF(baseUrl+"component/swfimgcompress/imgZipUpload.swf", "divFlash", "100", "30", "10.0.0", baseUrl+"component/swfimgcompress/expressInstall.swf", params);
	
};
function flashReturn(type, str) {
	if(type == 'error')
	{
		alert(str);
	}
	else if (type == 'complete')
	{
		var img1 = document.getElementById('img1');
		img1.style.display = "block";
		img1.src = str;
	}
}

//部门选择框
function opendept(){
	var ret = window.showModalDialog("../component/publicpage/queryuserdept.jsp?type=1","dialogHeight:300,dialogWidth:400");
	return ret;
}
//导出页面到word文件
function exportword()
{
	var oWD = new ActiveXObject("Word.Application");
	var oDC = oWD.Documents.Add("",0,1);
	var oRange =oDC.Range(0,1);
	var sel = document.body.createTextRange();
	sel.moveToElementText(PrintA);
	sel.select();
	sel.execCommand("Copy");
	oRange.Paste();
	oWD.Application.Visible = true;
	//window.close();
}
function getExportPath() {
	var shell = new ActiveXObject("Shell.Application");
	var folder = shell.BrowseForFolder(0, '请选择存储目录', 0x0040, 0x11);
	var filePath;
	if(folder != null) {
		filePath = folder.Items().Item().Path;
	}
	return filePath;
}
//导出页面到pdf
function exportpdf(){
	var filePath = getExportPath();
	if(filePath != null) {
		try {
			var word = new ActiveXObject("Word.Application");
			var doc = word.Documents.Add("", 0, 1);
			var range = doc.Range(0, 1);
			var sel = document.body.createTextRange();
			try {
				sel.moveToElementText(content);
			} catch (notE) {
				alert(notE);
				alert("导出数据失败，没有数据可以导出。");
				window.close();
				return;
			}
			sel.select();
			sel.execCommand("Copy");
			range.Paste();
			//word.Application.Visible = true;// 控制word窗口是否显示
			doc.saveAs(filePath + "/导出.pdf", 17);// 保存为pdf格式
			alert("导出成功");
		}catch (e) {
			alert("导出数据失败，需要在客户机器安装Microsoft Office Word 2007以上版本，将当前站点加入信任站点，允许在IE中运行ActiveX控件。");
		}
		finally {
			try {word.quit();
				// 关闭word窗口
			}catch (ex) {}
		}
	}
}

/**
 * 自定义询问框，在最外层页面打开
 */
(function($){
	$.hyjx={
		confirm:function(title,msg,fn){
			if(top.$.messager.confirm==undefined){
                return $.messager.confirm(title,msg,fn);
			}else{
                return top.$.messager.confirm(title,msg,fn);
			}
		},
		alert:function (title,msg,info,fn) {
            if(top.$.messager.alert==undefined){
                return $.messager.alert(title,msg,info,fn);
            }else{
                return top.$.messager.alert(title,msg,info,fn);
            }
        }
	};
})(jQuery);

//字节格式化函数
function bytesToSize(bytes) {
    if (bytes === 0) return '0 B';
    var k = 1024;
    sizes = ['B','KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    i = Math.floor(Math.log(bytes) / Math.log(k))
    return (bytes / Math.pow(k, i)).toFixed(2) + ' ' + sizes[i];
}

/*
 *  和前端相关的  JS文件
 *  作者 : 娄赫曦
 *  日期 : 2017-10-24
 *  uiLayout值为1是自适应高度布局
 *  uiLayout值为2是layout布局，左侧菜单是点击菜单，一级菜单在左，二三级菜单在右
 *  uiLayout值为3是layout布局，是传统的左侧三级菜单
 */
var uiLayout=2;

$(document).ready(function() {
    // 顶部一级导航
    $(".navigation").find("li").click(function(){
        $(this).addClass("active").siblings("li").removeClass("active");
    });
    //带图标的导航
    $(".header-nav").find("li").find("a").click(function(){
        $(this).parent("li").toggleClass('active'); //之间独立切换
    });
    // 首页导航
    $(".nav").find("li").click(function(){
        $(this).addClass("active").siblings("li").removeClass("active");
    });

    //以下几行为初始化默认第一个菜单的展开状态和选中状态
    $(".left-menu").find(".menu1").eq(0).next("ul").show();  //默认展开第一个二级菜单
    $(".left-menu").find(".menu1").eq(0).next("ul").find('li').eq(0).find(".menu3").show();  //默认第一个三级菜单展开
    //默认选中第一个一级菜单
    if ($(".left-menu").find(".menu1").eq(0).next("ul").find(".menu2").size()>0) {
        $(".left-menu").find(".menu1").eq(0).addClass("has-menu2-active");
    }else{
        $(".left-menu").find(".menu1").eq(0).addClass("menu1-active");
    }
    $(".left-menu").find(".menu1").eq(0).next("ul").find("li").eq(0).addClass("active");  //默认选中第一个二级菜单
    $(".left-menu").find(".menu1").eq(0).next("ul").find("li").eq(0).find(".menu3").eq(0).addClass("menu3-active");  //默认选中第一个三级菜单

    $(".left-menu").find(".menu1").on("click",function(){
        if($(this).next("ul").find(".menu2").size()>0){
            $(".left-menu").find(".menu1").removeClass("menu1-active");
            $(".left-menu").find(".menu1").removeClass("has-menu2-active");
            $(this).addClass("has-menu2-active");
            $(this).next("ul").slideDown().siblings("ul").slideUp();
            $(".left-menu").find("li").removeClass("active").find(".menu3").hide();
            $(".left-menu .menu3").removeClass("menu3-active");
        }else{  //没有二级菜单的情况
            $(".left-menu").find(".menu1").removeClass("has-menu2-active");
            $(".left-menu").find(".menu1").removeClass("menu1-active");
            $(this).addClass("menu1-active");
            $(".left-menu").find("ul").slideUp();
            $(".left-menu").find("li").removeClass("active").find(".menu3").hide();
            $(".left-menu .menu3").removeClass("menu3-active");
        }
        $('.ps-scrollbar-y').css({'top':'0'});  //自定义滚动条初始位置置顶
    });
    $(".left-menu").find(".menu2").on("click",function(){
        if($(this).next(".menu3").size()>0){
            $(".left-menu").find(".menu3").hide();
            $(this).parent("li").find(".menu3").show();
            $(this).parent("li").addClass("active").siblings("li").removeClass("active");
            $(".left-menu .menu3").removeClass("menu3-active");
        }else{ //没有三级菜单的情况
            $(".left-menu").find("li").removeClass("active");
            $(this).parent("li").addClass("active").siblings("li").removeClass("active");
            $(".left-menu").find(".menu3").hide();
            $(".left-menu .menu3").removeClass("menu3-active");
        }
    });
    $(".left-menu .menu3").on("click",function(){
        $(this).addClass("menu3-active").siblings().removeClass("menu3-active");
        $(".left-menu").find("li").removeClass("active");
        $(this).parent("li").addClass("active");
        $(this).find("li").siblings("li").find(".menu3").hide();
    });
    $(".left-menu").find(".menu1").each(function() {
        if($(this).next("ul").find(".menu2").size()>0){
            //令带二级菜单的一级菜单右侧带图标
            $(this).addClass("has-menu2");
        }
    });
    $(".left-menu").find(".menu2").each(function() {
        if($(this).next(".menu3").size()>0){
            //令带三级菜单的二级菜单右侧带图标
            $(this).addClass("has-menu3");
        }
    });
    /*--左侧3级菜单栏  end--*/

    //查询结果列表每行背景色相同,点击所在行变色
    $(".table-result").find("tr").click(function(){
        $(".table-result").find("tr").css("background","#fff");
        $(this).css("background","#fffaf2");
    });

    // 折叠面板
    $(".fold-head").find(".fold-btn").click(function() {
        $(this).toggleClass("active").parent(".fold-head").next(".fold-content").slideToggle();
    });

    //换肤弹出层
    $(".change-skin .button,#skin").mouseover(function(event) {
        $(".change-skin").find(".words").show();
    });
    $(".change-skin .button,#skin").mouseleave(function(event) {
        $(".change-skin").find(".words").hide();
    });
    $(".change-skin .button,#skin").click(function(event) {
        $(".mask").show();
        $(".skin-layer").slideDown();
    });
    $(".skin-layer").find("li").click(function(event) {
        $(this).addClass("active").siblings("li").removeClass("active");
    });
    $(".skin-layer").find(".close-layer,#close-layer").click(function(event) {
        $(".mask").hide();
        $(".skin-layer").slideUp();
    });

    //导航分类-弹出层的弹出与关闭
    $("#add_kind").click(function(){
        $(".kind-layer").fadeIn();
        $(".mask").fadeIn();
    });
    $(".kind-layer .close,#closeLayer").click(function(){
        $(".kind-layer").fadeOut();
        $(".mask").fadeOut();
    });
    //导航分类-弹出层里的tab页
    $(".tabs2-nav li").each(function(i){
        $(this).mouseover(function (){
            showTabs("tabs2_",i+1,10);
        })
    });
    //弹出层里的左侧菜单切换效果
    $('.left-menu2').find('li').mouseover(function() {
        $(this).addClass('active').siblings('li').removeClass('active');
    });

    /* 基础标签维护页折叠面板 begin */
    $('.basic-labels').find('.title-labels').click(function() {
        $(this).parents('.basic-labels').toggleClass('active');
    });
    $('.basic-labels').find('.title2-labels').click(function() {
        $(this).next('.labels-ul2').slideToggle();
        $(this).next('.labels-ul-end').slideToggle();
    });
    //li选中后出现编辑和删除按钮
    $('.basic-labels').find('li').find('p').on('click',function(){
        $('.li-active').removeClass('li-active');
        $('.labels-edit-active').removeClass('labels-edit-active');
        $('.labels-delete-active').removeClass('labels-delete-active');
        $(this).addClass('li-active');
        $(this).find('.labels-edit').addClass('labels-edit-active');
        $(this).find('.labels-delete').addClass('labels-delete-active');
    });
    /* 基础标签维护页折叠面板 end */

    // 固定右侧的导航和对应的各弹出层
    $('.right-menu').find('li').each(function(i){
        $(this).click(function (){
            showTabs("layer_",i+1,10);
        })
    });
    $('.right-menu').dblclick(function() {
        $('.right-menu').find('li').removeClass('active');
        $('.right-menu-layer').hide();
    });

    // 右侧区自定义的tab页
    $('.tabs-nav').find('li').click(function() {
        $(this).addClass('active').siblings('li').removeClass('active');
    });
    $('.tabs_nav').find('a').click(function() {
        $(this).addClass('active').siblings().removeClass('active');
    });

    // 操作列表页面面板切换
    $(".operate-list").find('li').find('a').each(function(i){
        $(this).click(function (){
            showTabs("operate_",i+1,30);
        })
    });

    // 自定义样式的tab页---div切换
    $("#tabs-nav").find('li').each(function(i){
        $(this).click(function (){
            showTabs("tabs_",i+1,20);
        })
    });

    // 分页样式切换
    $('.pages2').find('.page').on('click',function(){
        $('.pages2').find('.page').removeClass('page-active');
        $(this).addClass('page-active');
    });

    //带下拉列表分类的大框搜索
    $(".classify-search").find(".classify-p").on("mouseover",function(){
        $(this).next("ul").slideDown();
    });
    $(".classify-search").find(".classify").on("mouseleave",function(){
        $(this).find("ul").slideUp();
    });
    $(".classify-search").find(".classify").find("li").on("click",function(){
        $(this).addClass("classify-click").siblings().removeClass("classify-click");
        $(".classify-search").find(".classify").find(".classify-span").text($(this).text());
    });

    // 弹窗（标签选择）
    // 备选标签分类导航
    $('.selectArea').find('.nav1').find('span').on('click',function() {
        $(this).addClass('active').siblings().removeClass('active');
    });
    //头部已打开的弹窗列表
    $(document).on('click', '.dropdown-toggle', function() {
        $(this).toggleClass('active');
        $(this).find('.dropdown-menu').slideToggle();
    });
    $(document).on('click', '.dropdown-menu li', function(event) {
        $(this).addClass('active').siblings().removeClass('active');
    });


    if(uiLayout==2){
        // 左侧菜单的收起和展开
        $('.left-menu .control').on('click',function () {
            var leftwid=$('.left-menu').width();
            if(leftwid==50){
                $('.left-ul').hide();
                $(this).parent('.left-menu').css('width','170px');
                $(this).parents('.layout-panel-west').css('width','170px');
                $(this).parent('.left-menu').removeClass('small');
                $('.layout-panel-center').eq(0).css('left','170px');
                var wid=window.screen.width-170;
                $('.layout-panel-center').eq(0).width(wid);
                $('.rightArea').eq(0).width(wid);
            }
            else{
                $(this).parent('.left-menu').css('width','50px');
                $(this).parents('.layout-panel-west').css('width','50px');
                $(this).parent('.left-menu').addClass('small');
                $('.layout-panel-center').eq(0).css('left','50px');
                var wid=window.screen.width-50;
                $('.layout-panel-center').eq(0).width(wid);
                $('.rightArea').eq(0).width(wid);
            }
        });
        //点击一级菜单，无二级菜单时整个菜单收起，有二级菜单时自动展开
        $('.left-menu .menu1').on('click',function () {
            if (!$(this).hasClass('has-menu2')) {
                var leftwid=$('.layout-panel-west').width();
                if(leftwid>100){
                    $(this).parent('.left-menu').css('width','50px');
                    $(this).parents('.layout-panel-west').css('width','50px');
                    $(this).parent('.left-menu').addClass('small');
                    $('.layout-panel-center').eq(0).css('left','50px');
                    var wid=window.screen.width-50;
                    $('.layout-panel-center').eq(0).width(wid);
                    $('.rightArea').eq(0).width(wid);
                }
            }
            else{
                $(this).parents('.left-menu').css('width', '50px');
                $(this).parents('.left-menu').addClass('small');
                $(this).parents('.layout-panel-west').css('width', '170px');
                $('.layout-panel-center').eq(0).css('left','170px');
                var wid=window.screen.width-170;
                $('.layout-panel-center').eq(0).width(wid);
                $('.rightArea').eq(0).width(wid);
            }
            $('.left-ul').find('li:first').css('marginTop','0');
        });
        //左侧一级菜单图标不同，点击后切换图片路径
        $('.left-menu').find('.menu1').on('click',function(){
            var srcthis1=$(this).find('.icon').attr('src');
            var pttr = /active/;
            if(pttr.test(srcthis1)==true){};
            if(pttr.test(srcthis1)==false){
                var srcthis2=srcthis1.replace('.png','_active.png');
                $(this).find('.icon').attr('src',srcthis2);
                $(this).siblings('.menu1').each(function(){
                    var srcelse1=$(this).find('.icon').attr('src');
                    var srcelse2=srcelse1.replace('_active.png','.png');
                    $(this).find('.icon').attr('src',srcelse2);
                });
            }
        });
    }

    if( uiLayout==3 ){
        // 左侧菜单的收起和展开
        var leftwid=0;
        $('.left-menu .control').on('click',function () {
            leftwid=$('.left-menu').width();
            if(leftwid==40){
                $(this).parent('.left-menu').css('width','170px');
                $(this).parents('.layout-panel-west').css('width','170px');
                $(this).parent('.left-menu').removeClass('small');
                $('.layout-panel-center').eq(0).css('left','170px');
                var wid=window.screen.width-170;
                $('.layout-panel-center').eq(0).width(wid);
                $('.rightArea').eq(0).width(wid);
            }
            else{
                $(this).parent('.left-menu').css('width','40px');
                $(this).parents('.layout-panel-west').css('width','40px');
                $(this).parent('.left-menu').addClass('small');
                $('.layout-panel-center').eq(0).css('left','40px');
                var wid=window.screen.width-40;
                $('.layout-panel-center').eq(0).width(wid);
                $('.rightArea').eq(0).width(wid);
            }
            $('.left-ul').hide();
        });
        //如果菜单为收起状态，点击带有二级的一级菜单，菜单展开，显示二级菜单
        $('.left-menu .menu1').on('click',function () {
            leftwid=$('.left-menu').width();
            if(leftwid==40) {
                $(this).parents('.left-menu').css('width', '170px');
                $(this).parents('.left-menu').removeClass('small');
                $(this).parents('.layout-panel-west').css('width', '170px');
                $('.layout-panel-center').eq(0).css('left', '170px');
                var wid = window.screen.width - 170;
                $('.layout-panel-center').eq(0).width(wid);
                $('.rightArea').eq(0).width(wid);
            }
        });
        //左侧一级菜单图标不同，点击后切换图片路径
        $('.left-menu').find('.menu1').on('click',function(){
            var srcthis1=$(this).find('.icon').attr('src');
            var pttr = /active/;
            if(pttr.test(srcthis1)==true){};
            if(pttr.test(srcthis1)==false){
                var srcthis2=srcthis1.replace('.png','_active.png');
                $(this).find('.icon').attr('src',srcthis2);
                $(this).siblings('.menu1').each(function(){
                    var srcelse1=$(this).find('.icon').attr('src');
                    var srcelse2=srcelse1.replace('_active.png','.png');
                    $(this).find('.icon').attr('src',srcelse2);
                });
            }
        });

    }
});

//tab页切换
function showTabs(name,num,n){
    for(i=1;i<=n;i++){
        var menu=document.getElementById(name+"nav"+i);
        var con=document.getElementById(name+"con"+i);
        if(i == num){
            $(menu).addClass("active");
            $(con).show();
        }else{
            $(con).css("display", "none");
            $(menu).removeClass("active");
        }
    }
}
/**
 * 以下4个方法用于自适应高度布局
 */
//datagrid表格加载完重新计算rightFrame的高度
function datagrid_onLoadSuccess(data){
    if(uiLayout==1){
        var left_treeHeight = 0;
        if($(".left-tree",parent.document).length>0){
            left_treeHeight = $(".left-tree",parent.document).height();
            var table_queryHeight = 0;
            if ($(".table-query").length > 0) {
                table_queryHeight = $(".table-query").height();
            }
            var rf = parent.parent.document.getElementById("rightFrame");
            if(rf) {
                var scrollHeight = rf.scrollHeight ;
                var iframeHeight = Math.max(left_treeHeight,data.rows.length * 35+table_queryHeight);
                rf.style.height = (iframeHeight+70) +"px";
            }
        }else{
            var table_queryHeight = 0;
            if($(".table-query").length>0){
                table_queryHeight = $(".table-query").height();
            }
            var rf=parent.parent.document.getElementById("rightFrame");
            if(rf){
                rf.style.height = ((data.rows.length)*35+table_queryHeight+250)+"px" ;
            }
        }
    }
}
function rightFrameAutoHeight(){
    try{
        var rf=parent.document.getElementById("rightFrame");
        if(rf) {
            rf.height = window.screen.availHeight - 60;
        }
    }catch(e){}
}
function _treeFrameHeight() {
    var ifm_right= document.getElementById("treeFrame");
    ifm_right.height="0px"; //不然谷歌浏览器下一直是所加载过页面的最大高度
    var subWeb_right = document.frames ? document.frames["treeFrame"].document : ifm_right.contentDocument;
    if(ifm_right != null && subWeb_right != null) {
        ifm_right.height = subWeb_right.body.scrollHeight;
        ifm_right.width = subWeb_right.body.scrollWidth;
    }
}
function _strengthBody(){
    if($(".left-tree",parent.document).length==1){
        var height = Math.max(document.body.scrollHeight,$(".left-tree",parent.document).height());
        parent.document.getElementById("treeFrame").style.height = height+"px";
        parent.parent.document.getElementById("rightFrame").style.height =(height+50) +"px";
    }
}

