<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="theme" uri="/WEB-INF/tlds/theme.tld"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
    <!-- 换肤弹出层 begin -->
    <div class="skin-layer">
        <div class="head">
            <div class="center">
                <h2>系统背景</h2>
                <span class="close-layer"></span>
            </div>
        </div>
        <div id="scroll">
            <ul class="scroll-area">
  				
            </ul>
        </div>
        <div class="buttons">
            <button class="btn btn-warning" onclick="savetheme()" >保存</button>
            <button class="btn" id="close-layer">取消</button>
        </div>
    </div>
    
    <!-- 自定义滚动条 -->
     <script type="text/javascript" src="js/perfect-scrollbar.with-mousewheel.min.js"></script>
     <link href="css/perfect-scrollbar.css" rel="stylesheet"/>
    <style>
        #scroll{width:870px;height: 190px; margin:20px auto 0 auto;overflow: hidden;position:relative;}
        #scroll .scroll-area{ width: 100%;}
    </style>
    <script>
        $(function() {
            $('#scroll').perfectScrollbar();
        });
    </script>
    <!-- 换肤弹出层 end -->
    
    <script>
	var theme = "";
	function changetheme(t,obj)
	{
		$(".skin-layer ul li").removeClass("active");
		$(obj).toggleClass("active");
		theme = t;
	}
	function savetheme()
	{
		$.ajax({
            type:"post",
            url:"<%=basePath%>theme/savetheme.xhtml",
            data:{id:theme},
            dataType:'text',
			success:function(msg){
				 location.replace("<%=basePath%>login.xhtml");
			},
			error:function(err){
                //location.replace("<%=basePath%>login.xhtml");
				alert(err.responseText);
			}
		});
	}

	$(function () {
        $.ajax({
            url:'<%=basePath%>theme/queryList.xhtml',
            type:"get",
            success:function(d){
                var html = "";
                for(var x=0;x<d.length;x++)
                {
                    var active = "";
                    var currTheme="<theme:ThemeTags/>";
                    if(d[x] == currTheme)
                        active = "class=\"active\"";
                    var skinjpg = d[x];
                    skinjpg = "skin-"+d[x];
                    html+="<li onclick=\"changetheme('"+d[x]+"',this);\" "+active+" style=\"background: url('<%=basePath %>images/"+skinjpg+".jpg') no-repeat center center;\" title="+d[x]+"><span class=\"icon\"></span></li>";
                }
                $("ul[class='scroll-area']").html(html);
            },
            error:function(err){
                alert(err.responseText);
            }
        });
    })
</script>