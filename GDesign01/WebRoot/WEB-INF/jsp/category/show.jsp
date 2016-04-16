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
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style/css/bootstrap.min.css"> --%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/style/css/amazeui.min.css">
</head>

<body>
	<!-- <h3>周报查询与修改</h3> -->
	<div class="am-panel-hd">
    <h3 class="am-panel-title">周报查询与修改</h3>
  </div>
	<br />
	<s:form>
		<s:hidden name="userId" />
		
  
  <!-- <div class="am-panel-bd">
    <p>这里是面板其他内容。</p>
  </div> -->
	<table class="am-table am-table-bordered am-table-striped am-table-hover">
    <thead>
        <tr>
            <th><input type="checkbox">选项</th>
				<th>提交日期</th>
				<th>项目名称</th>
				<!-- 项目详细    detail -->
				<th>周报状态</th>
				<!-- <th>使用ip</th> -->
				<th>提交人</th>
				<th>所属部门</th>
				<th>管理</th>
        </tr>
    </thead>
    <tbody>
    	<s:if test="recordList!=null">
				<s:iterator id="category" value="recordList" status="st">
					<tr>
						<td><input type="checkbox" />
						<s:property value="#st.index" /></td>
						<!-- 输出当前元素索引 -->
						<td><s:date name="#category.createdTime" format="yyyy-MM-dd" />
							<%-- <s:property value="#category.createdTime"/> --%></td>
						<td><s:property value="#category.name" /></td>
						<td>
							<!-- 判断状态如果为NULL 或者为0 则显示正在审核中， 否则显示，审核通过 --> <s:if
								test="#category.status!=null">
	    							审核通过
	    						</s:if> <s:elseif test="#category.status==0">审核未通过</s:elseif> <s:else>正在审核中</s:else>
							<%-- <s:property value="#category.status"/> --%>
						</td>
						<td><s:property value="#category.user.username" /></td>
						<td><s:property value="#category.department.name" /></td>
						<td><s:a action="category_modifyUI?id=%{id}">修改</s:a> <s:a
								action="category_delete?id=%{id}"
								onclick="return confirm('确定删除吗?')">删除</s:a></td>
					</tr>


				</s:iterator>
			</s:if>
    </tbody>
</table>

		<!-- <table>
			<tr>
				<th><input type="checkbox">选项</th>
				<th>提交日期</th>
				<th>项目名称</th>
				项目详细    detail
				<th>周报状态</th>
				<th>使用ip</th>
				<th>提交人</th>
				<th>所属部门</th>
				<th>管理</th>
			</tr> -->

			<!-- 判断是否有可查询的周报 -->
			<%-- <s:if test="#categoryList!=null">
	    			<s:iterator id="category" value="categoryList" status="st">
	    				<tr>
	    					<td><input type="checkbox"/><s:property value="#st.index"/></td><!-- 输出当前元素索引 -->
	    					<td><s:date name="#category.createdTime" format="yyyy-MM-dd"/><s:property value="#category.createdTime"/></td>
	    					<td><s:property value="#category.name"/></td>
	    					<td>
	    						<!-- 判断状态如果为NULL 或者为0 则显示正在审核中， 否则显示，审核通过 -->
	    						<s:if test="#category.status!=null">
	    							审核通过
	    						</s:if>
	    						<s:elseif test="#category.status==0">审核未通过</s:elseif>
	    						<s:else>正在审核中</s:else>
	    						<s:property value="#category.status"/>
	    					</td>
	    					<td><s:property value="#category.user.username"/></td>
	    					<td><s:property value="#category.department.name"/></td>
	    					<td>
	    						<s:a action="category_modifyUI?id=%{id}">修改</s:a>
	    						<s:a action="category_delete?id=%{id}" onclick="return confirm('确定删除吗?')">删除</s:a>
	    					</td>
	    				</tr>
	    			</s:iterator>
    			</s:if> --%>

			<!-- 分页显示记录数 -->
			<%-- <s:if test="recordList!=null">
				<s:iterator id="category" value="recordList" status="st">
					<tr>
						<td><input type="checkbox" />
						<s:property value="#st.index" /></td>
						<!-- 输出当前元素索引 -->
						<td><s:date name="#category.createdTime" format="yyyy-MM-dd" />
							<s:property value="#category.createdTime"/></td>
						<td><s:property value="#category.name" /></td>
						<td>
							<!-- 判断状态如果为NULL 或者为0 则显示正在审核中， 否则显示，审核通过 --> <s:if
								test="#category.status!=null">
	    							审核通过
	    						</s:if> <s:elseif test="#category.status==0">审核未通过</s:elseif> <s:else>正在审核中</s:else>
							<s:property value="#category.status"/>
						</td>
						<td><s:property value="#category.user.username" /></td>
						<td><s:property value="#category.department.name" /></td>
						<td><s:a action="category_modifyUI?id=%{id}">修改</s:a> <s:a
								action="category_delete?id=%{id}"
								onclick="return confirm('确定删除吗?')">删除</s:a></td>
					</tr>


				</s:iterator>
			</s:if>

		</table> --%>
	<%-- 	<span><s:a action="category_show?pageNo=%{pageNo-1}">上一页</s:a></span> --%>
		<!-- 页码列表 -->
		<%-- <ul class="pagination">
    		<s:iterator begin="%{beginIndex}" end="%{endIndex}" var="num">
    				<s:if test="#num==pageNo">
  						<li><a href="#">${num }</a></li>
  					</s:if>
  					<s:else>
  						<li><a href="#">${num }</a></li>
  					</s:else>
  					<li><a href="#">${num }</a></li>
				
	    	</s:iterator>
	    	</ul> --%>
<ul data-am-widget="pagination"
			class="am-pagination am-pagination-default">
			
			<li class="am-pagination-first "><s:a action="category_show?pageNo=1">第一页</s:a></li>

			<li class="am-pagination-prev "><s:a action="category_show?pageNo=%{pageNo-1}">上一页</s:a></li>

			<s:iterator begin="%{beginIndex}" end="%{endIndex}" var="num">
    				<s:if test="#num==pageNo">
  						<li class="am-active"><s:a action="category_show?pageNo=%{num}" class="am-active">${num }</s:a></li>
  					</s:if>
  					<s:else>
  						<li class=""><s:a action="category_show?pageNo=%{num}">${num }</s:a></li>
  					</s:else>
  					<%-- <li><a href="#">${num }</a></li> --%>
				
	    	</s:iterator>
			
			<li class="am-pagination-next "><s:a action="category_show?pageNo=%{pageNo+1}">下一页</s:a></li>

			<li class="am-pagination-last "><s:a action="category_show?pageNo=%{totalPage}">最末页</s:a></li>
		</ul>
		<%-- <span><s:a action="category_show?pageNo=%{pageNo+1}">下一页</s:a></span> --%>

		
	</s:form>
	
</body>
</html>
