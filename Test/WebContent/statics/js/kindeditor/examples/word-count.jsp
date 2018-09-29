<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Word Count Examples</title>
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
				K.create('textarea[name="content"]', {
					afterChange : function() {
						K('.word_count1').html(this.count());
						K('.word_count2').html(this.count('text'));
					}
				});
			});
		</script>
	</head>
	<body>
		<h3>统计字数</h3>
		<form>
			<textarea name="content" style="width:800px;height:200px;"></textarea>
			<p>
				您当前输入了 <span class="word_count1">0</span> 个文字。（字数统计包含HTML代码。）<br />
				您当前输入了 <span class="word_count2">0</span> 个文字。（字数统计包含纯文本、IMG、EMBED，不包含换行符，IMG和EMBED算一个文字。）
			</p>
		</form>
	</body>
</html>
