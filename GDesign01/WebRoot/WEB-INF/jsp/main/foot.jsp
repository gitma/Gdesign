<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/css/amazeui.min.css">
	<style type="text/css">
	
		body{
		font-size:14px;background:#dfe8f6;width:100%;overflow:hidden;
		text-align:center;
		}
	</style>
  </head>
  
  <body>
   <footer>

          <p>由 just零度--yycat</a>
            提供技术支持,<a href="https://github.com/gitma/Gdesign" title="yycat"
                                                target="_blank">源码查看---></a>点击此处</p>
        <p>CopyRight©2014  AllMobilize Inc.</p>
        <p>京ICP备13033158</p>
  </footer>
  </body>
</html>
