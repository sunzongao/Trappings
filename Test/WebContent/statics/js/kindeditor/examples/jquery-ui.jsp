<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="utf-8" />
		<title>With jQuery UI</title>
		<style>
			body {
				font-size: 12px;
			}
			form {
				margin: 0;
			}
			textarea {
				display: block;
			}
			#J_editorDialog {
				display: none;
			}
		</style>
		<link rel="stylesheet" href="jquery-ui/css/smoothness/jquery-ui-1.9.2.custom.css" />
		<link rel="stylesheet" href="../themes/default/default.css" />
		<script charset="utf-8" src="jquery.js"></script>
		<script charset="utf-8" src="jquery-ui/js/jquery-ui-1.9.2.custom.js"></script>
		<script charset="utf-8" src="../kindeditor.js"></script>
		<script charset="utf-8" src="../lang/zh_CN.js"></script>
		<script>
			$(function() {
				$('#J_openDialog').click(function() {
					$('#J_editorDialog').dialog({
						title : 'KindEditor',
						width : 700,
						open : function(event, ui) {
							// 打开Dialog后创建编辑器
							KindEditor.create('textarea[name="content"]', {
								resizeType : 1
							});
						},
						beforeClose : function(event, ui) {
							// 关闭Dialog前移除编辑器
							KindEditor.remove('textarea[name="content"]');
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<h3>在jQuery UI Dialog里打开编辑器</h3>
		<div id="J_editorDialog">
			<textarea name="content" style="width:100%;height:200px;"></textarea>
		</div>
		<button type="button" id="J_openDialog">打开Dialog</button>
	</body>
</html>
