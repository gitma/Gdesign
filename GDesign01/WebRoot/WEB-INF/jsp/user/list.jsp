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
    		<td>登录名：</td>
    		<td>真实姓名：</td>
    		<td>所属部门：</td>
    		<td>电子邮件：</td>
    		<td>信息描述：</td>
    		<td>相关操作：</td>
    	</tr>
    </thead>
    
    <tbody>
	     <s:iterator value="#userList">
	    	<tr>
	    		<td><s:property value="%{username}"/></td>
	    		<td><s:property value="%{realname}"/></td>
	    		<td>${department.name}</td>
	    		<td><s:property value="%{email}"/></td>
	    		<td><s:property value="%{description}"></s:property>
	    		<td><s:a action="user_delete?id=%{id}" onclick="return confirm('确定要删除吗?')">删除</s:a>
	    					<s:a action="user_modifyUI?id=%{id}">修改</s:a>
	    	</tr>
	    </s:iterator>
    </tbody>
    
    <tr>
    	<td>
    		<s:a action="user_addUI">添加</s:a>
    	</td>
    </tr>
    </table>
  </body>
</html>
