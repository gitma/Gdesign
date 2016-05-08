<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title></title>
<link
	href="${pageContext.request.contextPath }/style/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/style/css/amazeui.min.css"
	rel="stylesheet">
	
	<style type="text/css">
		.self-pos{
		/* 	float:right; */
			margin-top:10px;
			padding:10px;
		}
		
	</style>
	
	<script type="text/javascript">
		function getTime(){
			var myT = new Date();
			/* console.log(d.toLocaleString()); */
			var Hour = myT.getHours();
			var Minute = myT.getMinutes();
			var Second = myT.getSeconds();
			
			var myTime = document.getElementById("time");
			
			myTime.innerHTML = (Hour<10?'0'+Hour:Hour) + ":" + (Minute<10?'0'+Minute:Minute) + ":" + (Second<10?'0'+Second:Second);
		}
		
		window.setInterval("getTime()", 1000);
		
		
	</script>
</head>
<body>
	<header class="am-topbar">
  <h1 class="am-topbar-brand">
    <a href="#">CSII</a>
  </h1>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#doc-topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="doc-topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav">
      <li class="am-active"><a target="right" href="${pageContext.request.contextPath }/main.jsp">首页</a></li>
     <%--  <li><a target="right" href="${pageContext.request.contextPath }/user_list.action">局部刷新</a></li> --%>
    </ul>

    <!-- <form class="am-topbar-form am-topbar-left am-form-inline" role="search">
      <div class="am-form-group">
        <input type="text" class="am-form-field am-input-sm" placeholder="搜索">
      </div>
    </form> -->

    <div class="am-topbar-right">
       <span class="am-badge self-pos" id="time">当前时间</span>
    </div>

    <div class="am-topbar-right">
      <a href="${pageContext.request.contextPath }/user_logoutUI.action"><span class="am-badge am-badge-secondary self-pos">用户：<i>${user.username }</i></span></a>
    </div>
  </div>
</header>
</body>
</html>
