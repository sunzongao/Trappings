<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath }/statics/css/shop.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/shopFrame.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/Sellerber.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/layer/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/proTree.js" ></script>
<title>Insert title here</title>
</head>
<body>
	 <!--用户信息-->
 <div class="userinfo_style" id="userinfo_style" style="">
 	<div class="member_show" >
<div class="member_jbxx clearfix" >
  <img class="img" src="${pageContext.request.contextPath}/statics/images/user.png">
  <dl  class="right_xxln">
  <dt><span class="">${employee.eName}</span> <span class=""></span></dt>
  <dd class="" style="margin-left:0">${employee.comments}</dd>
  </dl>
</div>
<div class="member_content">
  <ul>
   <li><label class="label_name">性别：</label><span class="name">${employee.eSex}</span></li>
   <li><label class="label_name">手机：</label><span class="name">${employee.ePhone}</span></li>
   <li><label class="label_name">出生日期：</label><span class="name">${employee.birthDate}</span></li>
   <li><label class="label_name">入职时间：</label><span class="name">${employee.entryDate}</span></li>
   <li><label class="label_name">住址：</label><span class="name">${employee.eAddress}</span></li>
   <li><label class="label_name">所属部门：</label><span class="name">${employee.dName}</span></li>
   <li><label class="label_name">职务：</label><span class="name">${employee.jName}</span></li>
  </ul>
</div>
</div>
 </div>
</body>
</html>