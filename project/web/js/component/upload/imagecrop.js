jQuery.browser={};(function(){jQuery.browser.msie=false; jQuery.browser.version=0;if(navigator.userAgent.match(/MSIE ([0-9]+)./)){ jQuery.browser.msie=true;jQuery.browser.version=RegExp.$1;}})();
var naturalWidth=0;
var naturalHeight=0;
$(function() {
    if(typeof FileReader == "undefined"){
        $("#idLeft").hide();
        $("#idRight").hide();
    }
    $('#target').Jcrop({
        onChange: showPreview,
        onSelect: showPreview,
        bgFade: true,
        aspectRatio: 1,
        bgOpacity: .5
    });
    $("#idLeft").click(function(e) {
        imgRotate(-90);
        return false;
    });
    $("#idRight").click(function(e) {
        imgRotate(90);
        return false;
    });
    $("#idBig").click(function(e) {
        imgToSize(20);
        return false;
    });
    $("#idSmall").click(function(e) {
        imgToSize(-20);
        return false;
    });
    //默认图像居中显示
    $('#target-img').load(function(){
        cutImage($("#target-img"));
    });

});
//图片旋转
function imgRotate(deg) {
    var img1 = $("#target-img"),
        _data = parseInt($(".jc-demo-box").attr("data"));
    if($.browser.version == 8.0) {
        var sin = Math.sin(Math.PI / 180 * (_data + deg)),
            cos = Math.cos(Math.PI / 180 * (_data + deg));
        var _filter = "progid:DXImageTransform.Microsoft.Matrix(M11=" + cos + "," + "M12=" + (-sin) +
            ",M21=" + sin + ",M22=" + cos + ",SizingMethod='auto expand')";
        img1.css({
            filter: _filter
        });
        $('.preview-container img').css({
            filter: _filter
        });

    } else {
        var _deg = deg + _data;
        var _val = "rotate(" + _deg + "deg)";
        img1.css({
            "-webkit-transform": _val,
            "-moz-transform": _val,
            "-ms-transform": _val,
            "transform": _val
        });
        $('.preview-container img').css({
            "-webkit-transform": _val,
            "-moz-transform": _val,
            "-ms-transform": _val,
            "transform": _val
        });
    }

    var fiw = $('#target-img').width(),
        fih = $('#target-img').height(),
        ow = Math.floor((400 - fiw) / 2),
        oh = Math.floor((300 - fih) / 2),
        cx = $("#small").position().left,
        cy = $("#small").position().top,
        rx = 135 / $("#small").width(),
        ry = 135 / $("#small").height();

    if($.browser.version == 8.0) {
        pre_img2($('.preview-container img'), rx, fih, ry, fiw, cx, cy, ow, oh);
    } else {
        pre_img2($('.preview-container img'), rx, fiw, ry, fih, cx, cy, ow, oh);
    }

    $(".jcrop_w img").css({
        left: ow,
        top: oh
    });

    if(deg > 0) {
        if(_data == 270) {
            _data = 0;
        } else {
            _data = _data + 90;
        }
    } else {
        if(_data == 0) {
            _data = 270;
        } else {
            _data = _data - 90;
        }
    }
    $("#d").val(_data);
    $(".jc-demo-box").attr("data", _data);
}

//放大缩小图片
function imgToSize(size) {
    var iw = $('#target-img').width(),
        ih = $('#target-img').height(),
        _data = $(".jc-demo-box").attr("data"),
        _w = Math.round(iw + size),
        _h = Math.round(((iw + size) * ih) / iw);

    if(($.browser.version == 8.0) && (_data == 90 || _data == 270)) {
        $('#target-img').width(_h).height(_w);
    } else {
        $('#target-img').width(_w).height(_h);
    }

    var fiw = $('#target-img').width(),
        fih = $('#target-img').height(),
        ow = (400- fiw) / 2,
        oh = (300 - fih) / 2,
        cx = $("#small").position().left,
        cy = $("#small").position().top,
        rx = 135 / $("#small").width(),
        ry = 135 / $("#small").height();

    if(($.browser.version == 8.0) && (_data == 90 || _data == 270)) {
        pre_img2($('.preview-container img'), rx, fih, ry, fiw, cx, cy, ow, oh);
    } else {
        pre_img2($('.preview-container img'), rx, fiw, ry, fih, cx, cy, ow, oh);
    }
    $(".jcrop_w img").css({
        left: ow,
        top: oh
    });

};

//默认图像位置
function cutImage(obj) {
    var w = 400,
        h = 300;
    var img=document.getElementById("target-img");
    var iwh=getImgNaturalDimensions(img);
    var iw=iwh[0];
    var ih=iwh[1];
    naturalWidth=iwh[0];
    naturalHeight=iwh[1];
    if(iw > w || ih > h) {
        if(iw / ih > w / h) {
            obj.css({
                width: w,
                height: w * ih / iw,
                top: (h - (w * ih / iw)) / 2,
                left: 0
            });
        } else {
            obj.css({
                height: h,
                width: h * iw / ih,
                top: 0,
                left: (w - (h * iw / ih)) / 2
            });
        }
    } else {
        obj.css({
            width:'auto',
            height:'auto',
            left: (w - iw) / 2,
            top: (h - ih) / 2
        });
    }
}

function showPreview(c) {
    var iw = $('#target-img').width(),
        ih = $('#target-img').height(),
        ow = (400 - iw) / 2,
        oh = (300 - ih) / 2,
        rx = 135 / c.w,
        ry = 135 / c.h,
        _data = $(".jc-demo-box").attr("data");

    if(($.browser.version == 8.0) && (_data == 90 || _data == 270)) {
        pre_img2($('.preview-container img'), rx, ih, ry, iw, c.x, c.y, ow, oh);
    } else {
        pre_img2($('.preview-container img'), rx, iw, ry, ih, c.x, c.y, ow, oh);
    }
    $('#x').val(c.x);
    $('#y').val(c.y);
    $('#w').val(c.w);
    $('#h').val(c.h);
}

function pre_img2(obj, rx, iw, ry, ih, cx, cy, ow, oh) {
        obj.css({
        width: Math.round(rx * iw) + 'px',
        height: Math.round(ry * ih) + 'px'
    });
    if(cy >= oh && cx >= ow) {
        obj.css({
            marginLeft: '-' + Math.round(rx * (cx - ow)) + 'px',
            marginTop: '-' + Math.round(ry * (cy - oh)) + 'px'
        });
    } else if(cy <= oh && cx >= ow) {
        obj.css({
            marginLeft: "-" + Math.round(rx * (cx - ow)) + 'px',
            marginTop: Math.round(ry * (oh - cy)) + 'px'
        });
    } else if(cy >= oh && cx <= ow) {
        obj.css({
            marginLeft: Math.round(rx * (ow - cx)) + 'px',
            marginTop: '-' + Math.round(ry * (cy - oh)) + 'px'
        });
    } else if(cy <= oh && cx <= ow) {
        obj.css({
            marginLeft: Math.round(rx * (ow - cx)) + 'px',
            marginTop: Math.round(ry * (oh - cy)) + 'px'
        });
    }
};

//取消上传
function cancel() {
   window.parent.closeWin('头像上传');
};

//改变图片路径，并且对图片进行回显
function change() {
    var file = document.getElementById("image");
    var ext=file.value.substring(file.value.lastIndexOf(".")+1).toLowerCase();
    var pic = $('.preview-container img');
    var target = $('#target-img');

    if(ext!='png'&&ext!='jpg'&&ext!='jpeg'){
    	$.hyjx.alert("提示信息", "图片的格式必须为png或者jpg或者jpeg格式！ ", "info",
                function() {});
        return;
    }
    $(".jcrop_w").addClass("active");
    if(typeof FileReader == "undefined") {
        tempPhotoIE8();
    }else {
        html5Reader(file);
    }
}

function tempPhotoIE8() {
    var fileElementId=$("#image").attr("id");
    var entityid=$("#vchr_entityid").val();
    $.ajaxFileUpload({
        url:baseUrl+'upload/doupload.xhtml?vchr_domain=tempIEphoto&vchr_entityid='+entityid+'&fileType=1',
        secureuri :false,
        async: true,
        fileElementId :fileElementId,//file控件id
        dataType:'text',
        success:function(data, status){
            if(status=='success'){
                getTempPhotoIE8();
            }
        },
        error: function(data, status, e){
            alert(e);
        }
    });
}

function getTempPhotoIE8() {
    var entityid=$("#vchr_entityid").val();
    $.ajax({
        url: baseUrl+"upload/loadImage.xhtml?vchr_domain=tempIEphoto&fileType=1&vchr_entityid="+entityid+"&Random="+Math.random(),
        datatype: "json",
        success: function(res) {
            if (res != 'failure') {
                var obj = JSON.parse(res);
                if (obj && obj.rows) {
                    var oo = obj.rows[0];
                    var src=baseUrl+"upload/getPreview.xhtml?fileName=" + oo.vchr_storagename + "&vchr_domain=" + oo.vchr_domain + "&vchr_entityid=" + oo.vchr_entityid + "&vchr_id=" + oo.vchr_id;
                    $('#target-img').css({width:'auto',height:'auto'});
                    $('.preview-container img').attr('src',src);
                    $('#target-img').attr('src',src);
                }
            }
        },
        error: function(res) {
            $.hyjx.alert("提示信息", "出错啦 ", "info",
                function() {});
        }
    });
}

//将图片转换为base64位的数据进行回显
function html5Reader(file){
    var file = file.files[0];
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function(e){
        var pic = $('.preview-container img');
        var target = $('#target-img');
        pic.attr('src',this.result);
        target.attr('src',this.result);
    }
}

//上传图片
function savePhoto() {
    var file = $("#image");
    if(file.val()==""){
    	$.hyjx.alert("提示信息", "需要重新选择图片！ ", "info",
                function() {});
        return;
    }
    var temp=getImagePos();
    var x=parseInt(temp[0]);
    var y=parseInt(temp[1]);
    var w=parseInt(temp[2]);
    var h=parseInt(temp[3]);

    if(parseInt($('#w').val())){
        var fileElementId=$("#image").attr("id");
        var domain=$("#vchr_domain").val();
        var entityid=$("#vchr_entityid").val();
        $.ajaxFileUpload({
            url:baseUrl+'upload/doupload.xhtml?vchr_domain='+domain+'&vchr_entityid='+entityid+'&fileType=1&x='+x+'&y='+y+'&w='+w+'&h='+h,
            secureuri :false,
            async: false,
            fileElementId :fileElementId,//file控件id
            dataType:'text',
            success:function(data, status){
                if(status=='success'){
                	
                	$.hyjx.alert("提示信息", "恭喜您，头像修改成功！ ", "info",
                            function() {
                		window.parent.$(".image-container.fileChecked").parent().imageupload("loadImage");
                		 window.parent.closeWin('头像上传');
                		
                	});
                   
                }
            },
            error: function(data, status, e){
                alert(e);
            }
        });
    }else{
    	$.hyjx.alert("提示信息", "请裁剪图片！ ", "info",
                function() {});
    }
};

function getImagePos() {
    var x=parseInt($('#x').val()),x1=x;
    var y=parseInt($('#y').val()),y1=y;
    var w=parseInt($('#w').val());
    var h=parseInt($('#h').val());
    var image=document.getElementById("target-img");
    var naturalW=naturalWidth;
    var naturalH=naturalHeight;
    var width2=$("#target-img").width();
    var height2=$("#target-img").height();

    var deg=$(".jc-demo-box").attr("data");
    var naWder=width2/2;
    var naHder=height2/2;

    if(deg==0){
        x=(naWder-200+x1)/width2*naturalW;
        y=(naHder-150+y)/width2*naturalW;
    }else if(deg=="90"){
        x=(y1+naWder-150)/width2*naturalW;
        y=(height2-w-x1-naHder+200)/width2*naturalW;
    }else if(deg=="180"){
        x=(width2-x1-w-naWder+200)/width2*naturalW;
        y=(height2-h-y1-naHder+150)/width2*naturalW;
    }else{
        x=(width2-h-y1-naWder+150)/width2*naturalW;
        y=(x1+naHder-200)/width2*naturalW;
    }

    w=w*naturalW/width2;
    h=h*naturalW/width2;
    if(x<0){
        w=x+w;
        x=0;
    }else if((x+w)>naturalW){
        w=naturalW-x;
    }
    if(y<0){
        h=y+h;
        y=0;
    }else if((y+h)>naturalH){
        h=naturalH-y;
    }
    return [x,y,w,h];
}

// 获得图片原始宽度、高度
function getImgNaturalDimensions(img) {
    var nWidth, nHeight;
    if (img.naturalWidth) { // 现代浏览器
        nWidth = img.naturalWidth;
        nHeight = img.naturalHeight;
        return [nWidth, nHeight];
    } else { // IE8
        var i = new Image();
        i.src = img.src;
        var nWidth = i.width;
        var nHeight = i.height;
        return [nWidth, nHeight];
    }

}