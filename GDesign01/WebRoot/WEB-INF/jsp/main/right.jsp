<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery.js"></script>
	<style type="text/css">
	
		body{
		font-size:12px;background:#dfe8f6;width:100%;overflow:hidden;
		}
	</style>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/css/amazeui.min.css">
	<style type="text/css">
	
		body{
		font-size:14px;background:#dfe8f6;width:100%;overflow:hidden;
		text-align:center;
		}
	</style>
  </head>
  
  <!-- 载入初始化页面 -->
  <script>
  	$(function(){
  		var init = ""
			 +"<div class='wel'>"
			 +"<div><!--<img src='img/logo.jpg' /> --></div>"
			 +"<div style='margin:40px 0 0 10px;'><img src='img/guide.png' /></div>"
			 +"<div style='padding:20px 0 0 55px;color:#333333;'>点击“^”或“v”展开或关闭菜单<hr>"
			 +"<b>点解导航栏中登陆的用户退出登录</b></div>"
			 +"<a href='#' style='width:150px;line-height:16px;margin:40px 0 0 50px;background:url() no-repeat;padding-left:20px;color:red;font-weight:bold;text-decoration:underline;display:block;'></a>"
			 +"</div>"
			 +"<div style='text-align:center;padding-top:5px;'>Power By mas 2016</div>";
		
		
		//页面高度
		var Height = "500px";
		
		$(".content").height(Height);
		$(".right").height(Height);
		
		//初始化页面
		$(".content_text").append(init);//载入欢迎界面
  	});
  </script>
  <body>
   	<div class="content">
   		<div class="content_nav"></div>
   		<div class="content_text"></div>
   	</div>
   	
   	<footer>

          <p>由 just零度--yycat</a>
            提供技术支持,<a href="https://github.com/gitma/Gdesign" title="yycat"
                                                target="_blank">源码查看---></a>点击此处</p>
        <p>CopyRight©2014  AllMobilize Inc.</p>
        <p>京ICP备13033158</p>
  </footer>
  </body>
</html>
	