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
    周报审核<br/>
    	<s:form >
    		<s:hidden name="userId"/>
    		<table>
	    		<tr>
	    			<th><input type="checkbox">选项</th>
	    			<th>提交日期</th>
	    			<th>项目名称</th><!-- 项目详细    detail -->
	    			<th>周报状态</th>
	    			<!-- <th>使用ip</th> -->
	    			<th>提交人</th>
	    			<th>所属部门</th>
	    			<th>管理</th>
	    		</tr>
    			
    			<!-- 判断是否有可查询的周报 -->
    			<s:if test="#categoryList!=null">
	    			<s:iterator id="category" value="categoryList" status="st">
	    				<tr>
	    					<td><input type="checkbox"/><s:property value="#st.index+1"/></td><!-- 输出当前元素索引 -->
	    					<td><s:date name="#category.createdTime" format="yyyy-MM-dd"/><%-- <s:property value="#category.createdTime"/> --%></td>
	    					<td><s:property value="#category.name"/></td>
	    					<td>
	    						<!-- 判断状态如果为NULL 或者为0 则显示正在审核中， 否则显示，审核通过 -->
	    						<s:if test="#category.status==1">
	    							审核通过
	    						</s:if>
	    						<s:elseif test="#category.status==2">审核未通过</s:elseif>
	    						<s:else>正在审核中</s:else>
	    						<%-- <s:property value="#category.status"/> --%>
	    					</td>
	    					<td><s:property value="#category.user.username"/></td>
	    					<td><s:property value="#category.department.name"/></td>
	    					<td>
	    						<s:a action="audit_auditUI?categoryId=%{id}">进入审核中...</s:a>
	    					</td>
	    				</tr>
	    			</s:iterator>
    			</s:if>
    			
    		</table>
    	</s:form>
  </body>
</html>
