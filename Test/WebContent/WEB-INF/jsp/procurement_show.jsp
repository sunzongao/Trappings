<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/statics/css/shop.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/statics/css/Sellerber.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/css/bkg_ui.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/statics/font/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath }/statics/js/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/shopFrame.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/Sellerber.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/layer/layer.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/laydate/laydate.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/proTree.js"></script>
</head>
<body style="height: 440px;width:815px;overflow: scroll; ">
	<!--用户信息-->
	<div class="userinfo_style" id="userinfo_style">
		<div class="member_show">
			<div class="member_jbxx clearfix" style="height: 60px">
				<table style="width: 800px">
					<tr class="right_xxln">
						<td style="padding-left: 40px">采购单号：${procurement.procurementId}</td>
						<td style="padding-right: 30px">开单日期：${procurement.billingTime }</td>
						<c:if test="${procurement.condition==1}">
							<td class="td-status">状 态：已审核</td>
						</c:if>
						<c:if test="${procurement.condition==2}">
							<td class="td-status">状 态：未审核</td>
						</c:if>
						<c:if test="${procurement.condition==3}">
							<td class="td-status">状 态：已签收</td>
						</c:if>
						<c:if test="${procurement.condition==4}">
							<td class="td-status">状 态：未签收</td>
						</c:if>
						<c:if test="${procurement.condition==5}">
							<td class="td-status">状 态：未发布</td>
						</c:if>
						<c:if test="${procurement.condition==6}">
							<td class="td-status">状 态：已发布</td>
						</c:if>
					</tr>
					<tr class="right_xxln" style="margin-top: 50px">
						<td style="padding-left: 40px">供货商：${procurement.sName}</td>
						<td style="padding-right: 30px">收货仓库：${procurement.stoName }</td>
						<td>经办人：${procurement.surname}</td>
					</tr>
					
				</table>
			</div>
			<div class="member_content">
				<table style="width: 780px"  class="table table_list table_striped table-bordered">
					<tr style="background-color:#666;" >
						<td style="color:#fff;">商品编号</td>
						<td style="color:#fff;">商品名称</td>
						<td style="color:#fff;">类别</td>
						<td style="color:#fff;">单位</td>
						<td style="color:#fff;">颜色</td>
						<td style="color:#fff;">尺码</td>
						<td style="color:#fff;">品牌</td>
						<td style="color:#fff;">单价</td>
						<td style="color:#fff;">数量</td>
					</tr>
					<c:forEach var="p" items="${procurement.dList}">
						<tr>
							<td>${p.commodity.commodityId}</td>
							<td>${p.commodity.cName}</td>
							<td>${p.commodity.genre.gName}</td>
							<td>${p.commodity.unit.uName}</td>
							<td>${p.commodity.pigment.pName}</td>
							<td>${p.commodity.dimension.dName}</td>
							<td>${p.commodity.brand.bName}</td>
							<td>${p.price}(元)</td>
							<td>${p.number}(${p.commodity.unit.uName})</td>
						</tr>
					</c:forEach>
				</table>
						<p style="color:red;float:right;margin:20px 50px 0px 0px">总金额：${sum}元</p>
			</div>
		</div>	
		
	</div>
	<div style="margin: 50px 20px 0px 20px;color: green;">
		<span>备注：</span><div style="width:690px;float: right;margin-right: 25px">
			${procurement.comments }
		</div>
	</div>
</body>
<script type="text/javascript">
	layui.use('slider', function(){
	  var slider = layui.slider;
	  //渲染
	  slider.render({
	    elem: '#slideTest1'  //绑定元素
	  });
	});
</script>

</html>