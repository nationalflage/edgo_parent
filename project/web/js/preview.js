
var fileName;
//以下为上传头像用
function previewImage(file, imageHead, preview, width_, height_,picture_name,fileElementId) {
	var MAXWIDTH = 100;
	var MAXHEIGHT = 100;
	var div = document.getElementById(preview);
	div.style.display = "block";
	var fileNames ="jpg,jpeg,gif,png";		
	
	var fileSuffix= (file.value).substring((file.value).lastIndexOf("\.")+1);
	if(fileNames.indexOf(fileSuffix.toLowerCase())<0){
		$.hyjx.alert("提示信息","请选择jpg、jpeg、gif、png格式的图片");
		return false ;
	}
	if (file.files && file.files[0]) {
		div.innerHTML = "<img id=" + imageHead + ">";
		var img = document.getElementById(imageHead);
		img.onload = function() {
			var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth,
					img.offsetHeight);
			img.width = width_;
			img.height = height_;
			img.style.marginLeft = 3 + 'px';
			img.style.marginTop = 3 + 'px';
		}
		var reader = new FileReader();
		reader.onload = function(evt) {
			img.src = evt.target.result;
		}
		reader.readAsDataURL(file.files[0]);
		savePhoto(picture_name,fileElementId);
	} else {
         $.ajaxFileUpload({
             url:baseUrl+'upload/doupload.xhtml?vchr_domain=userPhoto&fileType=1',
             secureuri :false,
             async: true,
             fileElementId :fileElementId,//file控件id
             dataType:'text',
             success:function(data, status){
             	//alert(data);
             	 if(status=='success'){
             		if(data.indexOf("\\")>=0){
             			//alert("windows");
             			var name= data.split("\\")[3];
             			//alert(name);
             			fileName=name;
             			$("#"+picture_name).val(fileName);
             			savePhotoIe9(baseUrl+"upload/getPreview.xhtml?fileName="+fileName,div,imageHead,width_, height_);
             		}else{
             			var name= data.split("\/")[3];
             			fileName=name;
             			$("#"+picture_name).val(fileName);
             			savePhotoIe9(baseUrl+"upload/getPreview.xhtml?fileName="+fileName,div,imageHead,width_, height_);
             		}
             	} 
             },
             error: function(data, status, e){
                 alert(e);
             }
     	});
	}
	//photoChangFlagFn();
	
	
}
function clacImgZoomParam(maxWidth, maxHeight, width, height) {
	var param = {
		top : 0,
		left : 0,
		width : width,
		height : height
	};
	if (width > maxWidth || height > maxHeight) {
		rateWidth = width / maxWidth;
		rateHeight = height / maxHeight;

		if (rateWidth > rateHeight) {
			param.width = maxWidth;
			param.height = Math.round(height / rateWidth);
		} else {
			param.width = Math.round(width / rateHeight);
			param.height = maxHeight;
		}
	}

	param.left = Math.round((maxWidth - param.width) / 2);
	param.top = Math.round((maxHeight - param.height) / 2);
	return param;
}
/*$(function(){
	  $(".previewImage").each(function(){
	    $(this).html(" <A class=btn_addPic href=\"javascript:void(0);\"><SPAN><EM>+</EM>选择图片</SPAN> "+
	    "<INPUT  onchange=\"previewImage(this,'imghead"+$(this).attr("id")+"','"+$(this).attr("imgid")+"','"+$(this).attr("width")+"','"+$(this).attr("height")+"')\"  class=filePrew  id=\"file"+$(this).attr("id")+"\" name=\"file\""+ 
	   " title=支持jpg、jpeg、gif、png格式， tabIndex=3 type=\"file\" size=3 name=pic  ></A>");
	    $("#"+$(this).attr("imgid")).html("<image id= 'imghead"+$(this).attr("id")+"' width='"+$(this).attr("width")+"'  height='"+$(this).attr("height")+"'  src='"+$(this).attr("filename")+"' />");
	  });
});*/
/*var photoChangFlagFn;
function setPhotoChangeFlagFun(fn){
	photoChangFlagFn=fn;
}*/

function savePhoto(picture_name,fileElementId){
	
	$.ajaxFileUpload({
        url:baseUrl+'upload/doupload.xhtml?vchr_domain=userPhoto&fileType=1',
        secureuri :false,
        async: true,
        fileElementId :fileElementId,//file控件id
        dataType:'text',
        success:function(data, status){
        	 if(status=='success'){
        		if(data.indexOf("\\")>=0){
        			var name= data.split("\\")[3];
        			fileName=name;
        			$("#"+picture_name).val(fileName);
        			return fileName;
        		}else{
        			var name= data.split("\/")[3];
        			fileName=name;
        			$("#"+picture_name).val(fileName);
        			return fileName;
        		}
        	} 
        },
        error: function(data, status, e){
            alert(e);
        }
	});
}


function savePhotoIe9(srctmp,div,imageHead,width_, height_){
      var src = srctmp;
      div.innerHTML = "<img id=" + imageHead + ">";
	  var img = document.getElementById(imageHead);
	  $(img).attr("src",src);
	  $(img).attr("width",width_);
	  $(img).attr("height",height_);
}
//上传头像结束