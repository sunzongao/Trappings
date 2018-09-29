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
	<h3>
		<img align="left" height="100" style="margin-right: 10px" width="100" />在此处输入标题
	</h3>
	<p>
		在此处输入内容
	</p>
</body>
</html>