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
    	<s:form action="category_add">
    		<s:hidden name="userId"/>
    		<table>
    		<tr>
    			<td>提交人</td>
    			<td>User:${user.username }</td>
    			<td></td>
    		</tr>
    		<tr>
    			<td>期次</td>
    			<td><input type="text" name="createdTime"><input type="text" name="lastModifyTime"></td>
    			<td>从2016-03-28 到2016-05-01</td>
    		</tr>
    		<tr>
    			<td>开发的项目</td>
    			<td><input type="text" name="name"></td>
    			<td></td>
    		</tr>
    		<tr>
    			<td>所属的部门</td>
    			<td><s:select name="departmentId" list="departmentList" listKey="id" listValue="name"/></td>
    			<td>数据库Department中读取</td>
    		</tr>
    		<tr>
    			<td>计划完成百分比</td>
    			<td><input type="text" name="jobPercent"></td>
    			<td>1-100%</td>
    		</tr>
    		<tr>
    			<td>工作类型</td>
    			<td><%-- <s:select list="" name=""/> --%></td>
    			<td>从数据库title中读取</td>
    		</tr>
    		
    		<tr>
    			<td><s:submit value="添加周报"></s:submit></td>
    		</tr>
    		</table>
    	</s:form>
    	
    <%-- <table>
    	<!-- 表头 -->
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
    	</tbody>
    </table> --%>
  </body>
</html>
