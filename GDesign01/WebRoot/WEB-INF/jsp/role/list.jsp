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
    列表<br/>
    <table>
    <thead>
    	<tr>
    		<td>职位名称：</td>
    		<td>信息描述：</td>
    		<td>相关操作：</td>
    	</tr>
    </thead>
    
    <tbody>
	     <s:iterator value="#roleList">
	    	<tr>
	    		<td><s:property value="%{name}"/></td>
	    		<td><s:property value="%{description}"/></td>
	    		<td><s:a action="role_delete?id=%{id}" onclick="return confirm('确定要删除吗?')">删除</s:a>
	    					<s:a action="role_modifyUI?id=%{id}">修改</s:a>
	    					<s:a action="role_privilegeUI?id=%{id}">修改权限</s:a>
	    	</tr>
	    </s:iterator>
    </tbody>
    
    <tr>
    	<td>
    		<s:a action="role_addUI">添加</s:a>
    	</td>
    </tr>
    </table>
  </body>
</html>
