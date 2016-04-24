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
</style>
</head>

<body>
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">用户 列表</div>
		<table
			class="am-table am-table-bordered am-table-radius am-table-striped">
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
				<s:iterator id="user" value="recordList">
					<tr>
						<td><s:property value="#user.username" /></td>
						<td><s:property value="#user.realname" /></td>
						<td><s:property value="#user.department.name"/></td>
						<td><s:property value="#user.email" /></td>
						<td><s:property value="#user.description"></s:property>
						<td><s:a action="user_delete?id=%{id}"
								onclick="return confirm('确定要删除吗?')">删除</s:a> <s:a
								action="user_modifyUI?id=%{id}">修改</s:a>
					</tr>
				</s:iterator>
			</tbody>

		</table>
		
		<!-- 增加行高 -->
		<div class="self-height"></div>
		<div class="form-group">
			<div class="col-sm-offset-9 col-sm-10">
				<!-- <input type="email" class="form-control" id="inputEmail3" placeholder="Email"> -->
				<s:a action="user_addUI" class="btn btn-primary btn_padding">注册新员工</s:a>
			</div>
		</div>
		<div>
			
		</div>

		
	</div>
	
	<!-- 设置分页 -->
		<ul data-am-widget="pagination"
			class="am-pagination am-pagination-default">

			<li class="am-pagination-first "><s:a
					action="user_list?pageNo=1">第一页</s:a></li>

			<li class="am-pagination-prev "><s:a
					action="user_list?pageNo=%{pageNo-1}">上一页</s:a></li>

			<s:iterator begin="%{beginIndex}" end="%{endIndex}" var="num">
				<s:if test="#num==pageNo">
					<li class="am-active"><s:a
							action="user_list?pageNo=%{num}" class="am-active">${num }</s:a></li>
				</s:if>
				<s:else>
					<li class=""><s:a action="user_list?pageNo=%{num}">${num }</s:a></li>
				</s:else>
				<%-- <li><a href="#">${num }</a></li> --%>

			</s:iterator>

			<li class="am-pagination-next "><s:a
					action="user_list?pageNo=%{pageNo+1}">下一页</s:a></li>

			<li class="am-pagination-last "><s:a
					action="user_list?pageNo=%{totalPage}">最末页</s:a></li>
		</ul>
</body>
</html>
