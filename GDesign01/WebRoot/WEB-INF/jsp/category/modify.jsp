<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/css/amazeui.min.css">
</head>

<body>
	修改
	<br />

	<s:form action="category_modify">
		<s:hidden name="id"></s:hidden>
		<%-- <s:textfield name="name">开发的项目名称：</s:textfield> --%>
		<br />
		<%-- 	<table>
    		
    		<tr>
    			<td>工作日志</td>
    			<td><s:textarea rows="10" cols="50" name="description"></s:textarea></td>
    		</tr>
    		
    		</table> --%>
		<div class="am-scrollable-horizontal">
			<table
				class="am-table am-table-bordered am-table-striped am-text-nowrap">
				<tr>
					<th><s:textfield name="name">开发的项目名称：</s:textfield></th>
				</tr>
				<tr>
					<td>工作日志</td>
					<td><s:textarea rows="10" cols="50" name="description"></s:textarea></td>
				</tr>
			</table>
		</div>
		<s:submit value="提交"></s:submit>
		<s:a action="category_list">取消</s:a>
	</s:form>


</body>
</html>
