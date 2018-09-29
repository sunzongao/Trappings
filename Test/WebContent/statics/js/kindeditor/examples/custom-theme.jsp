<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Custom Theme Examples</title>
		<style>
			form {
				margin: 0;
			}
			textarea {
				display: block;
			}
		</style>
		<link rel="stylesheet" href="../themes/default/default.css" />
		<script charset="utf-8" src="../kindeditor-min.js"></script>
		<script charset="utf-8" src="../lang/zh_CN.js"></script>
		<script>
			KindEditor.ready(function(K) {
				K.create('#content1', {
					themeType : 'default'
				});
				K.create('#content2', {
					themeType : 'simple'
				});
			});
		</script>
	</head>
	<body>
		<h3>默认风格</h3>
		<textarea id="content1" name="content" style="width:700px;height:200px;visibility:hidden;"></textarea>
		<h3>简单风格</h3>
		<textarea id="content2" name="content" style="width:700px;height:200px;visibility:hidden;"></textarea>
	</body>
</html>
