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
     <script src="${pageContext.request.contextPath }/script/angular.js"></script>  
     <script src="${pageContext.request.contextPath }/script/ui-bootstrap-tpls.min.js"></script>
     <style type="text/css">
     	.self-width{
     		width:150px;
     	}
     </style>
<meta charset="utf-8">
</head>
<body ng-app="myApp" class="row">
    <section class="row" >
        <section ng-controller="modalDemo" class="col-md-6" style="margin:40px auto; padding:30px;">
    <script type="text/ng-template" id="myModelContent.html"> <!--  //创建一个局部视图，需要的时候引用它， 下面会用到 -->
        <div class="modal-header"> <!-- // modal头部 。body  footer 类推 -->
             <h3 class="modal-title">签到</h3>
        </div>
        <div class="modal-body">
            <div>当前时间为：{{today | date:'yyyy-MM-dd HH:mm:ss'}}</div>
        </div>
        <div class="modal-footer">
            <button class="btn btn-primary" ng-click="ok()">
            确认
            </button>
            <button class="btn btn-warning" ng-click="cancel()">退出</button>
        </div>
    </script>
    		<div class="form-group">
    			<div class="col-sm-offset-6 col-sm-10">
    				<button class="btn btn-info self-width" ng-click="open()">签到</button>
    			</div>
    		</div>
            
            <hr>
            <br/>
            <div class="form-group">
    			<div class="col-sm-offset-4 col-sm-10">
    				<label><s:a action="sign_sign"><div ng-show="flag">本次系统记录签到时间为:&nbsp;&nbsp;<b>{{today}}</b></div></s:a></label>
    			</div>
    		</div>
            
        </section>
    </section>
</body>
<script>
    angular.module('myApp',['ui.bootstrap']).controller('modalDemo',function($scope,$modal,$log){ //
        // $scope.items = ['html5','jq','FE-演示平台'];
        $scope.today = new Date();
        $scope.open = function(){  //打开模态 
            var modalInstance = $modal.open({
                templateUrl : 'myModelContent.html',  //指向上面创建的视图
                controller : 'ModalInstanceCtrl',// 初始化模态范围
                resolve : {
                    today : function(){
                        return $scope.today;
                    }
                }
            })
            modalInstance.result.then(function(flag){  
                $scope.flag = true;
            },function(){
                $log.info('Modal dismissed at: ' + new Date())
            })
        }
    })
    angular.module('myApp').controller('ModalInstanceCtrl',function($scope,$modalInstance,today){ //依赖于modalInstance
        // $scope.items = items;
        $scope.today = today;
        // $scope.selected = {
        //     item : $scope.items[0]
        // };
        $scope.ok = function(){  
            $modalInstance.close($scope.today); //关闭并返回当前选项
        };
        $scope.cancel = function(){
            $modalInstance.dismiss('cancel'); // 退出
        };
    })
</script>

</html>