<%@ page import="java.util.Map" %>
<%@ page import="javax.swing.tree.DefaultMutableTreeNode" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/10/11
  Time: 23:03
  To change this template use Filetb | Settings | Filetb Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%
	String uiPath = request.getContextPath() + "/layui/";
	String JsPath = request.getContextPath() + "/js/";
	String jspath = application.getContextPath();

	String path=request.getContextPath();
	String JspPath = request.getContextPath() + "/jsp/";
%>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title> 文档分享后台菜单</title>
<%--	<link rel="stylesheet" href=<%=path+"/css/bootstrap.css"%>>--%>
	<link rel="stylesheet" href=<%=uiPath+"css/layui.css"%>>

	<script src=<%=JsPath+"jquery-3.4.1.js"%>></script>
<%--	<script src=<%=jspath+"/js/bootstrap.js"%>></script>--%>


<%--	<script src=<%=JsPath+"jslater/WorkMenuJs.js"%>></script>--%>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
	<div class="layui-header">

		<ul class="layui-nav layui-layout-right">
			<li class="layui-nav-item">
				<a href="javascript:;">
					<img src="http://t.cn/RCzsdCq" class="layui-nav-img">
            <c:choose>
				<c:when test="${requestScope.username != null}">
					<span id="wname" >${requestScope.username}</span>
				</c:when>
<%--				<c:otherwise>--%>
<%--				</c:otherwise>--%>
			</c:choose>
				</a>

			</li>
			<li class="layui-nav-item"><a href="">退出</a></li>
		</ul>
	</div>

	<div class="layui-side layui-bg-black">
		<div class="layui-side-scroll">

			<ul class="layui-nav layui-nav-tree" lay-filter="test">

				<c:if test="${requestScope.menu != null}">
					<c:forEach items="${requestScope.menu}" begin="0" step="1" var="x">

						<li class="layui-nav-item layui-nav-itemed">
							<a class="" href="javascript:;">${x.key}</a>
							<dl class="layui-nav-child">

								<c:forEach items="${x.value}" begin="0" step="1" var="y">
									<dd><a href="${y.menupath}" target="page-view">${y.towmenuname}</a></dd>
								</c:forEach>
							</dl>
						</li>

					</c:forEach>
				</c:if>

			</ul>
		</div>
	</div>

	<div class="layui-body">
		<!-- 内容主体区域 -->
		<div style="padding: 15px;">
			<iframe src="" frameborder="0" style="width: 100% ;height: 90% " name="page-view" id="myiframe">

			</iframe>


		</div>
	</div>

	<div class="layui-footer">
		<!-- 底部固定区域 -->

	</div>
</div>
<script src=<%=uiPath+"layui.js"%>></script>
<script>

	layui.use('element', function(){
		var element = layui.element;

	});
</script>

</body>
</html>







