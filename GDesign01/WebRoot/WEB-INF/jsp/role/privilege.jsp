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
    
    <title>My JSP 'privilege.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/style/blue/file.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/script/jquery_treeview/jquery.treeview.css">
	<script language="javascript" src="${pageContext.request.contextPath }/script/jquery.js"></script>
	<script language="javascript" src="${pageContext.request.contextPath }/script/jquery_treeview/jquery.treeview.js"></script>
	
	<!-- 上级权限选择时，下级所有权限也跟着被选中， 下级权限被选中，其直系上级所有也都跟着被选中 -->
	<script language="javascript">
		$(function(){
			$("[name=privilegeIds]").click(function(){
				//向下
				$(this).siblings("ul").find("input").attr("checked", this.checked);
				
				//向上
				if(this.checked==true){
					$(this).parents("li").children("input").attr("checked", true);
				}
			});
		})
		
	</script>
  </head>
  
  <body>
    权限列表<br>
    <input type="checkbox" id="all"  onclick="$('[name=privilegeIds]').attr('checked', this.checked)"/><label>全选/反选</label>
    
    <s:form action="role_setPrivilege">
    	<s:hidden name="id"/>
    	<%-- <s:checkboxlist name="privilegeIds" list="#privilegeList" listKey="id" listValue="name"/>
    	<br/> --%>
    	
    	<!-- 显示树状结构内容 -->
    	<ul id="tree">
    		<s:iterator value="#application.privilegeTopList">
    			<li><input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> />
		<label for="cb_${id}"><span class="folder">${name}</span></label>
    			
    				<ul>
    					<s:iterator value="children">
    						<li><input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> />
		<label for="cb_${id}"><span class="folder">${name}</span></label>
    							<ul>
    								<s:iterator value="children">
    									<li><input type="checkbox" name="privilegeIds" value="${id}" id="cb_${id}" <s:property value="%{id in privilegeIds ? 'checked' : ''}"/> />
		<label for="cb_${id}"><span class="folder">${name}</span></label>
										</li>
    								</s:iterator>
    							</ul>
    						</li>
    					</s:iterator>
    				</ul>
    			</li>
    		</s:iterator>
    	</ul>
    	
    	<script language="javascript">
	    	console.log($("#tree"));
	    	$("#tree").treeview();
   		</script>
    	<s:submit value="确定分配"/>
    </s:form>
    
  </body>
</html>
