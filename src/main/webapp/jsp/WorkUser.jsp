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
	String path=request.getContextPath();
	String uiPath = request.getContextPath() + "/layuiadmin/";



%>
<html>
<head>
	<title>人员新增</title>


	<link rel="stylesheet" href=<%=uiPath+"layui/css/layui.css"%>>
	<link rel="stylesheet" href=<%=uiPath+"style/admin.css"%> media="all">
<%--	<script src=<%=jspath+"/js/jquery-3.4.1.js"%>></script>--%>
	<script src=<%=uiPath+"layui/layui.js"%>></script>

</head>
<body>




<div class="layui-form" lay-filter="layuiadmin-form-useradmin" id="layuiadmin-form-useradmin" style="padding: 20px 0 0 0;">
	<div class="layui-form-item">
		<label class="layui-form-label">用户名</label>
		<div class="layui-input-inline">
			<input type="text" name="username" id="username" lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
		</div>
	</div>




	<div class="layui-form-item" lay-filter="sex">
		<label class="layui-form-label">选择性别</label>
		<div class="layui-inline">
			<select name="sex"  id="sex" lay-filter="LAY-user-adminrole-type">
				<option value=""></option>
				<option value="男">男</option>
				<option value="女">女</option>

			</select>
		</div>
	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">学历</label>



		<div class="layui-inline">
			<select name="education"  id="education" lay-filter="LAY-user-adminrole-type">
				<option value=""></option>
				<option value="小学">小学</option>
				<option value="初中">初中</option>
				<option value="高中">高中</option>
				<option value="大专">大专</option>
				<option value="本科">本科</option>
				<option value="研究生">研究生</option>
				<option value="博士">博士</option>
			</select>
		</div>



	</div>

	<div class="layui-form-item">
		<label class="layui-form-label">职业</label>
		<div class="layui-input-inline">
			<input type="text" name="occupation" lay-verify="car" id="occupation" placeholder="请输入职业" autocomplete="off" class="layui-input">
		</div>
	</div>


	<div class="layui-form-item">
		<label class="layui-form-label">手机号码</label>
		<div class="layui-input-inline">
			<input type="text" name="phone" id="phone" lay-verify="phone" placeholder="请输入号码" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">邮箱</label>
		<div class="layui-input-inline">
			<input type="text" name="email" lay-verify="email" id="email" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
		</div>
	</div>







	<%--	<div class="layui-form-item">--%>
	<%--		<label class="layui-form-label">头像</label>--%>
	<%--		<div class="layui-input-inline">--%>
	<%--			<input type="text" name="avatar" lay-verify="required" placeholder="请上传图片" autocomplete="off" class="layui-input" >--%>
	<%--		</div>--%>
	<%--		<button style="float: left;" type="button" class="layui-btn" id="layuiadmin-upload-useradmin">上传图片</button>--%>
	<%--	</div>--%>





	<div class="layui-form-item layui-hide">
		<input type="button" lay-submit lay-filter="LAY-user-front-submit" id="LAY-user-front-submit" value="确认">
	</div>
</div>

<script src="../layuiadmin/layui/layui.js"></script>

<script>
	layui.use('form', function(){
		var form = layui.form; //只有执行了这一步，部分表单元素才会自动修饰成功

		//……

		//但是，如果你的HTML是动态生成的，自动渲染就会失效
		//因此你需要在相应的地方，执行下述方法来进行渲染
		form.render();
	});





</script>
</body>
</html>