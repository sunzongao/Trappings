<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Node Examples</title>
		<link rel="stylesheet" href="../themes/default/default.css" />
		<script src="../kindeditor.js"></script>
		<style>
			.cls {
				border : 1px solid #A0A0A0;
				margin : 10px;
				padding : 10px;
				cursor: pointer;
			}
			.on {
				border : 1px solid red;
				background-color : #F0F0F0;
			}
		</style>
		<script>
			KindEditor.ready(function(K) {
				K('.cls').mouseover(function(e) {
					K(this).addClass('on');
				})
				.mouseout(function(e) {
					K(this).removeClass('on');
				})
				.click(function(e) {
					eval(K.unescape(K(this).html()));
				});
			});
		</script>
	</head>
	<body>
		<div class="cls">K('div#id').addClass('cls');</div>
		<div class="cls">K('div.class').css('margin', '10px');</div>
		<div class="cls">K('#id img').css('border', '1px solid #000').attr('title', 'hello');</div>
		<div class="cls">K('#id > div').width(200).height(50).css('border', '1px solid #000');</div>
		<div class="cls">K('a[href="\\#"]').attr('href', 'http://www.kindsoft.net/');</div>
		<div id="id">
			<div class="class">class1</div>
			<div class="class"><a href="#" target="_blank">class2</a></div>
			<a href="#" target="_blank"><img src="http://www.kindsoft.net/images/logo_180_30.gif" /></a>
		</div>
	</body>
</html>
