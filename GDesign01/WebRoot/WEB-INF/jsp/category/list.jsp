<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
	href="${pageContext.request.contextPath}/style/css/amazeui.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">

<style type="text/css">
.self-height {
	height: 40px;
}

.btn_padding {
	width: 128px;
}
</style>
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
</head>

<body>
	列表
	<br />
	<%-- <s:form action="category_add">
    		<s:hidden name="userId"/>
    		<table>
    		<tr>
    			<td>提交人</td>
    			<td>User:${user.username }</td>
    			<td></td>
    		</tr>
    		<tr>
    			<td>期次</td>
    			<td><input type="text" name="createdTime"><input type="text" name="lastModifyTime"></td>
    			<td>从2016-03-28 到2016-05-01</td>
    		</tr>
    		<tr>
    			<td>开发的项目</td>
    			<td><input type="text" name="name"></td>
    			<td></td>
    		</tr>
    		<tr>
    			<td>所属的部门</td>
    			<td><s:select name="departmentId" list="departmentList" listKey="id" listValue="name"/></td>
    			<td>数据库Department中读取</td>
    		</tr>
    		<tr>
    			<td>计划完成百分比</td>
    			<td><input type="text" name="jobPercent"></td>
    			<td>1-100%</td>
    		</tr>
    		<tr>
    			<td>工作类型</td>
    			<td><s:select list="" name=""/></td>
    			<td>从数据库title中读取</td>
    		</tr>
    		
    		<tr>
    			<td><s:submit value="添加周报"></s:submit></td>
    		</tr>
    		</table>
    	</s:form>
    	 --%>

	<!-- css -->
	<s:form class="form-horizontal" role="form" action="category_add">
		<s:hidden name="userId"></s:hidden>
		<div class="form-group">
			<label for="user" class="col-sm-2 control-label">提交人</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<label class="col-sm-4 control-label">${user.username }</label>
				<%-- <s:textfield name="#user.username" class="form-control" id="user" /> --%>
			</div>
		</div>

		<div class="form-group">
			<label for="user" class="col-sm-2 control-label" for="name">开发的项目</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textfield name="name" class="form-control" id="name" />
			</div>
		</div>
		<div class="am-alert am-alert-danger" id="my-alert"
			style="display: none">
			<p>开始日期应小于结束日期！</p>
		</div>
	<%-- 	<div class="am-g">
			<div class="am-u-sm-6">
				<button type="button" class="am-btn am-btn-default am-margin-right"
					id="my-start">开始日期</button>
				<span id="my-startDate">2014-12-20</span>
			</div>
			<div class="am-u-sm-6">
				<button type="button" class="am-btn am-btn-default am-margin-right"
					id="my-end">结束日期</button>
				<span id="my-endDate">2014-12-25</span>
			</div>
		</div> --%>

		<div class="form-group">
			<label for="categoryLog" class="col-sm-2 control-label">期次:</label>
			<div class="col-sm-3">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<div><button type="button" id="my-start">开始日期</button>
				<input type="text" name="createdTime" id="my-startDate"></div>
			</div>
			<div class="col-sm-3">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<div><button type="button" id="my-end">结束日期</button>
				<input type="text" name="lastModifyTime" id="my-endDate"></div>
			</div>
		</div>
		<div class="form-group">
			<label for="dept" class="col-sm-2 control-label">所属的部门</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:select name="departmentId" list="departmentList" listKey="id"
					listValue="name" class="form-control" id="dept" />
			</div>
		</div>
		<div class="form-group">
			<label for="jobPercent" class="col-sm-2 control-label" for="name">计划完成百分比</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<s:textfield name="jobPercent" class="form-control" id="jobPercent" />
			</div>
		</div>
		<div class="form-group">
			<label for="type" class="col-sm-2 control-label">工作类型</label>
			<div class="col-sm-5">
				<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
				<%-- <s:textfield name="" class="form-control" id="type" /> --%>
				<%-- <s:select list="" name="#''" /> --%>
				<s:select list="#{'项目开发':'项目开发', '项目测试':'项目测试', '事假':'事假' , '年假':'年假', '调休':'调休'}" class="form-control"
							label="事假" listValue="value" onchange="chooseUploadPath(this)"
							name="jobType"/>
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
	<%-- <table>
    	<!-- 表头 -->
    	<thead>
	    	<tr><td>类别名称</td>
	    		<td>子类别数目</td>
	    		<td>创建时间</td>
	    		<td>最后修改时间</td>
	    		<td>更多操作</td>
	    	</tr>
    	</thead>
    	
    	<!-- 显示数据列表 -->
    	<tbody >
    		<s:iterator value="#categoryList">
	    	<tr>
	    		<td><!-- 类别名称 -->
	    			<s:a action="category_show?id=%{id}"><s:property value="%{name}"/></s:a></td>
	    		<td><!-- 子类别数目 -->
	    			<s:property value="%{description}"/></td>
	    		<td><!-- 创建时间 -->
	    			<s:property value="%{createdTime}"/></td>
	    		<td><!-- 最后修改时间 -->
	    			<s:property value="%{lastModifyTime}"/></td>	
	    		<td><!-- 删除、修改 -->
	    			<s:a action="category_delete?id=%{id}" onclick="return confirm('确定要删除吗?')">删除</s:a>
	    			<s:a action="category_modifyUI?id=%{id}">修改</s:a>
	    			
	    	</tr>
	    </s:iterator>
	    <s:a action="category_addUI">添加</s:a>
    	</tbody>
    </table> --%>
</body>
</html>
