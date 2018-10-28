<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
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
<body style="height: 560px; width: 1500px; overflow: scroll;">
	<form
		action="${pageContext.request.contextPath}/jsp/procurement_doadd.html"
		method="post">
		<div id="add_brand" class="margin">
			<div class="h_products_list clearfix mb20" id="Sellerber"
				style="height: 470px; width: 1290px">
				<div class="Sellerber_left menu" id="menuBar"
					style="margin-left: 1px;">
					<div class="menu_style" id="menu_style">
						<div class="list_content">
							<div class="side_list">
								<div class="left_add clearfix"
									style="width: 450px; float: left; height: 470px">
									<div class="column_title"
										style="margin-top: 2px; margin-left: 5px">生成订单</div>
									<div class="add_menber" id="add_menber_style">
										<ul class=" page-content">
											<li style="margin-top: 20px"><label class="label_name"
												style="margin-left: 12px">采购单编号：</label> <span
												class="add_name"> <input readonly="readonly"
													name="procurementId" id="procurementId" type="text"
													class="text_add" />
											</span>
												<div class="prompt r_f"></div></li>

											<li class="clearfix col-xs-4 col-lg-5 col-ms-5 "
												style="margin-top: 20px"><label class="label_name ">开单日期：</label>
												<input readonly="readonly"
												class="laydate-icon col-xs-4 col-lg-3" name="billingTime"
												id="start" style="margin-left: 10px; width: 165px;">
											</li>



											<li style="margin-top: 20px"><label class="label_name"
												style="margin-left: 12px">供应商名称：</label> <span
												class="add_name"> <select name="supplierId"
													id="supplierId" style="width: 159px" onchange="show()">
														<option value="-1">请选择</option>
														<c:forEach var="s" items="${suppliers}">
															<c:if test="${s.sStatus!=2 }">
																<option value="${s.supplierId}"
																	<c:if test="${s.supplierId==supplierId}">selected="selected"</c:if>>${s.sName}</option>
															</c:if>

														</c:forEach>
												</select>
											</span>
												<div class="prompt r_f"></div></li>



											<li style="margin-top: 20px"><label class="label_name">收货仓库：</label>
												<span class="add_name"> <select name="storehouseId"
													id="storehouseId" style="width: 165px">
														<option value="-1">请选择</option>
														<c:forEach var="s" items="${storehouses}">
															<option value="${s.storehouseId}"
																<c:if test="${s.storehouseId==storehouseId}">selected="selected"</c:if>>${s.stoName}</option>
														</c:forEach>
												</select>
											</span>
												<div class="prompt r_f"></div></li>

											<li style="margin-top: 20px"><label class="label_name"
												style="float: left; padding-right: 14px">经办人：</label> <span
												class="add_name"> <select name="userId" id="userId"
													style="width: 159px">
														<option value="0">请选择</option>
														<c:if test="${loginUser.id!=5 }">
															<c:forEach var="u" items="${users}">
																<option value="${u.id}"
																	<c:if test="${u.id==userId }">selected="selected"</c:if>
																	<c:if test="${u.jobId!=1 }">style="display:none;"</c:if>>${u.surname}</option>
															</c:forEach>
														</c:if>
												</select>
											</span>
												<div class="prompt r_f"></div></li>
											<input name="draftId" id="draftId" type="hidden"
												class="text_add" value="${loginUser.id}" />
											<li style="margin-top: 20px"><label class="label_name"
												style="float: left; padding-right: 14px">状态：</label> <span
												class="add_name"> <select name="condition"
													id="condition" style="width: 165px">
														<c:if test="${loginUser.id!=5 }">
															<option value="5">未发布</option>
														</c:if>
														<c:if test="${loginUser.id==5 }">
															<option value="2">未审核</option>
														</c:if>
												</select>
											</span>
												<div class="prompt r_f"></div></li>
											<li class="adderss" style="height: 100px; margin-top: 20px">
												<label class="label_name">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
												<span class="add_name"> <textarea rows="2" cols="50"
														name="comments" id="comments"
														style="height: 100px; width: 375px"></textarea>
											</span>
												<div class="prompt r_f"></div>
											</li>

											<li></li>
											<li></li>

										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="right_add list_Exhibition list_show"
					style="width: 1290px;">
					<div class="column_title" style="margin-top: 2px">添加商品</div>

					<div class="p_select_list clearfix">
						<div class="left_produt produt_select_style"
							style="height: 400px; width: 350px; overflow: scroll;">
							<div class="title_name">
								商品列表 <span class="seach_style"
									style="float: right; width: 220px;"> <input
									name="commodityId" id="commodityId" type="text" id="seach"
									class="seach" value="${commodityId}"><a
									href="javascript:;" onclick="show()"><i
										class="fa fa-search"></i></a>&nbsp;&nbsp;
								</span>
							</div>
							<div id="select_style" class="datatable_height">
								<div class=" datalist_show">
									<table class="table table_list table_striped table-bordered"
										id="">
										<thead>
											<tr>
												<td width="40" style="border-top: none; border-left: none;"><label><input
														id="a" type="checkbox" class="ace" /><span class="lbl"></span></label></td>
												<td
													style="border-top: none; border-left: none; border-right: none;">商品编号</td>
												<td
													style="border-top: none; border-left: none; border-right: none;">商品名称</td>
											</tr>
										</thead>
										<tbody id="tbody">
										</tbody>
									</table>
								</div>
							</div>
						</div>


						<div class="Switching_btn">

							<a href="javascript:void(0)" name="" onclick="add()"
								class="btn button_btn bg-deep-blue"
								style="width: 40px; height: 113px; margin-bottom: 20px; margin-left: 20px"
								title="新增商品">添</br>加</br>新</br>商</br>品
							</a> <span id="add" class="Switching" onclick="issuance_btn()">
								<input type="button" class="btn button_btn bg-deep-blue"
								value="添加" />
							</span> <span id="remove" class="Switching" onclick="deleteItem()">
								<input type="button" class="btn button_btn bg-deep-blue"
								value="移除" />
							</span>

						</div>
						<div class="right_product produt_select_style "
							style="height: 400px; width: 350px; overflow: scroll;">
							<div class="title_name">以添商品</div>
							<div id="select_style" class="datatable_height">
								<div class=" datalist_show">
									<table class="table table_list table_striped table-bordered"
										id="">
										<thead>
											<tr>
												<td width="40" style="border-top: none; border-left: none;"><label><input
														type="checkbox" class="ace" name="aaa" /><span
														class="lbl"></span></label></td>
												<td
													style="border-top: none; border-left: none; border-right: none;">商品编号</td>
												<td
													style="border-top: none; border-left: none; border-right: none;">商品名称</td>
											</tr>
										</thead>
										<tbody id="showPro">
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="operation clearfix mb20 same_module align"
			style="width: 1290px">
			<a class="btn btn-xs btn-info" href="javascript:;" id="submit"
				style="font-size: 15px"><em>提交</em></a>&nbsp;&nbsp;&nbsp; <a
				class="btn btn-xs btn-info" href="javascript:;" id="reset"
				style="font-size: 15px">重置</a>&nbsp;&nbsp;&nbsp; <a
				class="btn btn-xs btn-info"
				href="${pageContext.request.contextPath}/jsp/procurement_list.html"
				style="font-size: 15px">返回</a>
		</div>
		</div>
	</form>
	<div class="datalist_show" id="datalist_show" style="display: none;">
		<div class="bkg_List clearfix datatable_height confirm">
			<table class="table  table_list table_striped table-bordered">
				<thead>
					<tr>
						<th>供货商编号</th>
						<th>供货商名称</th>
						<th>单价</th>
						<th>数量</th>
					</tr>
				</thead>
				<tbody id="ad">

				</tbody>
			</table>
		</div>
	</div>

</body>
<script type="text/javascript">
	function del() {
		obj = document.getElementsByName("abc");
		check_val = "";
		for (k in obj) {
			if (obj[k].checked)
				check_val += obj[k].value + ",";
		}
		return check_val;
	}

	function deleteD() {
		var cps = document.getElementsByName("abc");
		for (var i = 0; i < cps.length; i++) {
			chk = cps[i].checked;
			if (chk) {
				$(cps[i].parentNode.parentNode.parentNode).remove();
			}
		}
	}

	/*批量删除*/
	function deleteItem() {
		if (!isChecked("abc")) {
			layer.msg("请选中要移除的商品！");
			return;
		}
		var a = del();
		layer.confirm('是否移除？', function(index) {
			$.post("${pageContext.request.contextPath}/jsp/dateiled_del.html",
					{
						"id" : a
					}, function(data) {
						if (data == "true") {
							deleteD();
							layer.msg('移除成功！');
						} else {
							layer.msg('移除失败！');
						}
					});
		});
	}

	function getPrice() {
		var a = "";
		var els = document.getElementsByName("price");
		for (var i = 0, j = els.length; i < j; i++) {
			a += els[i].value + ",";
		}
		return a;
	}
	//判断某个单选或复选按钮是否被选中至少一个
	function isChecked(chkName) {
		var cps = document.getElementsByName(chkName);
		var chk = false;
		for (var i = 0; i < cps.length; i++) {
			chk = cps[i].checked;
			if (chk) {
				break;
			}
		}
		return chk;
	}

	//判断某个单选或复选按钮是否被选中至少一个
	/*function isss() {
		var cps = document.getElementsByName("ace").checked;
		for (var i = 0; i < cps.length; i++) {
			chk = cps[i].checked;
			if (chk) {
				$(cps[i].parentNode).remove();
			}
		}
	}
	 */

	//获取选中商品编号
	function getid() {
		obj = document.getElementsByName("ace");
		check_val = "";
		for (k in obj) {
			if (obj[k].checked)
				check_val += obj[k].value + ",";
		}
		return check_val;
	}
	//获取选中商品id属性值
	function getid2() {
		obj = document.getElementsByName("ace");
		check_val = "";
		for (k in obj) {
			if (obj[k].checked)
				check_val += obj[k].nextSibling.firstChild.value + ",";
		}
		return check_val;
	}
	function getNumber() {
		var a = "";
		var els = document.getElementsByName("number");
		for (var i = 0, j = els.length; i < j; i++) {
			a += els[i].value + ",";
		}
		return a;
	}

	function issuance_btn() {
		$("#ad").html("");
		if (!isChecked("ace")) {
			layer.msg("请选中要添加商品！");
			return;
		}
		var a = getid().split(",");//获取编号
		var b = getid2().split(",");//获取供应商名称
		for (var i = 0; i < a.length - 1; i++) {
			$("#ad")
					.append(
							"<tr><td>"
									+ a[i]
									+ "</td><td>"
									+ b[i]
									+ "</td><td><input type='text' name='price' class='price'/></td><td><input type='text' name='number'  class='number'/></td></tr>");
		}
		layer
				.open({
					type : 1,
					title : '添加商品',
					maxmin : false,
					shadeClose : false, //点击遮罩关闭层
					area : [ '700px', '' ],
					btn : [ '确认', '取消' ],
					content : $('#datalist_show'),
					yes : function(index, layero) {//index 为当前页面索引，layero 为当前页面的DOM，所以可以利用下面的方式获取
						var procurementId = $("#procurementId").val();
						var commodityId = getid();
						var number = getNumber();
						var price = getPrice();
						$("#showPro").html("");
						layer
								.confirm(
										'以上信息是否确认？',
										function(index2) {
											$
													.post(
															"${pageContext.request.contextPath}/jsp/dateiled_add.html",
															{
																"procurementId" : procurementId,
																"commodityId" : commodityId,
																"number" : number,
																"price" : price
															},
															function(data) {
																for (i in data) {
																	$(
																			"#showPro")
																			.append(
																					"<tr><td width='40' style='border-top: none; border-left: none;' class='showpp'><label><input type='checkbox' class='ace'  name='abc' value='"+data[i].id+"'/><span class='lbl'></span></label></td><td>"
																							+ data[i].commodityId
																							+ "</td><td>"
																							+ data[i].commodity.cName
																							+ "</td></tr>");
																}
																/*isss();*/
																layer
																		.msg('添加成功！');
																layer
																		.close(index);
															}, "json");
										});

					}
				})
	}

	/*添加-商品*/
	function add() {
		layer
				.open({
					type : 2,
					title : '新增商品',
					maxmin : true,
					shadeClose : false, //点击遮罩关闭层
					area : [ '600px', '420px' ],
					content : '${pageContext.request.contextPath}/jsp/commodity_toadd.html',
				})
	}

	/******时间设置*******/
	var start = {
		elem : '#start',
		format : 'YYYY-MM-DD',
		// min: laydate.now(), //设定最小日期为当前日期
		max : getNowFormatDate(), //最大日期
		istime : true,
		istoday : false,
		choose : function(datas) {
			end.min = datas; //开始日选好后，重置结束日的最小日期
			end.start = datas //将结束日的初始值设定为开始日
		}
	};
	laydate(start);

	function RndNum() {
		var procurementId = $("input[name='procurementId']").val().trim();
		procurementId = "CG";
		for (var i = 0; i < 13; i++) {
			procurementId += Math.floor(Math.random() * 10);
		}
		$("#procurementId").val(procurementId);
	}

	function show() {

		var supplierId = $("#supplierId").val();
		var commodityId = $("#commodityId").val();

		$
				.post(
						"${pageContext.request.contextPath}/jsp/show_procurement.html",
						{
							"commodityId" : commodityId,
							"supplierId" : supplierId
						},
						function(data) {
							var a = JSON.parse(data);
							$("#tbody").children().remove();
							for (i = 0; i < data.length; i++) {
								$("#tbody")
										.append(
												"<tr><td width='40px' style='border-top: none; border-left: none;'><label><input  value='"+a[i].commodityId+"' name='ace' type='checkbox' class='ace'/><span class='lbl'><input  value='"+a[i].cName+"' name='cname' type='hidden'/></span></label></td><td style='border-top: none; border-left: none; border-right: none;'>"
														+ a[i].commodityId
														+ "</td><td style='border-top: none; border-left: none; border-right: none;'>"
														+ a[i].cName
														+ "</td></tr>");
							}
						});
	}

	$(function() {

		RndNum();
		var myDate = new Date();
		//获取当前年
		var year = myDate.getFullYear();
		//获取当前月
		var month = myDate.getMonth() + 1;
		//获取当前日
		var date = myDate.getDate();
		var billingTime = $("input[name='billingTime']").val().trim();
		billingTime = year + "-" + month + "-" + date;
		$("input[name='billingTime']").val(billingTime);
		/*重置*/
		$("#reset").click(function() {
			//重置当前页面
			window.location.reload();
		});

		/*添加*/
		$("#submit")
				.click(
						function() {
							//获取采购单号
							var procurementId = $("input[name='procurementId']")
									.val().trim();
							//获取开单时间
							var billingTime = $("input[name='billingTime']")
									.val().trim();
							var draftId = $("#draftId").val();
							//获取供应商名称
							var supplierId = $("#supplierId").val();
							if (supplierId == "" || supplierId == "-1") {
								layer.msg("请选择供货商！");
								return;
							}
							//获取收货仓库
							var storehouseId = $("#storehouseId").val();
							if (storehouseId == "" || storehouseId == "-1") {
								layer.msg("请选择收货仓库！");
								return;
							}

							//获取经办人
							var userId = $("#userId").val();
							//获取状态
							var condition = $("#condition").val();
							//获取备注信息
							var comments = $("#comments").val();
							//使用ajax新增供应商信息
							$
									.post(
											"${pageContext.request.contextPath}/jsp/procurement_doadd.html",
											{
												"procurementId" : procurementId,
												"billingTime" : billingTime,
												"supplierId" : supplierId,
												"storehouseId" : parseInt(storehouseId),
												"userId" : parseInt(userId),
												"draftId" : parseInt(draftId),
												"condition" : parseInt(condition),
												"comments" : comments
											}, function(data) {
												if (data == "true") {
													layer.alert("采购单创建成功！", {
														icon : 1,
														btn : [ '确定' ],
														yes : function() {
															window.history
															.go(-1).reload();
														}
													});

												} else {
													layer.msg("采购单创建失败！");
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
	//判断某个单选或复选按钮是否被选中至少一个
	function isChecked(chkName) {
		var cps = document.getElementsByName(chkName);
		var chk = false;
		for (var i = 0; i < cps.length; i++) {
			chk = cps[i].checked;
			if (chk) {
				break;
			}
		}
		return chk
	}

	/********************列表操作js******************/
	$('table thead  input:checkbox').on(
			'click',
			function() {
				var that = this;
				$(this).closest('table').find(
						'tr > td:first-child input:checkbox').each(function() {
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});

			});
</script>
</html>