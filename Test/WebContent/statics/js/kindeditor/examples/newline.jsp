<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Newline Examples</title>
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
				var editor;
				K('select[name=newlineTag]').change(function() {
					if (editor) {
						editor.remove();
						editor = null;
					}
					editor = K.create('textarea[name="content"]', {
						newlineTag : this.value
					});
				});
				K('select[name=newlineTag]').change();
			});
		</script>
	</head>
	<body>
		<h3>回车换行设置</h3>
		<form>
			<p>
				<select name="newlineTag">
					<option value="br">BR换行</option>
					<option value="p">P换行</option>
				</select>
			</p>
			<textarea name="content" style="width:800px;height:200px;"></textarea>
		</form>
	</body>
</html>
