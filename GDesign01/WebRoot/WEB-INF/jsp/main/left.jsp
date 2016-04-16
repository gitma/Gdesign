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
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
  </head>
  
  <body>
<%--     左<br>
    <ul id="main">
    	显示一级菜单
    	<s:iterator value="#application.privilegeTopList">
    		<li>${name }
    			<ul>
    				显示二级菜单
    				<s:iterator value="children">
    					<li><a target="right" href="${pageContext.request.contextPath }${url }.action">${name}</a></li>
    				</s:iterator>
    			</ul>
    		</li>
    	</s:iterator>
    </ul>
     --%>
    
    <ul class="list-group" id="main">
    <%--显示一级菜单 --%>
    	<s:iterator value="#application.privilegeTopList">
	    <li class="list-group-item">
	        <span class="badge">14</span>
	        ${name }
	        <ul class="list-group">
    				<%--显示二级菜单 --%>
    				<s:iterator value="children">
    					<li class="list-group-item"><a target="right" href="${pageContext.request.contextPath }${url }.action">${name}</a></li>
    				</s:iterator>
    		</ul>
	    </li>
	    </s:iterator>
	</ul>
  </body>
</html>
