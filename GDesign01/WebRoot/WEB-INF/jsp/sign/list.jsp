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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/css/amazeui.min.css">  
     <script src="${pageContext.request.contextPath }/script/ui-bootstrap-tpls.min.js"></script>
     <script type="text/javascript"
	src="${pageContext.request.contextPath }/script/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/amazeui.js"></script>
<script>
	$(function() {
		var startDate = new Date(2014, 11, 20);
		var endDate = new Date();
		var $alert = $('#my-alert');
		$('#my-start').datepicker().on('changeDate.datepicker.amui',
				function(event) {
					if (event.date.valueOf() > endDate.valueOf()) {
						$alert.find('p').text('开始日期应小于结束日期！').end().show();
					} else {
						$alert.hide();
						startDate = new Date(event.date);
						$('#my-startDate').val($('#my-start').data('date'));
					}
					$(this).datepicker('close');
				});

		$('#my-end').datepicker().on('changeDate.datepicker.amui',
				function(event) {
					if (event.date.valueOf() < startDate.valueOf()) {
						$alert.find('p').text('结束日期应大于开始日期！').end().show();
					} else {
						$alert.hide();
						endDate = new Date(event.date);
						$('#my-endDate').val($('#my-end').data('date'));
					}
					$(this).datepicker('close');
				});
	});
	
	function chooseUploadPath(obj){
		console.log(this).Option;
	}
</script>
     <style type="text/css">
     	.self-width{
     		width:150px;
     	}
     	.self-pad{
     		padding-left:25px;
     		padding-right:25px;
     	}
     	/* body{
     		background:#dfe8f6;width:100%;
     	} */
     </style>
<meta charset="utf-8">
</head>
<body>
    
    	<s:form action="sign_signHistory">
    		<%-- <div><input name="startTime"/>至<input name="endTime"/></div>
    		--%>
    		
    		<div class="form-group">
			<label for="categoryLog" class="col-sm-2 control-label">查询日期：</label>
			<div class="col-sm-4">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<div><button class="am-btn am-btn-primary am-btn-xs" type="button" id="my-start">From</button>
				<input type="text" name="startTime" id="my-startDate" value="${show_startTime }"></div>
			</div>
			<div class="col-sm-4">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<div><button class="am-btn am-btn-primary am-btn-xs" type="button" id="my-end">To</button>
				<input type="text" name="endTime" id="my-endDate" value="${show_endTime }"></div>
			</div>
		</div>
		
		<s:submit class="am-btn am-btn-success am-btn-sm am-round self-pad" value="查询"/> 
    	</s:form>
    	
    	<div>
    		
    	<s:if test="#signList!=null">
    	<table class="am-table am-table-bordered am-table-striped am-table-hover">
    <thead>
        <tr>
            <th><input type="checkbox">选项</th>
				<th>用户</th>
				<th>签到日期</th>
				<!-- <th>使用ip</th> -->
				<th>IP</th>
				
				<!-- <th>日志</th> -->
        </tr>
    </thead>
    <tbody>
				<s:iterator var="sign" value="signList" status="st">
					<tr>
						<td><input type="checkbox" />
						<s:property value="#st.index" /></td>
						<!-- 输出当前元素索引 -->
						
							<%-- <s:property value="#category.createdTime"/> --%>
						<td><s:property value="#sign.user.username" /></td>
						<td><s:date name="#sign.lastSignDate" format="yyyy-MM-dd HH:mm:ss" /></td>
						<td>192.168.0.1</td>
						<%-- <td><s:property value="#category.user.username" /></td>
						<td><s:property value="#category.department.name" /></td>
						<td><s:a action="category_modifyUI?id=%{id}">修改</s:a> <s:a
								action="category_delete?id=%{id}"
								onclick="return confirm('确定删除吗?')">删除</s:a></td> --%>
					</tr>


				</s:iterator>
			
			<s:else>无数据</s:else>
    </tbody>
</table>
</s:if>	
    	</div>

</html>