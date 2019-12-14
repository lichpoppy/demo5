<%--
  Created by IntelliJ IDEA.
  User: 21
  Date: 2019/11/18
  Time: 11:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%

	String jsPath=request.getContextPath()+"/js/";
	String servletPath=request.getContextPath();


%>
<html>
<head>
	<meta charset="utf-8">
	<title>layuiAdmin 网站用户 iframe 框</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<link rel="stylesheet" href=<%=servletPath+"/layuiadmin/layui/css/layui.css"%> media="all">
	<script type="text/javascript" src=<%=jsPath+"jquery-3.4.1.js" %>></script>
</head>
<body>
<form>
	<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
		<%--		<div class="layui-form-item">--%>
		<%--			<label class="layui-form-label">ID</label>--%>
		<%--			<div class="layui-input-inline">--%>
		<%--				<input type="text" name="USERID" id="USERID" lay-verify="required"  autocomplete="off" class="layui-input" disabled="disabled" >--%>
		<%--			</div>--%>
		<%--		</div>--%>
		<div class="layui-form-item">
			<label class="layui-form-label">文档标题</label>
			<div class="layui-input-inline">
				<input type="text" name="tw_title" id="tw_title" lay-verify="required"  autocomplete="off" class="layui-input"  >
			<input id="name" type="hidden" name="name" value=<%=request.getSession().getAttribute("username") %>>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">文档简介</label>
			<div class="layui-input-inline">
				<input type="text" name="tw_msg" id="tw_msg" lay-verify="required"  autocomplete="off" class="layui-input" >
			</div>
		</div>
			<div class="layui-form-item">
			<div class="layui-upload">
				<button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>

			</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">下载积分：</label>
				<div class="layui-input-inline">
					<input type="text" name="tw_integral" id="tw_integral" lay-verify="required"  autocomplete="off" class="layui-input" >
				</div>
			</div>

			<div class="layui-form-item">

				<div class="layui-input-inline">
					<button type="button" class="layui-btn" id="test9">开始上传</button>
				</div>
			</div>

		<%--		<div align="center">--%>
		<%--		<button type="button" class="layui-btn layui-btn-radius" onclick="ok()">确定</button>--%>
		<%--		<button type="button" class="layui-btn layui-btn-radius" onclick="no()">取消</button>--%>
		<%--		</div>--%>
	</div>

	<script src=<%=servletPath+"/layui/layui.js"%>></script>
	<script>
		layui.use('upload', function() {
			var $ = layui.jquery
				, upload = layui.upload;


			//选完文件后不自动上传
			upload.render({
				elem: '#test8'
				, url: '/demo5/file.action' //上传接口
				,accept:'file'
				,exts:'doc|csv|txt|docx'
				, auto: false
				//,multiple: true
				, bindAction: '#test9'
				, before: function () {
					this.data = {
						filetitle: $('#tw_title').val(),
						introduction: $('#tw_msg').val(),
						downscore:$('#tw_integral').val(),
						username:$('#name').val()

					}
				}

				, done: function (res) {
					alert("上传成功");
				}
			})


		})

	</script>
</form>
</body>
</html>