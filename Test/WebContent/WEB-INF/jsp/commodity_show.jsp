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
 <div class="userinfo_style" id="userinfo_style"  >
 	<div class="member_show" >
<div class="member_jbxx clearfix" >
  <dl   style="margin-top: 8px">
  <dt><span class="" style="margin-top: 10px;color:white;">商品编号：${commodity.commodityId}</span></dt>
  <dd style="margin-top: 10px;color:white;">商品名称：${commodity.cName}</dd>
  <dd style="margin-top: 10px;color:white;">商品类别：${commodity.genre.gName}</dd>
  <dd style="margin-top: 10px;color:white;">商品单位：${commodity.unit.uName}</dd>
  <dd style="margin-top: 10px;color:white;">商品颜色：${commodity.pigment.pName}</dd>
  <dd style="margin-top: 10px;color:white;">商品尺寸：${commodity.dimension.dName}</dd>
  <dd style="margin-top: 10px;color:white;">商品品牌：${commodity.brand.bName}</dd>
  <dd style="margin-top: 10px;margin-left:13px; color:white;">供货商：${commodity.supplier.sName}</dd>
  </dl>
</div>
<p style="margin-top: 10px; margin-left:13px; color:green;"><span style="width: 30px;height: 100px">备注：</span>${commodity.comments}</p>
</div>
 </div>
</body>
</html>