<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
</head>
<body>
	 <!--用户信息-->
 <div class="userinfo_style" id="userinfo_style" >
 	<div class="member_show" >
<div class="member_jbxx clearfix" >
  <img class="img" src="${pageContext.request.contextPath}/statics/images/user.png">
  <dl  class="right_xxln" style="margin-top: 8px">
  <dt><span class="">供货商名称：${supplier.sName}</span></dt>
  <dd class="" style="margin-left:0">联系人：${supplier.sContacts}</dd>
  </dl>
</div>
<div class="member_content">
  <ul>
   <li><label class="label_name">电话：</label><span class="name">${supplier.sPhone }</span></li>
   <li><label class="label_name">Email：</label><span class="name">${supplier.sEmail }</span></li>
   <li><label class="label_name">联系地址：</label><span class="name">${supplier.sAddress }</span></li>
   <li><label class="label_name">合作时间：</label><span class="name">${supplier.sDate }</span></li>
   <li><label class="label_name">状态：</label><span class="name">
	<c:if test="${supplier.sStatus==1}">
	     	<td>启用</td>
	     </c:if>
	     <c:if test="${supplier.sStatus==2}">
	     	<td>禁用</td>
	     </c:if>
</span></li>
   <li><label class="label_name">备注：</label><span class="name">${supplier.comments }</span></li>
  </ul>
</div>
</div>
 </div>
</body>
</html>