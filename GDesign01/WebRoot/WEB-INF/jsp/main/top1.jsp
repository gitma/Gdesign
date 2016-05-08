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
	
<link
	href="${pageContext.request.contextPath }/style/css/app.css"
	rel="stylesheet">
	
	<style type="text/css">
		.self-pos{
			float:right;
		}
		
		body{
			/* background:url("${pageContext.request.contextPath }/img/top-bg.jpg");	 */
			background:#F6F8F8;
		}
	</style>
</head>
<body>
	<nav class="navbar">
		<!--<ol class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="#">Library</a></li>
        <li class="active">Data</li>
    </ol>-->
		<!-- <ul class="dropdown-menu">
        <li><a href="#">Action</a></li>
        <li><a href="#">Another action</a></li>
        <li><a href="#">Something else here</a></li>
        <li role="separator" class="divider"></li>
        <li><a href="#">Separated link</a></li>
    </ul>-->
	<%-- 	<ul class="nav nav-pills">
			<li role="presentation" class="active"><a href="#">Home</a></li>
			<li role="presentation"><a href="#">Profile</a></li>
			<li role="presentation"><s:a action="user_logoutUI">退出登录</s:a></li>
			
		</ul> --%>
<!-- Single button -->
		<div class="navbar-header bg-black">
       
        <!-- brand -->
        <a href="#/" class="self-img">
          <!-- <i class="fa fa-btc"></i> -->
          <!-- <img src="../../img/logo_05.png" > -->
          <span > <%-- <img src="${pageContext.request.contextPath }/img/oa.jpg"> --%></span>
        </a>
        <!-- / brand -->
      </div>
      
		<ul class="nav navbar-nav navbar-right">
			<li > 

           <!--  <form class="navbar-form navbar-form-sm navbar-left" ui-shift="prependTo" target=".navbar-collapse" role="search" ng-controller="TypeaheadDemoCtrl"> -->
          <!--  <div class="form-group" ng-controller="headInfo">
            <div class="input-group">
              <input style="border-left:5px;border-top:5px;border-right:5px;border-bottom:5px; " readonly="readonly" value="用户：masai">
            
            </div> 
          
        
        	</div>-->
       <!--  </form> -->
        	<div>用户：马赛</div>
        	<div>时间：19:48:49</div>
      
            </li>
            	
              <li><span style="width:72px;display:block;">&nbsp;</span></li>
			<li class="dropdown open" dropdown="">
            <a href="" class="dropdown-toggle clear" dropdown-toggle="" aria-haspopup="true" aria-expanded="true">
             <%--  <span class="">
               
                <img src="${pageContext.request.contextPath }/img/user_suit.jpg" alt="...">
              	 <i class="on md b-white bottom"></i>
              </span>
              <span class="hidden-sm hidden-md"></span> <b class="caret"></b> --%>
              <i>返回首页</i>
             
            </a>
            <!-- dropdown -->
          <%--    <ul class="dropdown-menu animated fadeInRight w">
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
          </li> --%>
		</ul>
		
		<ul>
			
		</ul>
	</nav>
</body>
</html>
