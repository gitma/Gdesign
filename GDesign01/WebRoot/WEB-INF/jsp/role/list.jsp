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
	href="${pageContext.request.contextPath }/style/css/amazeui.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">

<style type="text/css">
.self-height {
	height: 40px;
}

.btn_padding {
	width: 128px;
}

.self_table {
	width: 800px;
}
</style>
</head>

<body>
	列表
	<br />
	<!-- am-table am-table-bordered am-table-striped am-text-nowrap ||   am-table am-table-bordered am-table-radius am-table-striped-->
	<table
		class="am-table am-table-bordered am-table-striped am-text-nowrap self_table">
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
					<td><s:property value="%{name}" /></td>
					<td><s:property value="%{description}" /></td>
					<td><s:a action="role_delete?id=%{id}"
							onclick="return confirm('确定要删除吗?')">删除</s:a> <s:a
							action="role_modifyUI?id=%{id}">修改</s:a> <s:a
							action="role_privilegeUI?id=%{id}">修改权限</s:a>
				</tr>
			</s:iterator>
		</tbody>


	</table>
	<div class="self-height"></div>
	<div class="form-group">
		<div class="col-sm-offset-5 col-sm-10">
			<!-- <input type="email" class="form-control" id="inputEmail3" placeholder="Email"> -->
			<s:a action="role_addUI" class="btn btn-primary btn_padding">添加新角色</s:a>
		</div>
	</div>
	<%-- <s:a action="role_addUI">添加</s:a> --%>
</body>
</html>
