<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
	<meta charset="utf-8" />
</head>
<body>
	<p>
		在此处输入内容
	</p>
	<ol>
		<li>
			描述1
		</li>
		<li>
			描述2
		</li>
		<li>
			描述3
		</li>
	</ol>
	<p>
		在此处输入内容
	</p>
	<ul>
		<li>
			描述1
		</li>
		<li>
			描述2
		</li>
		<li>
			描述3
		</li>
	</ul>
</body>
</html>