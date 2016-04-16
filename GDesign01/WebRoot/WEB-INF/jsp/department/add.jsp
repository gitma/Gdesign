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
	    <s:form action="department_add">
	    	<table>
	    		<tr>
	    			<td>上级部门</td>
	    			<td><s:select name="parentId" list="departmentList" listKey="id" listValue="name" headKey="" headValue="--请选择上级部门--"/></td>
	    		</tr>
	    	</table>
	    	
	    	职能名称：<s:textfield name="name"></s:textfield>
	    	<br/>
	    	职能描述：<s:textarea name="description" cols="20" rows="5"></s:textarea><br/>
	    	<s:submit value="确定添加"></s:submit>
	    	<s:a action="department_list">取消--返回</s:a>
	    </s:form>
  </body>
</html>
