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
		href="${pageContext.request.contextPath }/style/css/amazeui.min.css">
		<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/script/amazeui.js"></script>
  </head>
  <style type="text/css">
  	.self-table{
  		width:72%;
  		text-align:center;
  	}
  	
  	.self-btn{
  		/* width:80%; */
  		padding:5px 48px 5px 48px;
  	}
  </style>
  <body>
  <h5>个人信息</h5>
	<div>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs" role="tablist"  id="myTabs">
    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">全部信息</a></li>
    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">基础信息</a></li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="home">
    	 <table class="am-table self-table">
    
    <tbody>
	    	<tr>
	    		<td>登录名：</td>
	    		<td><s:property value="%{username}"/></td>
	    		</tr>
	    		<tr>
	    		<td>真实姓名：</td>
	    		<td><s:property value="%{realname}"/></td>
	    		</tr>
	    		<tr>
	    		<td>所属部门：</td>
	    		<td>${name}</td>
	    		</tr>
	    		<!-- <tr>
	    		<td>职位：</td>
	    		<td></td>
	    		</tr> -->
	    		<tr>
	    		<td>性别：</td>
	    		<td>${gender}</td>
	    		</tr>
	    		<tr>
	    		<td>电话：</td>
	    		<td>${telephone}</td>
	    		</tr>
	    		<tr>
	    		<td>电子邮件：</td>
	    		<td><s:property value="%{email}"/></td>
	    		</tr>
	    		<tr>
	    		<td>信息描述：</td>
	    		<td><s:property value="%{description}"></s:property>
	    		</tr>
	    		<tr>
	    	</tr>
    </tbody>
    		
    </table>
    	<div>
    		<s:a action="user_modifyUI?id=%{id}" class="btn btn-info self-btn">修改</s:a>
    	</div>
    </div>
    <div role="tabpanel" class="tab-pane" id="profile">
		<table class="am-table self-table">
    
    <tbody>
	    	<tr>
	    	
<!-- 	    			出生日期：		
个人邮箱：		性别：	
户口性质：		户口所在地：	
民族：		政治面貌：	
身份证：		婚否：	
毕业院校：		毕业时间：	
专业：		学历：	
籍贯：		现住址：	
电话：		手机：	
QQ号码：		微信：	
工号：		员工CCC：	
归属公司：		企业邮箱：	
所属部门：		职位：	
部门总监：		总监邮箱：	
入职时间：		入职方式：	
入职地点：		员工类别：	
实习起始日：		实习到期日：	
转正日期：		离职日期：	
合同签订日：		合同截止日：	
试用到期日：		人员状态：	
合同续签：		福利地区：	
备注： -->	
	    		<td>姓名：</td>
	    		<td>${realname}</td>
	    		</tr>
	    		<tr>
	    		<td>电话：</td>
	    		<td>${telephone}</td>
	    		</tr>
	    		<tr>
	    		<td>电子邮件：</td>
	    		<td><s:property value="%{email}"/></td>
	    		</tr>
	    		
    </tbody>
    
    </table>
    <div> 
	    <s:a action="user_modifyUI?id=%{id}" class="btn btn-info self-btn">修改</s:a>
	</div>
	</div>
 
  </div>

</div>

<script>
	$(function(){
		$('#myTabs a').click(function (e) {
			  e.preventDefault();
			  $(this).tab('show');
			});
	});
</script>
   
  </body>
</html>
