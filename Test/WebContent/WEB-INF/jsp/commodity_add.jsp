<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
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
<title>Insert title here</title>
<style type="text/css">
textarea {
	height: 40px;
	resize: none;
}
</style>
</head>
<body>
	<!--修改员工信息-->
	<form action="" method="post">
		<div class="add_menber" id="add_menber_style">
			<ul class=" page-content">
				<li><label class="label_name">商品编号：</label> <span
					class="add_name"> <input readonly="readonly"
						name="commodityId" id="commodityId" type="text" class="text_add" />
				</span>
					<div class="prompt r_f"></div></li>
				<li><label class="label_name">商品名称：</label> <span
					class="add_name"> <input name="cName" id="cName" type="text"
						class="text_add" />
				</span>
					<div class="prompt r_f"></div></li>

				<li><label class="label_name">商品类别：</label> <span
					class="add_name"> <select name="genreId" id="genreId"
						class="form-control col-xs-6" style="width: 150px">
							<option value="-1">-请选择类别</option>
							<c:forEach var="g" items="${genres}">
								<option value="${g.genreId}"
									<c:if test="${g.genreId==genreId}">selected="selected"</c:if>>${g.gName }</option>
							</c:forEach>
					</select>
				</span>
					<div class="prompt r_f"></div></li>

				<li><label class="label_name">商品单位：</label> <span
					class="add_name"> <select name="unitId" id="unitId"
						class="form-control col-xs-6" style="width: 150px">
							<option value="-1">-请选择单位</option>
							<c:forEach var="u" items="${units}">
								<option value="${u.unitId}"
									<c:if test="${u.unitId==unitId}">selected="selected"</c:if>>${u.uName }</option>
							</c:forEach>
					</select>
				</span>
					<div class="prompt r_f"></div></li>

				<li><label class="label_name">商品品牌：</label> <span
					class="add_name"> <select name="brandId" id="brandId"
						class="form-control col-xs-6" style="width: 150px">
							<option value="-1">-请选择品牌</option>
							<c:forEach var="b" items="${brands}">
								<option value="${b.brandId }"
									<c:if test="${b.brandId==brandId}">selected="selected"</c:if>>${b.bName }</option>
							</c:forEach>
					</select>
				</span>
					<div class="prompt r_f"></div></li>

				<li><label class="label_name">商品颜色：</label> <span
					class="add_name"> <select name="pigmentId" id="pigmentId"
						class="form-control col-xs-6" style="width: 150px" onchange="RndNum()">
							<option value="-1">-请选择颜色</option>
							<c:forEach var="p" items="${pigments}">
								<option value="${p.pigmentId }"
									<c:if test="${p.pigmentId==pigmentId}">selected="selected"</c:if>>${p.pName }</option>
							</c:forEach>
					</select>
				</span>
					<div class="prompt r_f"></div></li>

				<li><label class="label_name">商品尺寸：</label> <span
					class="add_name"> <select name="dimensionId"
						id="dimensionId" class="form-control col-xs-6"
						style="width: 150px">
							<option value="-1">-请选择尺寸</option>
							<c:forEach var="d" items="${dimensions}">
								<option value="${d.dimensionId }"
									<c:if test="${d.dimensionId==dimensionId}">selected="selected"</c:if>>${d.dName }</option>
							</c:forEach>
					</select>
				</span>
					<div class="prompt r_f"></div></li>

				<li><label class="label_name">供货商：</label> <span
					class="add_name"> <select name="supplierId" id="supplierId"
						class="form-control col-xs-6" style="width: 150px">
							<option value="-1">-请选择供货商</option>
							<c:forEach var="s" items="${suppliers}">
								<option value="${s.supplierId}"
									<c:if test="${s.supplierId==supplierId }">selected="selected"</c:if>>${s.sName }</option>
							</c:forEach>
					</select>
				</span>
					<div class="prompt r_f"></div></li>



				<li class="adderss"><label class="label_name">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
					<span class="add_name"> <textarea rows="3" cols="60"
							name="comments" style="height: 50px;"></textarea>
				</span>
					<div class="prompt r_f"></div></li>

			</ul>
		</div>
		<div style="text-align: center; margin-top: 20px">
			<a style="margin-top: 20px" class="btn btn-xs btn-info"
				href="javascript:;" id="submit">提交</a>&nbsp;&nbsp;&nbsp; <a
				style="margin-top: 20px" class="btn btn-xs btn-info"
				href="javascript:;" id="reset">重置</a>&nbsp;&nbsp;&nbsp; <a
				style="margin-top: 20px" class="btn btn-xs btn-info"
				href="javascript:;" id="close">关闭</a>
		</div>
	</form>
</body>
<script type="text/javascript">
	function RndNum() {
		var commodityId = $("#commodityId").val();
		var genreId = $("#genreId").val();
		if (genreId == 1) {
			genreId = "JK";
		} else if (genreId == 2) {
			genreId = "YRF";
		} else if (genreId == 3) {
			genreId = "DX";
		} else if (genreId == 4) {
			genreId = "CX";
		} else if (genreId == 5) {
			genreId = "WY";
		} else if (genreId == 6) {
			genreId = "DK";
		} else if (genreId == 7) {
			genreId = "NZ";
		} else if (genreId == 8) {
			genreId = "YD";
		} else if (genreId == 9) {
			genreId = "CS";
		} else if (genreId == 10) {
			genreId = "BN";
		}
		var pigmentId = $("#pigmentId").val();
		if (pigmentId == 1) {
			pigmentId = "HE";
		} else if (pigmentId == 2) {
			pigmentId = "BA";
		} else if (pigmentId == 3) {
			pigmentId = "HS";
		} else if (pigmentId == 4) {
			pigmentId = "HO";
		} else if (pigmentId == 5) {
			pigmentId = "TL";
		} else if (pigmentId == 6) {
			pigmentId = "LA";
		} else if (pigmentId == 7) {
			pigmentId = "HU";
		} else if (pigmentId == 8) {
			pigmentId = "SL";
		} else if (pigmentId == 9) {
			pigmentId = "ZS";
		} else if (pigmentId == 10) {
			pigmentId = "NH";
		} else if (pigmentId == 11) {
			pigmentId = "QT";
		}
		commodityId = genreId;
		for (var i = 0; i < 6; i++) {
			commodityId += Math.floor(Math.random() * 10);
		}
		commodityId +="-"+pigmentId;
		$("#commodityId").val(commodityId);
	}

	$(function() {
		/*重置*/
		$("#reset").click(function() {
			//重置当前页面
			window.location.reload();
		});

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
							//获取商品编号
							var commodityId = $("#commodityId").val();
							//获取商品名称
							var cName = $("#cName").val();
							if (cName == null || cName.length == 0) {
								layer.msg("商品名称不能为空！");
								return;
							}
							//获取类别
							var genreId = $("#genreId").val();
							if (genreId == null || genreId ==-1) {
								layer.msg("请选择商品类别！");
								return;
							}
							//获取单位
							var unitId = $("#unitId").val();
							if (unitId == null || unitId ==-1) {
								layer.msg("请选择商品单位！");
								return;
							}
							
							//获取品牌
							var brandId = $("#brandId").val();
							if (brandId == null || brandId ==-1) {
								layer.msg("请选择商品品牌！");
								return;
							}
							
							//获取颜色
							var pigmentId = $("#pigmentId").val();
							if (pigmentId == null || pigmentId ==-1) {
								layer.msg("请选择商品颜色！");
								return;
							}
							//获取尺寸
							var dimensionId = $("#dimensionId").val();
							if (dimensionId == null || dimensionId ==-1) {
								layer.msg("请选择商品尺寸！");
								return;
							}
							//获取供货商
							var supplierId = $("#supplierId").val();
							if (supplierId == null || supplierId ==-1) {
								layer.msg("请选择供货商！");
								return;
							}

							

							//获取备注
							var comments = $("textarea[name='comments']").val()
									.trim();
							//使用ajax修改员工信息

							$
									.post(
											"${pageContext.request.contextPath}/jsp/commodity_doadd.html",
											{
												"commodityId" : commodityId,
												"cName" : cName,
												"genreId" : parseInt(genreId),
												"unitId" : parseInt(unitId),
												"pigmentId" : parseInt(pigmentId),
												"dimensionId" : parseInt(dimensionId),
												"supplierId" : supplierId,
												"brandId" : parseInt(brandId),
												"comments" : comments
											},
											function(data) {
												if (data == "true") {
													layer
															.alert(
																	"添加成功！",
																	{
																		icon : 1,
																		btn : [ '确定' ],
																		yes : function() {
																			//当你在iframe页面关闭自身时					
																			var index = parent.layer
																					.getFrameIndex(window.name); //先得到当前iframe层的索引
																			parent.layer
																					.close(index); //再执行关闭
																		}
																	});

												} else {
													layer.msg("添加失败！");
													//刷新当前页面
													window.location.reload();
												}
											});
						});
	});
	//获取当前时间，格式YYYY-MM-DD
	function getNowFormatDate() {
		var date = new Date();
		var seperator1 = "-";
		var year = date.getFullYear();
		var month = date.getMonth() + 1;
		var strDate = date.getDate();
		if (month >= 1 && month <= 9) {
			month = "0" + month;
		}
		if (strDate >= 0 && strDate <= 9) {
			strDate = "0" + strDate;
		}
		var currentdate = year + seperator1 + month + seperator1 + strDate;
		return currentdate;
	}
</script>
</html>