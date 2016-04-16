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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
  </head>
  
  <body>
  <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading">部门列表</div>
        <!-- <div class="panel-body">
        </div> -->

        <!-- Table -->
        <table class="table">
     	   <!-- 表头 -->
            <tr>
	            <th>部门名称</th>
	            <th>上级部门名称</th>
	            <th>部门描述</th>
	            <th>相关操作</th>
            </tr>
            <!-- 显示数据列表 -->
    	<tbody datakey="departmentList">
    		<s:iterator value="departmentList">
	    		<tr>
	    			<!-- 部门名称 -->
	    			<td>名称：<%-- <s:property value="%{name}"/> --%><s:a action="department_list?parentId=%{id}">${name }</s:a></td>
	    			
	    			<!-- 上级部门名称 -->
	    			<td>---上级名称：<s:property value="%{parent.name}"/></td>
	    			
	    			<!-- 部门信息描述 -->
	    			<td>描述：<s:property value="%{description}"/></td>
	    			
	    			<!-- 相关操作 -->
	    			<td><s:a action="department_delete?id=%{id}" onclick="return confirm('确定要删除吗?')">删除</s:a>
    					<s:a action="department_modifyUI?id=%{id}">修改</s:a>
    					<s:a action="department_addUI">添加</s:a><br/>
    				</td>
	    		</tr>
    		</s:iterator>
    		
    	</tbody>
        </table>
    </div>
 <%--    列表<br/>
    <table>
    	<!-- 表头 -->
    	<thead>
	    	<tr><td>部门名称</td>
	    		<td>上级部门名称</td>
	    		<td>部门描述</td>
	    		<td>相关操作</td>
	    	</tr>
    	</thead>
    	
    	<!-- 显示数据列表 -->
    	<tbody datakey="departmentList">
    		<s:iterator value="departmentList">
	    		<tr>
	    			<!-- 部门名称 -->
	    			<td>名称：<s:property value="%{name}"/><s:a action="department_list?parentId=%{id}">${name }</s:a></td>
	    			
	    			<!-- 上级部门名称 -->
	    			<td>---上级名称：<s:property value="%{parent.name}"/></td>
	    			
	    			<!-- 部门信息描述 -->
	    			<td>描述：<s:property value="%{description}"/></td>
	    			
	    			<!-- 相关操作 -->
	    			<td><s:a action="department_delete?id=%{id}" onclick="return confirm('确定要删除吗?')">删除</s:a>
    					<s:a action="department_modifyUI?id=%{id}">修改</s:a>
    					<s:a action="department_addUI">添加</s:a><br/>
    				</td>
	    		</tr>
    		</s:iterator>
    		
    	</tbody>
    </table> --%>
  </body>
</html>
