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
<body style="height: 440px; width: 890px; overflow: scroll;">
	<!--用户信息-->
	<div class="userinfo_style" id="userinfo_style">
		<div class="member_show">
			<div class="member_jbxx clearfix" style="height: 100px">
				<table style="width: 870px">
					<tr class="right_xxln">
						<td style="padding-left: 40px">采购单号：<input
							name="procurementId" id="procurementId"
							value="${procurement.procurementId}"
							style="margin-top: 3px; color: black;" readonly="readonly" /></td>
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
						<td style="padding-left: 40px; padding-top: 20px">供货商：${procurement.sName}</td>
						<td style="padding-right: 30px; padding-top: 20px">收货仓库： <select
							name="storehouseId" id="storehouseId" style="" <c:if test="${ procurement.condition==1}">disabled="true"</c:if>>
								<c:forEach var="s" items="${storehouses}">
									<option value="${s.storehouseId}"
										<c:if test="${s.storehouseId eq procurement.storehouseId}">selected="selected"</c:if>>${s.stoName}</option>
								</c:forEach>
						</select>
						</td>
						<td style="padding-top: 20px">经办人： <select name="userId"
							id="userId" style="">
								
								<c:forEach var="u" items="${users}">
									<option value="${u.id}"
										<c:if test="${u.id eq procurement.userId }">selected="selected"</c:if>
										<c:if test="${u.jobId!=1 }">style="display:none;"</c:if>>${u.surname}</option>
								</c:forEach>
						</select>
						</td>
					</tr>

				</table>
			</div>
			<div class="member_content">
				<table style="width: 850px"
					class="table table_list table_striped table-bordered">
					<tr style="background-color: #666;">
						<td style="color: #fff;">商品编号</td>
						<td style="color: #fff;">商品名称</td>
						<td style="color: #fff;">类别</td>
						<td style="color: #fff;">单位</td>
						<td style="color: #fff;">颜色</td>
						<td style="color: #fff;">尺码</td>
						<td style="color: #fff;">品牌</td>
						<td style="color: #fff;">单价</td>
						<td style="color: #fff;">数量</td>
					</tr>
					<c:forEach var="p" items="${procurement.dList}">
						<tr>
							<input type="hidden" name="id" class="id" value="${p.id }" />
							<td>${p.commodity.commodityId}</td>
							<td>${p.commodity.cName}</td>
							<td>${p.commodity.genre.gName}</td>
							<td>${p.commodity.unit.uName}</td>
							<td>${p.commodity.pigment.pName}</td>
							<td>${p.commodity.dimension.dName}</td>
							<td>${p.commodity.brand.bName}</td>
							
								<td><input  <c:if test="${ procurement.condition==1}">readonly="readonly"</c:if>  name="price" class="price" value="${p.price}"
									type="text" style="width: 60px" />(元)</td>
								<td><input  <c:if test="${ procurement.condition==1}">readonly="readonly"</c:if> name="number" class="number" value="${p.number}"
									type="text" style="width: 60px" />(${p.commodity.unit.uName})</td>
							
						</tr>
					</c:forEach>
				</table>
				<p style="color: red; float: right; margin: 20px 50px 0px 0px">总金额：${sum}元</p>
			</div>
		</div>

	</div>
	<div style="margin: 50px 20px 0px 20px; color: green; width: 800px;">
		<span>备注：</span>
		<div style="width: 720px; float: right; margin-right: 25px">
			<span class="add_name"> <textarea rows="4" cols="102"
					name="comments" id="comments" style="height: 100px;">${procurement.comments }</textarea>
			</span>
		</div>
	</div>
	<div style="width: 850px; height: 50px; float: right;">
		<a style="margin-left: 350px" class="btn btn-xs btn-info0"
			href="javascript:;" id="submit">修改</a>&nbsp;&nbsp;&nbsp; <a
			class="btn btn-xs btn-info" href="javascript:;" id="close">关闭</a>
	</div>
</body>
<script type="text/javascript">

	function getId() {
		obj = document.getElementsByName("id");
		check_val = "";
		for (k in obj) {
			check_val += obj[k].value + ",";
		}
		return check_val;
	}

	//获取选中商品编号
	function getPrice() {
		obj = document.getElementsByName("price");
		check_val = "";
		for (k in obj) {
			check_val += obj[k].value + ",";
		}
		return check_val;
	}

	//
	function getNumber() {
		obj = document.getElementsByName("number");
		check_val = "";
		for (k in obj) {
			check_val += obj[k].value + ",";
		}
		return check_val;
	}

	$(function() {
		/*关闭*/
		$("#close").click(function() {
			//当你在iframe页面关闭自身时					
			var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			parent.layer.close(index); //再执行关闭
		});
		/*提交修改*/
		$("#submit")
				.click(
						function() {
							var id = new Array();
							$(".id").each(function(i) {
								id[i] = $(this).val();
							});
							var ids = id.join(",");
							
							var price = new Array();
							$(".price").each(function(i) {
								price[i] = $(this).val();
							});
							var prices = price.join(",");
							
							var number = new Array();
							$(".number").each(function(i) {
								number[i] = $(this).val();
							});
							var numbers = number.join(",");
							//获取采购单编号
							var procurementId = $("#procurementId").val();

							//获取收货仓库
							var storehouseId = $("#storehouseId").val();

							//获取收货仓库
							var userId = $("#userId").val();
							//获取备注
							var comments = $("#comments").val();
							//使用ajax修改员工信息
							$
									.post(
											"${pageContext.request.contextPath}/jsp/procurement_doupdate.html",
											{
												"procurementId" : procurementId,
												"storehouseId" : storehouseId,
												"userId" : userId,
												"comments" : comments,
												"id":ids,
												"price" : prices,
												"number" : numbers
											},
											function(data) {
												if (data == "true") {
													layer
															.alert(
																	"修改成功！",
																	{
																		icon : 1,
																		btn : [ '确定' ],
																		yes : function() {
																			//当你在iframe页面关闭自身时					
																			var index = parent.layer
																					.getFrameIndex(window.name); //先得到当前iframe层的索引
																			parent.location
																					.reload();//刷新父级页面
																			parent.layer
																					.close(index); //再执行关闭
																		}
																	});

												} else {
													layer.msg("修改失败！");
													//刷新当前页面
													window.location.reload();
												}
											});
						});
	});

	layui.use('slider', function() {
		var slider = layui.slider;
		//渲染
		slider.render({
			elem : '#slideTest1' //绑定元素
		});
	});
</script>

</html>