<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
	<title></title>
<style>
html{overflow:hidden;}
*{margin:0;padding:0;}
body{font-size:12px;background:#dfe8f6;width:100%;overflow:hidden;}
ul{list-style:none  outside;}
a{text-decoration:none;color:#000000;}

.top{line-height:35px;background:url(${pageContext.request.contextPath}/img/top_bga.gif) repeat-x;}
.nav{height:26px;background:url(${pageContext.request.contextPath}/img/nav_bg上.gif) repeat-x;}
.left{float:left;width:280px;padding-left:5px;padding-right:5px;background:#dfe8f6;}
.choose{border:solid 1px #8db2e3;border-top:0;background:#FFF;padding:10px;}
.right{float:right;width:5px;}
.content{border:solid 1px #8db2e3;border-top:0;background:#FFF;overflow:auto;overflow-x:hidden;}
.content_nav{height:23px;background:url(${pageContext.request.contextPath}/img/right_title.gif) repeat-x;border-bottom:solid 1px #8db2e3;}
.content_text{background:#fff;padding-top:20px;}
.dis_0{height:20px;background:url(${pageContext.request.contextPath}/img/user_suit.gif) no-repeat 22px 0;padding-left:45px;position:relative;padding-top:3px;}
.dis_1,.dis_2{height:20px;background:url(${pageContext.request.contextPath}/img/pkg.gif) no-repeat 22px 0;padding-left:45px;position:relative;padding-top:3px;}
.second li{background:url(${pageContext.request.contextPath}/img/class.png) no-repeat;padding-left:18px;color:#333;margin-top:5px;padding-top:2px;display:block;cursor:pointer;}
.second{display:none;padding-left:22px;margin-bottom:10px;}
.table{width:85%;border:solid 1px #8db2e3;margin:0 auto;margin-bottom:20px;}
.table_nav{line-height:24px;background:url(${pageContext.request.contextPath}/img/table_nav.gif) repeat-x;color:#15428b;padding-left:10px;font-weight:bold;}
.table_title{line-height:23px;background:url(${pageContext.request.contextPath}/img/table_title.gif) repeat-x;padding-left:10px;font-weight:bold;border-top:solid 1px #8db2e3;}
.table_text{padding:20px;}
.table_text span{color:#666666;}
.btn{width:75px;line-height:21px;margin:0 auto;margin-top:10px;background:url(${pageContext.request.contextPath}/img/btn.gif);text-align:center;display:block;}
.clickit{width:16px;height:16px;position:absolute;top:0;left:0;background:url(${pageContext.request.contextPath}/img/plus.gif);cursor:pointer;}
.back{line-height:21px;width:81px;float:right;margin:2px 20px 0 0;text-align:center;cursor:pointer;text-decoration:underline;color:#222222}
.wel{width:631px;margin:0 auto;padding:30px 0 100px 0;border-bottom:solid 2px #BFBFBF;}
.clear{clear:both;}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/script/jquery.js"></script>
<script>

/*$(function() {	
		$(".content_text").animate({opacity: 'toggle'}, 500);		
	});		
	*/
</script>

</head>

<body>
<div class="top"><img src="${pageContext.request.contextPath}/img/wel.gif"/></div>
<div class="nav">
	<div class="back">返回首页</div>
</div>
<div class="left">
	<div class="choose">
	<!-- <%-- 	<div class="dis_0">
			<span>业务测试环境一</span>
			<ul>
    显示一级菜单
    	<s:iterator value="#application.privilegeTopList">
	    <li >
	        ${name }
			<div class="clickit" id="first"></div>
		</div>
		</li>
	        <ul class="second">
    				显示二级菜单
    				<s:iterator value="children">
    					<li ><a target="right" href="${pageContext.request.contextPath }${url }.action">${name}</a></li>
    				</s:iterator>
    		</ul>
	   	 
	   	 </s:iterator>
		</ul>
	</div> --%> -->
	<!-- 判断是否是管理员 -->
	<s:if test=""></s:if>
	<div class="dis_2">
				<span><a href="indexwin8.html">用户名：yyCat</a></span>
			</div>
				
	<!-- 普通员工 -->
	<s:else></s:else>
		<div class="dis_0">
			<span>项目管理</span>
			<div class="clickit"  id="first"></div>
		</div>	
				<ul class="second">
					<li id="testC-7">编辑周报</li>
					<li id="sign_signUI">签到操作</li>
					<li id="testC-2">管理员审核</li>
				</ul>
			
				
		<div class="dis_1">
			<span>工作台</span>
			<div class="clickit"></div>
		</div>	
				<ul class="second">
					<li id="testC-0">我的周报</li>
					<li id="category_list">编写周报</li>
					<li id="testC-1">我的签到记录</li>
					<li id="user_info">个人信息</li>
				</ul>
				
				
		</div>
</div>
<div class="right"></div>
<div class="content">
	<div class="content_nav"></div>
	<div class="content_text">
		
	</div>
</div>

<div class="clear"></div>
</body>
</html>
<script>
jQuery.fn.createThis = function(obj) {
	
	//设置json参数
	var settings = {
		
		project:"",
		depict:"",
		database:"",
		ipp:"",
		remark:"",
		links:"",
		type:0,
		btn:""

	};


		
		var option =jQuery.extend(settings, obj);//将传递进来的参数替换原有json参数
		
		//导入函数
		jQuery.createTable.create(option.project,option.depict,option.database,option.ipp,option.remark,option.links,option.type,option.btn);



};

jQuery.createTable= { 


		create: function(pro,dep,data,ipp,rek,src,tp,btn){
			
			var dataName;
			if(!btn){
				btn='进入测试';
			}
			if(tp == 0){dataName = "IPP"}else{dataName = "SOCKET"};
			
			var tableHtml = ""
			+"<div class='table'>"
			+"<div class='table_nav'>"+pro+"</div>"
			+"<div class='table_title'>"+dep+"</div>"
			+"<div class='table_text'>"
			+"<span>备注："+rek+"</span>"
			+"<a href="+src+" target='_blank' class='btn'>"+btn+"</a>"
			+"</div>"
			+"</div>"
			
			var getBox = $(".content_text");
			
			$(getBox).append(tableHtml);
			
		
		}
		
		
}

</script>
<script>

$(function() {	
	
	//欢迎界面
	var welcome = ""
				 +"<div class='wel'>"
				 +"<div><img src='${pageContext.request.contextPath}/img/logo.jpg' /></div>"
				 +"<div style='margin:40px 0 0 10px;'><img src='${pageContext.request.contextPath}/img/logo_1.jpg' /></div>"
				 +"<div style='padding:20px 0 0 55px;color:#333333;'>点击“+”或“-”展开或关闭菜单</div>"
				 +"<a href='http://10.112.14.39:8080' style='width:150px;line-height:16px;margin:40px 0 0 50px;background:url(${pageContext.request.contextPath}/img/cog.png) no-repeat;padding-left:20px;color:red;font-weight:bold;text-decoration:underline;display:block;'>进入测试问题跟踪系统</a>"
				 +"</div>"
				 +"<div style='text-align:center;padding-top:5px;'>Power By csii_mas 2009</div>"		
	
	//页面高度
	var Height = $(window).height() - $(".top").height() - $(".nav").height()-20;
	$(".choose").height(Height-20);  
	$(".content").height(Height);
	$(".right").height(Height);
	
	//初始化页面
	$(".content_text").append(welcome);//载入欢迎界面
	$("#first").css("background","url(${pageContext.request.contextPath}/img/minus.gif)");
	$("#first").parent().next(".second").show();
	
	//折叠树效果
	$(".clickit").click( function() { 
		
		if ($(this).parent().next(".second").is(':visible')) {
		
			$(this).css("background","url(${pageContext.request.contextPath}/img/plus.gif)");
			$(this).parent().next(".second").hide();	
		
		}else{

			$(this).css("background","url(${pageContext.request.contextPath}/img/minus.gif)");
			$(this).parent().next(".second").show();
		
		}
	
	});
	
	$(document.body).find("li").each(function(i){
	
		$(this).mousemove( function() { 
		
			$(this).css("color","#CC0000")
		
		}).mouseout( function() { 
		
			$(this).css("color","#333")
		
		}).click( function() { 
		
			$(this).css("color","#CC0000").css("font-weight","bold");
			$(this).siblings().css("color","#333").css("font-weight","normal");
		
		})
	}); 

	//返回欢迎界面
	$(".back").mousemove( function() { 
	
		$(this).css("background","url(${pageContext.request.contextPath}/img/btn.jpg)").css("color","#000").css("decoration","none");
		
		}).mouseout( function() { 
		
			$(this).css("background","none").css("color","#222").css("decoration","underline");
		
		}).click( function() { 
		
			$(".content_text").hide().empty().append(welcome).animate({opacity: 'toggle'}, 500);
			
			
		});
			
	
});

</script>


