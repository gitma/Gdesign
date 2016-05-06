<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
	href="${pageContext.request.contextPath }/style/css/amazeui.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/style/css/bootstrap.min.css">
<style type="text/css">
	.self-control{
		padding:50px;
	}
	
	body{
		background:#dfe8f6;width:100%;
	}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/script/jquery.js">
	</script>
<script type="text/javascript">
		function checkfile(){
			var files = document.getElementsByName("file");
			var dir = document.getElementById("obj").value;
			console.log(dir);
			if(files[0].value.length!=0 && dir!=0){
				return true;
			}else if(dir==0){
				alert("请选择存储目录");
				return false;
			}else{
				alert("请选择文件");
				return false;
			}
		}
		
		function addMore(){
			var br = document.createElement("br");
			var td = document.getElementById("more");
			var input = document.createElement("input");
			var button = document.createElement("button");
			input.type="file";
			button.type="button";
			button.value="remove";
			button.onclick = function(){
				td.removeChild(br);
				td.removeChild(input);
				td.removeChild(button);
			};
			td.appendChild(br);
			td.appendChild(input);
			td.appendChild(button);
		}
		
		function chooseUploadPath(obj){
			/* var path = document.getElementById("path");
			
			path.value = obj.selectedId;
			console.log(path); */
			/* console.log($("#path").val()); */
			/* $("#path").val($("#obj option:selected").val); */
			$("#path").val($("#obj option:selected").val());
			/* path.value = $("#obj option:selected").text(); */
			/* console.log(path); */
		}
		
		$(function() {
		    $('#doc-form-file').on('change', function() {
		      var fileNames = '';
		      $.each(this.files, function() {
		        fileNames += '<span class="am-badge">' + this.name + '</span> ';
		      });
		      $('#file-list').html(fileNames);
		    });
		  });
	</script>
</head>

<body>
	<s:form action="file_uploadFile.action" method="post"
		enctype="multipart/form-data" class="form-horizontal" onsubmit="return checkfile()">
		<s:hidden name="uploadDir" id="path" value="0"></s:hidden>

				<div class="form-group self-control">
					<label for="selectedItem" class="col-sm-2 control-label">上传文档</label>
					<div class="col-sm-3">
						<!-- <input type="email" class="form-control" id="inputEmail3" placeholder="Email"> -->
						<s:select list="#{'CKZL':'参考资料', 'GZZD':'规章制度', 'PXZL':'培训资料' }" class="form-control"
							label="选择上传的文件目录" listValue="value" headerKey="0"
							headerValue="----前选择相应目录----" onchange="chooseUploadPath(this)"
							id="obj" />
					</div>

					<div class="col-sm-5">
						<!-- <input type="password" class="form-control" id="inputPassword3" placeholder="Password"> -->
						<div class="am-form-group am-form-file">
							<button type="button" class="am-btn am-btn-danger am-btn-sm">
								选择要上传的文件</button>
							<input id="doc-form-file" type="file" name="file" multiple>
						</div>
						<div id="file-list"></div>
					</div>
				</div>
			<div class="form-group">
				<div class="col-sm-offset-3 col-sm-10">
					<!--  <button type="submit" class="btn btn-default">Sign in</button> -->
					<s:submit value="提交" class="btn btn-primary btn_padding"></s:submit>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<s:reset class="btn btn-warning btn_padding"></s:reset>
				</div>

			</div>
	</s:form>
</body>
</html>
