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
    
    <title>My JSP 'fileDU.jsp' starting page</title>
    
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
  </head>
  
  <body>
  
  <table class="am-table am-table-bordered am-table-striped am-table-hover">
  	<s:form>
  		
  			<tr>
  				<th><input type="checkbox">选项</th>
	    			<th>文件名</th>
	    			<th>贡献者</th>
	    			<th>创建时间</th>
	    			<th>目录</th>
	    			<th>查看</th>
  			</tr>
  			
  			<!-- 判断是否有文件资料 -->
  			<s:if test="#fileNameMap!=null">
  			<ul style="list-style-type:decimal">
  			
  				<s:iterator value="fileNameMap" id="file" status="status">
  					<tr>
  					<%-- <s:property value="#file"/><br> --%>
  						<%-- fileName:<s:property value="key"/><br> --%>
  						<%-- <s:property value="#file.key"/> --%>
  						<td><input type="checkbox"/><s:property value="#status.index+1"/>
  						<%-- <td><s:property value="" /></td>--%>
  						<td><s:a action="file_downloadFile.action?fileName=%{#file.key}"><s:property value="value"/></s:a></td>
  						<%-- <td><s:property value="time"/>
  						<td><s:property value="path"/> --%>
  						<td><s:a action="file_downloadFile.action?fileName=%{#file.key}"><i>download</i></s:a></td>
  					</tr>
  				</s:iterator>
  			</ul>
  			</s:if>
  			<s:else>
				没有文件！！！
			</s:else>
  			
  		
  	</s:form>
  	</table>
  	
  	<div style="border:1px solid black; align:center"><s:a action="file_addFile.action">上传文档</s:a><br></div>
  </body>
</html>
