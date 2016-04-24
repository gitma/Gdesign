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
	height: 40px;
}

.btn_padding {
	width: 108px;
}
</style>

</head>

<body>
	<h4>用户信息修改</h4>
	<br />
	<%-- <s:form action="user_modify">
		<s:hidden name="id"></s:hidden>
		<table>
			<tr>
				<td>所属部门：</td>
				<td><s:select name="departmentId" list="#departmentList"
						listKey="id" listValue="name" headerKey=""
						headerValue="---请选择所属部门---" /></td>
			</tr>
			<tr>
				<td>登录名：</td>
				<td><s:textfield name="username" /></td>
			</tr>
			<tr>
				<td>密码：</td>
				<td><s:textfield name="password" /></td>
			</tr>
			<tr>
				<td>性别：</td>
				<td><s:radio name="gender" list="#{'男':'男', '女':'女'}" /></td>
			</tr>
			<tr>
				<td>邮箱:</td>
				<td><s:textfield name="email" /></td>
			</tr>
			<tr>
				<td>联系电话：</td>
				<td><s:textfield name="telephone" /></td>
			</tr>
			<tr>
				<td>备注：</td>
				<td><s:textarea name="description" /></td>
			</tr>
			<tr>
				<td>岗位：</td>
				<td><s:select name="roleIds" list="#roleList" listKey="id"
						listValue="name" multiple="true" /></td>
			</tr>

			<tr>
				<td><s:submit value="确定修改" /></td>
				<td><s:a action="user_list">返回</s:a></td>
			</tr>
		</table>
	</s:form> --%>

	<s:form class="form-horizontal" role="form" action="user_modify">
		<s:hidden name="id"></s:hidden>
		<div class="form-group">
			<label for="selectedDept" class="col-sm-2 control-label">所属部门</label>
			<div class="col-sm-5">
				<!-- <input type="email" class="form-control" id="inputEmail3" placeholder="Email"> -->
				<s:select name="departmentId" list="#departmentList" listKey="id"
					listValue="name" headerKey="" headerValue="---请选择所属部门---"
					class="form-control" />
				<%-- <s:select id="selectedDept" class="form-control" name="parentId"
					list="departmentList" listKey="id" listValue="name" headKey=""
					headValue="--请选择上级部门--" /> --%>
			</div>
		</div>
		<div class="form-group">
			<label for="userN" class="col-sm-2 control-label">登录名：</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textfield name="username" class="form-control" id="userN" />
			</div>
		</div>
		<div class="form-group">
			<label for="sex" class="col-sm-2 control-label">性别：</label>
			<div class="col-sm-5">
				<s:radio name="gender" list="#{'男':'男', '女':'女'}" id="sex" />
				<!-- <textarea class="form-control" rows="6"></textarea> -->
			</div>
			<!--  <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label>
          <input type="checkbox"> Remember me
        </label>
      </div>
    </div> -->
		</div>

		<div class="form-group">
			<label for="mEmail" class="col-sm-2 control-label">邮箱:</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textfield name="email" id="mEmail" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="phone" class="col-sm-2 control-label">联系电话：</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textfield name="telephone" id="phone" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="desc" class="col-sm-2 control-label">备注</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textarea name="description" id="desc" rows="3" class="form-control"/>
			</div>
		</div>
		<div class="form-group">
			<label for="role" class="col-sm-2 control-label">岗位：</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:select name="roleIds" list="#roleList" listKey="id"
					listValue="name" multiple="true" id="role" class="form-control" />
			</div>
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
