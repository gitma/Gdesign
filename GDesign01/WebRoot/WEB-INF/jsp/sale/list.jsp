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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/bootstrap.min.css">
	<style type="text/css">
		.self-pos{
			margin-left:80px;
		}
	</style>
</head>

<body>
	<!--为Echarts准备一个Dom-->
	<div id="main" style="height:400px"></div>

	<hr>
	<div>
	<s:form action="sale_show">
		<s:submit class="btn btn-success self-pos" value="导出成excel"></s:submit>
	</s:form>
	</div>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/script/jquery.min.js"></script>
	<!--Echarts单文件引入-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/script/echart/js/echarts.js"></script>

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
				
                var profits = [1,1,1,1];
                // 同步执行  
               /*  $.ajaxSettings.async = false;  
                  
                // 加载数据  
                $.getJSON('${pageContext.request.contextPath }/sale_getData.action',
                		function (json) {  
                			alert(json);
                });   */
             // 同步执行  
                $.ajaxSettings.async = false; 
                
                $.ajax({
    				url:'${pageContext.request.contextPath }/sale_getData.action',
    				type:'POST',
    				data:"{}", 
    				dataType:'json',
    				success:function(data){
    					var result = $.parseJSON(data);
    					for(var i=0; i<result.length; i++){
    						profits[i] = result[i];
    					}
    					console.log(profits);
    				},
    				error:function(data){
    					alert("error");
    				}
    			});
				
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
						"data":profits/* [20,80,10,65,43,66,120] */
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
