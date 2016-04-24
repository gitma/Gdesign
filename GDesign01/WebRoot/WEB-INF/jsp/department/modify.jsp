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
	href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
<style type="text/css">
.self-height {
	height: 100px;
}

.btn_padding {
	width: 108px;
}
</style>
</head>

<body>
	<h4>部门修改页面</h4>
	<br />

	<%-- <s:form action="department_modify">
		<s:hidden name="id"></s:hidden>
		<table>
		<tr>
			<td>上级部门</td>
	    	<td><s:select name="parentId" list="departmentList" listKey="id" listValue="name" headKey="" headValue="--请选择上级部门--"/></td>
		</tr>
		</table>
		<s:textfield name="name">名称</s:textfield>
		<br />
		描述：<s:textarea cols="20" rows="5" name="description"></s:textarea>
		<s:submit value="提交"></s:submit>
		<s:a action="department_list">取消</s:a>
	</s:form> --%>
	<!-- --------------------- -->

	<s:form class="form-horizontal" role="form" action="department_modify">
		<s:hidden name="id"></s:hidden>
		<div class="form-group">
			<label for="selectedItem" class="col-sm-2 control-label">上级部门</label>
			<div class="col-sm-5">
				<!-- <input type="email" class="form-control" id="inputEmail3" placeholder="Email"> -->
				<s:select id="selectedItem" class="form-control" name="parentId"
					list="departmentList" listKey="id" listValue="name" headKey=""
					headValue="--请选择上级部门--" />
			</div>
		</div>
		<div class="form-group">
			<label for="deptN" class="col-sm-2 control-label">部门名称</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textfield name="name" class="form-control" id="deptN" />
			</div>
		</div>
		<div class="form-group">
			<label for="deptDesc" class="col-sm-2 control-label">部门描述</label>
			<div class="col-sm-5">
				<s:textarea class="form-control" rows="6" name="description"></s:textarea>
			</div>
			<!--  <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>
    </div> -->
		</div>
		<!-- 设置行距 -->
		<div class="self-height"></div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<!--  <button type="submit" class="btn btn-default">Sign in</button> -->
				<s:submit value="提交" class="btn btn-primary btn_padding"></s:submit>
				<s:a action="department_list" class="btn btn-warning btn_padding">返回</s:a>
			</div>
		</div>
	</s:form>

</body>
</html>
