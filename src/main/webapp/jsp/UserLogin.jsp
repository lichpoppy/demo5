<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/23
  Time: 11:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	String path = request.getContextPath();
	String jspath = application.getContextPath();
	String uiPath = request.getContextPath() + "/layui/";
	String csspath = request.getContextPath()+"/css/";
	String uiiPath = request.getContextPath();
%>

<html>
<head>
	<meta charset="utf-8">
	<title>登入 - layuiAdmin</title>

	<link rel="stylesheet" href=<%=uiiPath+"/layuiadmin/layui/css/layui.css"%>></link>
	<link rel="stylesheet" href=<%=uiiPath+"/layuiadmin/style/admin.css"%>></link>
	<link rel="stylesheet" href=<%=uiiPath+"/layuiadmin/style/login.css"%>></link>
	<script src=<%=jspath + "/js/jquery-3.4.1.js"%>></script>


<%--	<script src=<%=uiiPath+"/layuiadmin/layui/css/layui.css"%>></script>--%>
<%--	<script src=<%=uiiPath+"/layuiadmin/style/admin.css"%>></script>--%>
<%--	<script src=<%=uiiPath+"/layuiadmin/style/login.css"%>></script>--%>

</head>
<body>
<form id="doform" method="post" action="userlogin.action">

<div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;" >

	<div class="layadmin-user-login-main">
		<div class="layadmin-user-login-box layadmin-user-login-header">
			<h2>分档分享平台</h2>
			<p>分档分享平台前端登录界面</p>
		</div>
		<div class="layadmin-user-login-box layadmin-user-login-body layui-form">
			<div class="layui-form-item">
				<label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-username"></label>
				<input type="text" name="username" id="LAY-user-login-username" lay-verify="required" placeholder="用户名" class="layui-input" value="admin">
			</div>
			<div class="layui-form-item">
				<label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
				<input type="password" name="password" id="LAY-user-login-password" lay-verify="required" placeholder="密码" class="layui-input" value="123">
			</div>
			<div class="layui-form-item">
				<div class="layui-row">
					<div class="layui-col-xs7">
						<label class="layadmin-user-login-icon layui-icon layui-icon-vercode" for="LAY-user-login-vercode"></label>
						<input type="text" name="vercode" id="LAY-user-login-vercode" lay-verify="required" placeholder="图形验证码" class="layui-input">
					</div>
					<div class="layui-col-xs5">
						<div style="margin-left: 10px;">
							<img src="https://www.oschina.net/action/user/captcha" class="layadmin-user-login-codeimg" id="LAY-user-get-vercode">
						</div>
					</div>
				</div>
			</div>
			<div class="layui-form-item" style="margin-bottom: 20px;">
				<input type="checkbox" name="remember" lay-skin="primary" title="记住密码">
				<a href="forget.html" class="layadmin-user-jump-change layadmin-link" style="margin-top: 7px;">忘记密码？</a>
			</div>
			<div class="layui-form-item">
				<button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-login-submit">登 入</button>
<%--				<button class="layui-btn" lay-submit lay-filter="formDemo" style="width: 180px;margin-left: 50px">登录</button>&ndash;%&gt;--%>

			</div>
			<div class="layui-trans layui-form-item layadmin-user-login-other">
				<label>社交账号登入</label>
				<a href="javascript:;"><i class="layui-icon layui-icon-login-qq"></i></a>
				<a href="javascript:;"><i class="layui-icon layui-icon-login-wechat"></i></a>
				<a href="javascript:;"><i class="layui-icon layui-icon-login-weibo"></i></a>

				<a href="reg.html" class="layadmin-user-jump-change layadmin-link">注册帐号</a>
			</div>
		</div>
	</div>

	<div class="layui-trans layadmin-user-login-footer">

		<p>© 2018 <a href="http://www.layui.com/" target="_blank">layui.com</a></p>
		<p>
			<span><a href="http://www.layui.com/admin/#get" target="_blank">获取授权</a></span>
			<span><a href="http://www.layui.com/admin/pro/" target="_blank">在线演示</a></span>
			<span><a href="http://www.layui.com/admin/" target="_blank">前往官网</a></span>
		</p>
	</div>


	</div>

</form>

<%--<script>--%>

<%--	layui.use('form', function () {--%>
<%--		var form = layui.form;--%>

<%--		//监听提交--%>
<%--		form.on('submit(formDemo)', function (data) {--%>
<%--			layer.msg(JSON.stringify(data.field));--%>
<%--			return false;--%>
<%--		});--%>
<%--	});--%>
<%--</script>--%>

<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null)
	{
		out.write("<script>alert('" + msg + "')</script>");
	}
%>
</body>
</html>
