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
    
    <title>My JSP 'audit.jsp' starting page</title>
    
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
    项目审核<br/>
   <%--  <s:form>
    	<table>
    		<tr>
    			<td>提交人姓名：</td>
    			<td>${user.username }</td>
    		</tr>
    		<tr>
    			<td>提交日期：</td>
    			<td>起始日期：${createdTime }<s:textfield name="createdTime"/>结束日期<s:property value="lastModifyTime"/></td>
    		</tr>
    		<tr>
    			<td>周报名称：</td>
    			<td>${name }<s:property value="name"/></td>
    		</tr>
    		<tr>
    			<td>周报详情：</td>
    			<td><s:textarea name="description" rows="10" cols="20" readonly="true"/><s:property value="description"/></td>
    		</tr>
    		
    		<tr>
    			<td><s:a action="audit_pass?categoryId=%{id}">通过</s:a></td>
    			<td><s:a action="audit_unpass?categoryId=%{id}">不通过</s:a></td>
    		</tr>
    	</table>
    </s:form> --%>
    
    <!-- css -->
	<s:form class="form-horizontal" role="form" action="">
		<s:hidden name="id"></s:hidden>
		<div class="form-group">
			<label for="user" class="col-sm-2 control-label">提交人</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<label class="col-sm-2 control-label">${user.username }</label>
				<%-- <s:textfield name="#user.username" class="form-control" id="user" /> --%>
			</div>
		</div>
		<div class="form-group">
			<label for="createdTime" class="col-sm-2 control-label">提交日期：</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				From:<s:textfield id="createdTime" name="createdTime" readonly="true"></s:textfield>
				&nbsp;&nbsp;&nbsp;
				To:<s:textfield id="lastModifyTime" name="lastModifyTime" readonly="true"></s:textfield>
			</div>
		</div>
		<div class="form-group">
			<label for="name" class="col-sm-2 control-label">周报名称：</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textfield name="name" class="form-control" id="name" readonly="true"/>
			</div>
		</div>
		<div class="form-group">
			<label for="description" class="col-sm-2 control-label">周报详情：</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<%-- <s:textfield name="#user.username" class="form-control" id="user" /> --%>
				<s:textarea name="description" rows="10" readonly="true" class="form-control"/>
			</div>
		</div>
		<!-- 设置行距 -->
		<div class="self-height"></div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<!--  <button type="submit" class="btn btn-default">Sign in</button> -->
				<s:a action="audit_pass?categoryId=%{id}" class="btn btn-primary btn_padding">通过</s:a>
				<s:a action="audit_unpass?categoryId=%{id}" class="btn btn-warning btn_padding">不通过</s:a>
			</div>
		</div>
	</s:form>
  </body>
</html>
