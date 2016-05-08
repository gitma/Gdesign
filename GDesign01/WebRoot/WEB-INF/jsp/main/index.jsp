<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>

    <frameset rows="50, *"  framespacing=0 border=0 frameborder=1>
    	<frame name="top" scrolling="no" noresize src="${pageContext.request.contextPath}/main_top.action">
    	<frameset cols="250, *">
    		<frame name="left" scrolling="yes" noresize src="${pageContext.request.contextPath}/main_left.action">
    		<frame name="right" scrolling="yes" noresize src="${pageContext.request.contextPath}/main_right.action">
    	</frameset>
    	<%-- <frame  scrolling="no" noresize src="${pageContext.request.contextPath}/main_foot.action"> --%>
    </frameset>
    <noframes>
  <body>

  </body>
  </noframes>
</html>
