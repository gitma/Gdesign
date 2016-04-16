<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    添加<br/>
    <s:form action="role_add">
	    <table>
	    	<tr>
	    		<td>职位名称</td>
	    		<td><s:textfield name="name"/></td>
	    	</tr>
	    	<tr>
	    		<td>职位描述</td>
	    		<td><s:textfield name="description"/></td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<s:submit value="确定添加"/>
	    		</td>
	    		<td>
	    			<s:a action="role_list">返回</s:a>
	    		</td>
	    	</tr>
	    </table>
    </s:form>
  </body>
</html>
