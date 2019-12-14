<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/24
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String jspath = application.getContextPath();
	String uiPath = request.getContextPath() + "/layuiadmin/";
%>
<html>
<head>
	<link rel="stylesheet" href=<%=uiPath+"layui/css/layui.css"%>>
	<script src=<%=jspath+"/js/jquery-3.4.1.js"%>></script>
	<script src=<%=jspath+"/layui/layui.js"%>></script>
	<title></title>
</head>

<body>

<div class="demoTable">
	<div class="layui-card">
		<div class="layui-form layui-card-header layuiadmin-card-header-auto">
			<div class="layui-form-item">
				<div class="layui-inline">
					<label class="layui-form-label">用户名字</label>
					<div class="layui-input-block">
						<input type="text" name="USERNAME" placeholder="请输入" id="demoReload" autocomplete="off" class="layui-input">
					</div>
				</div>


				<div class="layui-inline">
					<button class="layui-btn" data-type="reload">
						<i class="layui-icon layui-icon-search layuiadmin-button-btn"></i>
					</button>
				</div>


			</div>
		</div>


		<div class="layui-card-body">
			<div style="padding-bottom: 10px;">
				<button class="layui-btn layuiadmin-btn-useradmin" data-type="add">添加</button>
			</div>


			<div class="layui-fluid">
				<div class="layui-row layui-col-space15">
					<div class="layui-col-md12">
						<div class="layui-card">
							<div class="layui-card-header">选完文件后不自动上传</div>
							<div class="layui-card-body">
								<div class="layui-upload">
									<button type="button" class="layui-btn layui-btn-normal" id="test-upload-change" data-type="uploadFile">选择文件</button>
									<button type="button" class="layui-btn" id="test-upload-change-action">开始上传</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<script type="text/html" id="barDemo">
                    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
                    <a class="layui-btn layui-btn-xs" lay-event="edit">禁用</a>
                    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
			</script>
		</div>
	</div>
</div>


<table class="layui-hide" id="demo" lay-filter="test"></table>


<script>
	// var username =$(demoReload).val();
	var dicTabel=null;

	layui.use('upload', function(){
		var $ = layui.jquery
			,upload = layui.upload;
		//选完文件后不自动上传

		// upload.render({
		// 	elem: '#test-upload-change'
		// 	,url: '/demo5/file.action'
		// 	,accept:'file'
		// 	,auto: false
		// 	,bindAction: '#test-upload-change-action'
		// 	,done: function(res){
		// 		this.date={
		// 			filename:$('#filename').val(),
		// 			filetime:$('#filetime').val(),
		// 			uploadtime:$('#uploadtime').val(),
		// 			username:$('#username').val()
		//
		// 		}
		// 		// console.log(res)
		// 	}
		// 	,done:function (res) {
		//
		// 	}
		// });
          upload.render({

          })

	});

	layui.use('table', function(){
		var table = layui.table;
		//展示已知数据
		dicTabel =table.render({
			elem: '#demo'
			,height:400
			,limit:5
			,limits:[5]
			,url:'/demo5/user.action'
			// ,method:'post'
			,page: true
			,id:'testReload'
			,cols: [[ //标题栏
				{field: 'userid', title: '用户ID', sort: true ,align:'center'}
				,{field: 'username', title: '用户账号',align:'center' }
				,{field: 'regtime', title: '注册时间',align:'center'}
				,{field: 'uploadnum', title: '上传文件数',align:'center' }
				,{field: 'downloadnum', title: '下载文件数',align:'center'}
				,{field: 'integral', title: '积分',align:'center'}
				,{field: 'statename', title: '状态',sort: true,align:'center'}
				,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:200}
			]]
		});

		var $ = layui.$, active = {
			reload: function(){
				var demoReload = $('#demoReload');
				//执行重载
				table.reload('testReload', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,where: {
						username: demoReload.val()
					}
				}, 'data');
			}


			,add: function(){
				layer.open({
					type: 2
					,title: '添加用户'
					,content: 'jsp/WorkUser.jsp'
					,maxmin: true
					,area: ['500px', '450px']
					,btn: ['确定', '取消']
					,yes: function(index, layero){
						//alert("增加");
					    //姓名
						var username = $(layero).find('iframe')[0].contentWindow.username.value;
                       //alert("姓名-----"+username);

						//性别
						var sex = $(layero).find('iframe')[0].contentWindow.sex.value;
						//alert("性别-----"+sex);

						//学历
						var education = $(layero).find('iframe')[0].contentWindow.education.value;
						//alert("学历-----"+education);

						//职业
						var occupation = $(layero).find('iframe')[0].contentWindow.occupation.value;
						//alert("职业-----"+occupation);

						//手机号
						var phone = $(layero).find('iframe')[0].contentWindow.phone.value;
						//alert("手机号-----"+phone);

						//邮箱
						var email = $(layero).find('iframe')[0].contentWindow.email.value;
						//alert("邮箱-----"+email);

						var ob = {
							username: username,
							sex: sex,
							education: education,
							occupation: occupation,
							phone: phone,
							email: email
						};
						alert(ob);
						$.ajax({
							type: "POST",//提交的方式
							url: "/demo5/add.action",//提交的地址
							data: ob,//提交的数据
							dataType: "json",//希望返回的数据类型
							async: true,//异步操作
							success: function (msg) {//成功的方法  msg为返回数据
								if (msg.msg === "1") {
									alert("增加成功！！！");
									// table.reload('demo');
									dicTabel.reload();
									layer.close(index);
								}
							},
							error: function () {//错误的方法
								alert("服务器未找到")
							}
						});

					}
				});


			}
			,uploadFile:function(){
				layer.open({
					type: 2
					,title: '选择文件'
					,content: 'jsp/uploadFile.jsp'
					,maxmin: true
					,area: ['500px', '500px']
				})
			}
		};


		// //监听行工具事件
		// table.on('tool(test)', function(obj){
		// 	var data = obj.data;
		// 	//console.log(obj)
		// 	if(obj.event === 'del'){
		// 		layer.confirm('真的删除行么', function(index){
		// 			obj.del();
		// 			layer.close(index);
		// 		});
		// 	} else if(obj.event === 'edit'){
		// 		layer.prompt({
		// 			formType: 2
		// 			,value: data.email
		// 		}, function(value, index){
		// 			obj.update({
		// 				email: value
		// 			});
		// 			layer.close(index);
		// 		});
		// 	}
		// });
		//监听工具条
		table.on('tool(test)', function(obj){
			var data = obj.data;
			if(obj.event === 'detail'){
				layer.msg('ID：'+ data.id + ' 的查看操作');

				layer.close(index);
				// obj.detail();
			} else if(obj.event === 'del'){
				layer.confirm('真的删除行么', function(index){
					layer.close(index);

					var userid = data.userid;
					alert("ID-----"+userid);
					var ob = {
						userid: userid
					};

					$.ajax({
						type: "POST",//提交的方式
						url: "/demo5/delete.action",//提交的地址
						data: ob,//提交的数据
						dataType: "json",//希望返回的数据类型
						async: true,//异步操作
						success: function (msg) {//成功的方法  msg为返回数据
							if (msg.msg === "1") {
								alert("删除成功！！！");
								// table.reload('demo');
								dicTabel.reload();
							}
						},
						error: function () {//错误的方法
							alert("服务器未找到")
						}
					});
				});
			} else if(obj.event === 'edit'){
				//layer.alert('编辑行：<br>'+ JSON.stringify(data))
				var userid = data.userid;
				alert("ID-----"+userid);
				var ob = {
					userid: userid
				};

				$.ajax({
					type: "POST",//提交的方式
					url: "/demo5/modify.action",//提交的地址
					data: ob,//提交的数据
					dataType: "json",//希望返回的数据类型
					async: true,//异步操作
					success: function (msg) {//成功的方法  msg为返回数据
						if (msg.msg === "1") {
							alert("修改成功！！！");
							// table.reload('demo');
							dicTabel.reload();
						}
					},
					error: function () {//错误的方法
						alert("服务器未找到")
					}
				});

			}




		});

		$('.demoTable .layui-btn').on('click', function(){
			var type = $(this).data('type');
			active[type] ? active[type].call(this) : '';
		});
	});
</script>


</body>
</html>
