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
<meta charset="utf-8" />
<!-- jqueryMobile的css文件  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/style/css/jqueryMobile.css">
<!-- 加载jquery文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/jquery.js"></script>
<!-- 加载jqueryMobile文件 -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/jqueryMobile.js"></script>

<!--mobiscroll日期插件-->
<link
	href="${pageContext.request.contextPath }/style/css/mobiscroll.css"
	rel="stylesheet" type="text/css" />
<style>
	.self-width{
		align:center; 
		width:60%;
	}
	.body-background{
		background:#fff;
		height:100%;
		width:100%;
	}
</style>
<script src="${pageContext.request.contextPath }/script/mobiscroll.js"
	type="text/javascript"></script>
<script type="text/javascript">
	// 初始化插件内容
	var opt_data = {
		preset : 'date', //日期格式 date（日期）|datetime（日期加时间）
		theme : 'jqm', //皮肤样式
		display : 'modal', //显示方式
		mode : 'clickpick', //日期选择模式
		dateFormat : 'mm', // 日期格式
		setText : 'ok', //确认按钮名称
		cancelText : 'back',//取消按钮名籍我
		dateOrder : 'mm', //面板中日期排列格式
		monthText : '选择月份',//面板中年月日文字
		/*yearText: '年', monthText: '月',  dayText: '日', *///面板中年月日文字
		endYear : 2020
	//结束年份
	};
	// 使用定义插件
	$(document).on("pageinit", "#pageone", function() {
		$("#txtmonth").mobiscroll(opt_data);

	});
</script>


</head>
<body>
<h5>销售信息录入</h5>
	<div data-role="page" id="pageone" style="background:#fff;">
		<div data-role="content" class="self-width">
			<s:form method="post" action="sale_add">
				<label for="name">销售名称</label>
				<input type="text" name="name" id="name" />
				<label for="profit">销售营业额</label>
				<input type="text" name="profit" id="profit" />
				<!-- 日期插件 -->
				<label for="txtBirthday">选择月份</label>
				<input type="text" data-role="datebox" id="txtmonth" name="month" />
				<input type="submit" name="sub" value="提 交" data-inline="true"
					class="ui-btn-right" />
			</s:form>
		</div>
	</div>
</body>
</html>