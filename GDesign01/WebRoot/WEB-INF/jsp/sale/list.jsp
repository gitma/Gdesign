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
	<!--为Echarts准备一个Dom-->
	<div id="main" style="height:400px"></div>

	<s:form action="sale_show">
		<s:submit value="导出成excel"></s:submit>
	</s:form>
	<!--Echarts单文件引入-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/script/echart/js/echarts.js"></script>

	<!->
	<script type="text/javascript">
		//-配置路径--
		require.config({
			paths:{
				echarts:'${pageContext.request.contextPath }/script/echart/js/dist'
			}
		});

		//使用
		require(
			[
				'echarts',
				'echarts/chart/line'//使用柱状图就加载bar模块，按需加载
			],
			function(ec){
				//基于准备好的dom，初始化echarts图表
				var myChart = ec.init(document.getElementById('main'));

				var option =  {
					tooltip:{
						show:true
					},
					legend:{
						data:['营业额（单位：千万）']
					},
					xAxis:[
						{
							type:'category',
							data:["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"]
						}
					],
					yAxis:[
						{
							type:'value'

						}		
					],

					series:[
						{
						"name":"营业额（单位：千万）",
						"type":"line",
						"data":[5,20,40,10,10,20,5,20]
						}
					]
				};

				//为echarts对象加载数据
				myChart.setOption(option);
			}
			
			);
	</script>
	
	
</body>
</html>
