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
   <h4>添加角色</h4>
    <%-- <s:form action="role_add">
	    <table>
	    	<tr>
	    		<td>职位名称</td>
	    		<td><s:textfield name="name"/></td>
	    	</tr>
	    	<tr>
	    		<td>职位描述</td>
	    		<td><s:textfield name="description"/></td>
	    	</tr>
	    	<tr>
	    		<td>
	    			<s:submit value="确定添加"/>
	    		</td>
	    		<td>
	    			<s:a action="role_list">返回</s:a>
	    		</td>
	    	</tr>
	    </table>
    </s:form> --%>
    <!-- css -->
    <s:form class="form-horizontal" role="form" action="role_add">
		<div class="form-group">
			<label for="roleN" class="col-sm-2 control-label">职位名称</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textfield name="name" class="form-control" id="roleN" />
			</div>
		</div>
		<div class="form-group">
			<label for="roleDesc" class="col-sm-2 control-label">职位描述</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textfield name="description" id="roleDesc" class="form-control"/>
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
