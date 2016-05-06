<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    
<li class="dropdown open" dropdown="">
            <a href="" class="dropdown-toggle clear" dropdown-toggle="" aria-haspopup="true" aria-expanded="true">
              <span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
                <img src="../../img/a0.jpg" alt="...">
                <i class="on md b-white bottom"></i>
              </span>
              <span class="hidden-sm hidden-md"></span> <b class="caret"></b>
            </a>
            <!-- dropdown -->
            <ul class="dropdown-menu animated fadeInRight w">
              <!-- <li class="wrapper b-b m-b-sm bg-light m-t-n-xs">
                <div>
                  <p>300mb of 500mb used</p>
                </div>
                <progressbar value="60" class="progress-xs m-b-none bg-white"></progressbar>
              </li> -->
              <!-- <li>
                <a href>
                  <span class="badge bg-danger pull-right">30%</span>
                  <span>Settings</span>
                </a>
              </li> -->
              <li>
                <a href="../pwdmod/mod/index.html">
                <span>修改密码<span>
                </span></span></a>
              </li>
              <li style="display:none">
                <a ui-sref="app.docs">
                  <span class="label bg-info pull-right">new</span>
                  Help
                </a>
              </li>
              <li class="divider"></li>
              <li>
                <a href="#" ng-click="logout()" target="_self">
         		 <span>退出</span>
      			</a>
              </li>
            </ul>
            <!-- / dropdown -->
          </li>
  </body>
</html>
