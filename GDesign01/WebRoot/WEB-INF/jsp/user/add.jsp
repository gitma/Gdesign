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
    <s:form action="user_add">
    <table>
    	<tr>
    		<td>所属部门：</td>
    		<td><s:select name="departmentId" list="#departmentList" listKey="id" listValue="name"
    				 headerKey="" headerValue="---请选择所属部门---"/></td>
    	</tr>
    	<tr>
    		<td>登录名：</td>
    		<td><s:textfield name="username"/></td>
    	</tr>
    	<tr>
    		<td>姓名：</td>
    		<td><s:textfield name="realname"/></td>
    	</tr>
    	<tr>
    		<td>密码：</td>
    		<td><s:textfield name="password"/></td>
    	</tr>
    	<tr>
    		<td>性别：</td>
    		<td>
    			<s:radio name="gender" list="#{'男':'男', '女':'女'}" />
    		</td>
    	</tr>
    	<tr>
    		<td>邮箱:</td>
    		<td>
    			<s:textfield name="email"/>
    		</td>
    	</tr>
    	<tr>
    		<td>联系电话：</td>
    		<td>
    			<s:textfield name="telephone"/>
    		</td>
    	</tr>
    	<tr>
    		<td>备注：</td>
    		<td>
    			<s:textarea name="description"/>
    		</td>
    	</tr>
    	<tr>
    		<td>岗位：</td>
    		<td>
    			<s:select name="roleIds" list="#roleList" listKey="id"  listValue="name" multiple="true" />
    		</td>
    	</tr>
    	
    	<tr>
    		<td>
    			<s:submit value="确定添加"/>
    		</td>
    		<td>
    			<s:a action="user_list">返回</s:a>
    		</td>
    	</tr>
    </table>
    </s:form>
  </body>
</html>
