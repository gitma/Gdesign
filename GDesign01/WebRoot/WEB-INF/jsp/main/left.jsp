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
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/bootstrap.min.js"></script>
	
	<style type="text/css">
		body{
			background:#DFE8F6;
		}
		#main-nav {
            margin-left: 1px;
        }
 
            #main-nav.nav-tabs.nav-stacked > li > a {
                padding: 10px 8px;
                font-size: 12px;
                font-weight: 600;
                color: #4A515B;
                background: #E9E9E9;
                background: -moz-linear-gradient(top, #FAFAFA 0%, #E9E9E9 100%);
                background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#FAFAFA), color-stop(100%,#E9E9E9));
                background: -webkit-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
                background: -o-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
                background: -ms-linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
                background: linear-gradient(top, #FAFAFA 0%,#E9E9E9 100%);
                filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9');
                -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA', endColorstr='#E9E9E9')";
                border: 1px solid #D5D5D5;
                border-radius: 4px;
            }
 
                #main-nav.nav-tabs.nav-stacked > li > a > span {
                    color: #4A515B;
                }
 
                #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover {
                    color: #FFF;
                    background: #3C4049;
                    background: -moz-linear-gradient(top, #4A515B 0%, #3C4049 100%);
                    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#4A515B), color-stop(100%,#3C4049));
                    background: -webkit-linear-gradient(top, #4A515B 0%,#3C4049 100%);
                    background: -o-linear-gradient(top, #4A515B 0%,#3C4049 100%);
                    background: -ms-linear-gradient(top, #4A515B 0%,#3C4049 100%);
                    background: linear-gradient(top, #4A515B 0%,#3C4049 100%);
                    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049');
                    -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B', endColorstr='#3C4049')";
                    border-color: #2B2E33;
                }
 
                    #main-nav.nav-tabs.nav-stacked > li.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover > span {
                        color: #FFF;
                    }
 
            #main-nav.nav-tabs.nav-stacked > li {
                margin-bottom: 4px;
            }
 
        /*定义二级菜单样式*/
        .secondmenu a {
            font-size: 10px;
            color: #4A515B;
            text-align: center;
        }
 
        .navbar-static-top {
            background-color: #212121;
            margin-bottom: 5px;
        }
 
        .navbar-brand {
            background: url('') no-repeat 10px 8px;
            display: inline-block;
            vertical-align: middle;
            padding-left: 50px;
            color: #fff;
        }
        
        .ul-toggle{
        
        	cursor:pointer;
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
     <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
                	<!-- 显示一级菜单 -->
    				<s:iterator value="#application.privilegeTopList">
                    <li>
                        <a class="ul-toggle nav-header" >
                            <i class="glyphicon glyphicon-cog"></i>
                            	<span class="first_ul">${name }</span>
                               <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                        </a>
                        <ul class="second nav nav-list  collapse  secondmenu">
                        	<!-- 显示第二层菜单 -->
                            <s:iterator value="children">
    							<li><a target="right" href="${pageContext.request.contextPath }${url }.action">${name}</a></li>
    						</s:iterator>
                        </ul>
                    </li>
 					</s:iterator>
                </ul>
            </div>
        </div>
    </div>
    
	<script>
	
	$(function(){
		//折叠树效果
		$('.ul-toggle').click(function(){
			if($(this).siblings('ul.second').is(':visible')){
				console.log($(this).siblings('ul.second'));
				$(this).siblings('.second').hide();//css("background-color", "#636");
			
				/*设置展开、折叠标识*/
				//$(this).removeClass("glyphicon glyphicon-minus");
				//$(this).addClass("glyphicon glyphicon-plus");
				/* $(this).css("background", "url(${pageContext.request.contextPath}/img/plus.gif)"); */
				/* console.log("111111111111"); */
			}else{
			/* 	console.log($(this).siblings("222")); */
				$(this).siblings('.second').show();//css("background-color", "#321");
				//$(this).removeClass("glyphicon glyphicon-plus");
				//$(this).addClass("glyphicon glyphicon-minus");
				/* $(this).css("background", "url(${pageContext.request.contextPath}/img/minus.gif)"); */
			}
		});
		
		//设置鼠标停选二级子菜单后样式效果
	});
		
	</script>
  </body>
</html>
