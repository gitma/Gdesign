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
	修改
	<br />

	<%-- <s:form action="category_modify">
		<s:hidden name="id"></s:hidden>
		<s:textfield name="name">开发的项目名称：</s:textfield>
		<br />
			<table>
    		
    		<tr>
    			<td>工作日志</td>
    			<td><s:textarea rows="10" cols="50" name="description"></s:textarea></td>
    		</tr>
    		
    		</table>
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
	</s:form> --%>


	<!-- css -->
	<s:form class="form-horizontal" role="form" action="category_modify">
		<s:hidden name="id"></s:hidden>
		<div class="form-group">
			<label for="deptN" class="col-sm-2 control-label">开发的项目名称：</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textfield name="name" class="form-control" id="deptN" />
			</div>
		</div>
		<div class="form-group">
			<label for="categoryLog" class="col-sm-2 control-label">工作日志</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textarea rows="6" id="categoryLog" name="description" class="form-control"></s:textarea>
			</div>
		</div>
		<!-- 设置行距 -->
		<div class="self-height"></div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<!--  <button type="submit" class="btn btn-default">Sign in</button> -->
				<s:submit value="提交" class="btn btn-primary btn_padding"></s:submit>
				<s:a action="role_list" class="btn btn-warning btn_padding">返回</s:a>
			</div>
		</div>
	</s:form>

</body>
</html>
