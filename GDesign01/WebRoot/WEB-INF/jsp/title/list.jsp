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
    	<%-- <!-- 表头 -->
    	<thead>
	    	<tr><td>类别名称</td>
	    		<td>子类别数目</td>
	    		<td>创建时间</td>
	    		<td>最后修改时间</td>
	    		<td>更多操作</td>
	    	</tr>
    	</thead>
    	
    	<!-- 显示数据列表 -->
    	<tbody >
    		<s:iterator value="#categoryList">
	    	<tr>
	    		<td><!-- 类别名称 -->
	    			<s:a action="category_show?id=%{id}"><s:property value="%{name}"/></s:a></td>
	    		<td><!-- 子类别数目 -->
	    			<s:property value="%{description}"/></td>
	    		<td><!-- 创建时间 -->
	    			<s:property value="%{createdTime}"/></td>
	    		<td><!-- 最后修改时间 -->
	    			<s:property value="%{lastModifyTime}"/></td>	
	    		<td><!-- 删除、修改 -->
	    			<s:a action="category_delete?id=%{id}" onclick="return confirm('确定要删除吗?')">删除</s:a>
	    			<s:a action="category_modifyUI?id=%{id}">修改</s:a>
	    			
	    	</tr>
	    </s:iterator>
	    <s:a action="category_addUI">添加</s:a>
    	</tbody> --%>
    </table>
  </body>
</html>
