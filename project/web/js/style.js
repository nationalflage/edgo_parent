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

