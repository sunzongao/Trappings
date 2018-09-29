<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Dynamic Load Examples</title>
		<style>
			form {
				margin: 0;
			}
			textarea {
				display: block;
			}
		</style>
		<script charset="utf-8" src="jquery.js"></script>
		<script>
			$(function() {
				$('input[name=load]').click(function() {
					$.getScript('../kindeditor-min.js', function() {
						KindEditor.basePath = '../';
						KindEditor.create('textarea[name="content"]');
					});
				});
				$('input[name=remove]').click(function() {
					KindEditor.remove('textarea[name="content"]');
				});
			});
		</script>
	</head>
	<body>
		<h3>异步加载</h3>
		<form>
			<textarea name="content" style="width:800px;height:200px;"></textarea>
			<p>
				<input type="button" name="load" value="加载JS并创建编辑器" />
				<input type="button" name="remove" value="删除编辑器" />
			</p>
		</form>
	</body>
</html>
