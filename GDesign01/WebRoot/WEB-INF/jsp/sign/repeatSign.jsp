<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   

<!DOCTYPE html>
<html>
<head>
	<title></title>
<link href="${pageContext.request.contextPath }/style/css/bootstrap.min.css" rel="stylesheet">  
     <script src="${pageContext.request.contextPath }/script/angular.js"></script>  
     <script src="${pageContext.request.contextPath }/script/ui-bootstrap-tpls.min.js"></script>
     <style type="text/css">
     	.self-width{
     		width:150px;
     	}
     	
     	body{
     		background:#dfe8f6;width:100%;
     	}
     </style>
<meta charset="utf-8">
</head>
<body>
    
    	<div>您已签过到，不必重复签到！</div>

</html>