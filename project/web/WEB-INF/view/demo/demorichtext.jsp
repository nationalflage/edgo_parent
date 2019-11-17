<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" >
    <jsp:include page="/component/publicpage/header.jsp"></jsp:include>
    <title>富文本</title>
</head>
<body>
    <form>
        <textarea class="hy-richtext" name="editor" id="editor" rows="10" cols="80">
            This is my textarea to be replaced with CKEditor.
        </textarea>
        <input type="button" onclick="show()" value="弹出文本框的内容"/>
    </form>
    <script src="<%=basePath %>\component\ckeditor\ckeditor.js"></script>
    <script>
        function show(){
            alert($(".hy-richtext").richtext("getValue"));
        }
        // Replace the <textarea id="editor1"> with a CKEditor
        // instance, using default configuration.
      /*
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
 			CKEDITOR.config.toolbar = 'Full'; */
    </script>
</body>
</html>