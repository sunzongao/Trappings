<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="utf-8" />
		<title>FileManager Examples</title>
		<link rel="stylesheet" href="../themes/default/default.css" />
		<script src="../kindeditor.js"></script>
		<script src="../lang/zh_CN.js"></script>
		<script>
			KindEditor.ready(function(K) {
				var editor = K.editor({
					fileManagerJson : '../php/file_manager_json.php'
				});
				K('#filemanager').click(function() {
					editor.loadPlugin('filemanager', function() {
						editor.plugin.filemanagerDialog({
							viewType : 'VIEW',
							dirName : 'image',
							clickFn : function(url, title) {
								K('#url').val(url);
								editor.hideDialog();
							}
						});
					});
				});
			});
		</script>
	</head>
	<body>
		<input type="text" id="url" value="" /> <input type="button" id="filemanager" value="浏览服务器" />
	</body>
</html>
