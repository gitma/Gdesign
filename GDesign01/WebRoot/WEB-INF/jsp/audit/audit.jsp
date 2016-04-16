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
    
    <title>My JSP 'audit.jsp' starting page</title>
    
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
    项目审核<br/>
    <s:form>
    	<table>
    		<tr>
    			<td>提交人姓名：</td>
    			<td>${user.username }</td>
    		</tr>
    		<tr>
    			<td>提交日期：</td>
    			<td>起始日期：${createdTime }<s:textfield name="createdTime"/>结束日期<s:property value="lastModifyTime"/></td>
    		</tr>
    		<tr>
    			<td>周报名称：</td>
    			<td>${name }<s:property value="name"/></td>
    		</tr>
    		<tr>
    			<td>周报详情：</td>
    			<td><s:textarea name="description" rows="10" cols="20" readonly="true"/><s:property value="description"/></td>
    		</tr>
    		
    		<tr>
    			<td><s:a action="audit_pass?categoryId=%{id}">通过</s:a></td>
    			<td><s:a action="audit_unpass?categoryId=%{id}">不通过</s:a></td>
    		</tr>
    	</table>
    </s:form>
  </body>
</html>
