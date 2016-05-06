<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/css/amazeui.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery.js"></script>
	<style type="text/css">
		body{
		font-size:15px;width:100%;/* overflow:hidden; */
		background:#fefeef;
		}
		ul{
		list-style:none  outside;
		}
		a{text-decoration:none;color:#000000;}
		.ul-toggle{
			/* width:25px;
			height:25px; */
			/* background:url(${pageContext.request.contextPath}/img/minus.gif); */
			cursor:pointer;
		}
		.first_ul{
			font-size:17px;
		}
		
		::-webkit-scrollbar {
			width: 0px;
			height:0px;
		}
	</style>
  </head>
  
  <body>
<%--     左<br>
    <ul id="main">
    	显示一级菜单
    	<s:iterator value="#application.privilegeTopList">
    		<li>${name }
    			<ul>
    				显示二级菜单
    				<s:iterator value="children">
    					<li><a target="right" href="${pageContext.request.contextPath }${url }.action">${name}</a></li>
    				</s:iterator>
    			</ul>
    		</li>
    	</s:iterator>
    </ul>
     --%>
    <div class="left">
    <nav class="navbar-default navbar-side" >
    <ul id="main"  class="sidebar-collapse">
    <%--显示一级菜单 --%>
    	<s:iterator value="#application.privilegeTopList">
	    <li>
	        <span class="ul-toggle glyphicon glyphicon-minus first_ul"></span>
	        <span class="first_ul">${name }</span>
	        <ul class="second nav nav-second-level">
    				<%--显示二级菜单 --%>
    				<s:iterator value="children">
    					<li class="am-list am-list-static am-list-border"><a target="right" href="${pageContext.request.contextPath }${url }.action">${name}</a></li>
    				</s:iterator>
    		</ul>
	    </li>
	    </s:iterator>
	</ul>
	</nav>
	</div>
	<script>
	
	$(function(){
		//折叠树效果
		$('.ul-toggle').click(function(){
			if($(this).siblings('ul.second').is(':visible')){
				$(this).siblings('.second').hide();//css("background-color", "#636");
			
				/*设置展开、折叠标识*/
				$(this).removeClass("glyphicon glyphicon-minus");
				$(this).addClass("glyphicon glyphicon-plus");
				/* $(this).css("background", "url(${pageContext.request.contextPath}/img/plus.gif)"); */
				/* console.log("111111111111"); */
			}else{
			/* 	console.log($(this).siblings("222")); */
				$(this).siblings('.second').show();//css("background-color", "#321");
				$(this).removeClass("glyphicon glyphicon-plus");
				$(this).addClass("glyphicon glyphicon-minus");
				/* $(this).css("background", "url(${pageContext.request.contextPath}/img/minus.gif)"); */
			}
		});
		
		//设置鼠标停选二级子菜单后样式效果
	});
		
	</script>
  </body>
</html>
