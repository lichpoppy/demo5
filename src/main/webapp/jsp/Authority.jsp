<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/23
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%
	String css=request.getContextPath()+"/css/";
	String Jspath=request.getContextPath()+"/js/";
	String servletpath=request.getContextPath();

%>

<html>
<head>
	<title>Title</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href=<%=servletpath+"/layui/css/layui.css"%> media="all">
	<%--	<link rel="stylesheet" href="../../layui/css/layui.css" media="all">--%>
	<script type="text/javascript" src=<%=Jspath+"jquery-3.4.1.js" %>></script>



</head>
<body>
<form class="layui-form" action="">
	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label">角色选择</label>
			<div class="layui-input-inline">
				<select name="quiz" id="quiz">
					<option value="">请选择角色</option>
					<c:forEach items="${requestScope.role}" begin="0" step="1" var="t">
						<option value="${t.roleid}" >${t.rolename}</option>
					</c:forEach>
				</select>
			</div>
		</div>
	</div>
	<div id="test12" class="demo-tree-more"></div>
	<div style="padding-bottom: 10px;">

	</div>
	<div class="layui-btn-container">
		<button type="button" class="layui-btn layui-btn-sm" lay-demo="getChecked">分配</button>

	</div>
</form>
<script src=<%=servletpath+"/layui/layui.js"%>></script>
<script>


	layui.use(['tree', 'util'], function(){
		var tree = layui.tree
			,layer = layui.layer
			,util = layui.util

		$.ajax({
			type:"POST",//提交的方式
			url:"Tree.action",//提交的地址
			dataType:"json",//希望返回的数据类型
			async: true,//异步操作
			success:function (msg) {//成功的方法  msg为返回数据

				tree.render({
					elem: '#test12'  //绑定元素
					,showCheckbox:true
					,data:msg
					,showLine: false  //是否开启连接线
					,id: 'demoId1'
				});
			},
			error:function () {//错误的方法
				alert("服务器正忙")
			}
		});



		//按钮事件
		util.event('lay-demo', {
			getChecked: function(othis){


				var checkedData = tree.getChecked('demoId1'); //获取选中节点的数据


				var ob=JSON.stringify(checkedData);
				alert("ob---"+ob);

				var roleId= $("#quiz").val();
				alert("roleId---"+roleId);

				$.ajax({
					type:"POST",//提交的方式
					url:"distribution.action",//提交的地址
					data:"msg="+ob+"&msg2="+roleId,

					dataType:"text",//希望返回的数据类型
					async: true,//异步操作
					success:function (msg) {//成功的方法  msg为返回数据



					},
					error:function () {//错误的方法
						alert("服务器正忙")
					}
				});


			}


		});




		layui.config({
			// base: '../../../layuiadmin/' //静态资源所在路径
		}).extend({
			// index: 'lib/index' //主入口模块
		}).use(['table'], function(){
			var $ = layui.$
				// ,form = layui.form
				,table = layui.table;



			//事件
			var active = {

				save:function (){
					alert($('#quiz').val()) ;
					alert("保存")

				}





			};





			$('.layui-btn.layuiadmin-btn-useradmin').on('click', function(){
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			});





		});
		function removeBlock(str)
		{
			if (str) {
				var reg = /^\[/gi;
				var reg2 = /\]$/gi;
				str = str.replace(reg, '');
				str = str.replace(reg2, '');
				return str;
			} else {
				return str;
			}
		}

	});
</script>
</body>
</html>
