<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<jsp:include page="/component/publicpage/header.jsp"></jsp:include>
<jsp:include page="/component/publicpage/layPreview.jsp"></jsp:include>
<script type="text/javascript" language="javascript">   
function rightFrameHeight() {
	if(uiLayout=='1'){
	    var ifm_right= document.getElementById("rightFrame");   
	    ifm_right.height="0px"; //不然谷歌浏览器下始终是所加载过页面的最大高度
	    var subWeb_right = document.frames ? document.frames["rightFrame"].document : ifm_right.contentDocument;   
	    if(ifm_right != null && subWeb_right != null) {
	       ifm_right.height = subWeb_right.body.scrollHeight;
	       ifm_right.width = subWeb_right.body.scrollWidth;
	    }
	}
} 
</script>
</head>
<body>
<iframe  id="rightFrame"  class="rightFrame"  
onload="rightFrameHeight();this.height=rightFrame.document.body.scrollHeight;" frameborder="0"  allowtransparency="true"
 src="<%=basePath %>common/gotoAtt.xhtml?vchr_domain=vchr_domain&vchr_entityid=vchr_entityid&fileType=1"></iframe>
</body>
</html>