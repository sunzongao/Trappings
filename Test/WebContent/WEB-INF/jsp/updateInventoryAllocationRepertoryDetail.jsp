<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
<script
	type="${pageContext.request.contextPath }/statics/text/javascript"
	src="js/jquery.cookie.js"></script>
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
<script
	src="${pageContext.request.contextPath }/statics/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery.dataTables.bootstrap.js"></script>
</head>
<body>
	<form action="" method="post">
		<input type="hidden" name="commodityId" id="commodityId"
			value="${repertory.commodityId }" /> <input type="hidden"
			name="storehouseId" id="storehouseId"
			value="${repertory.storehouseId }">
		<div id="ad_sort">
			<div class="add_style">
				<ul>
					<li class="clearfix"><label class="label_name col-xs-2">库存数量：&nbsp;&nbsp;</label><span
						class="cont_style col-xs-9"> <input name="inventory"
							type="text" id="inventory" class="col-xs-10 col-sm-5"
							style="width: 450px" value="${repertory.inventory }"></span></li>
					<li class="clearfix"><label class="label_name col-xs-2">所属仓库：&nbsp;&nbsp;</label><span
						class="cont_style col-xs-9"> <select name="storehouseId"
							id="storehouseId" class="form-control col-xs-6"
							style="width: 30%">
								<c:forEach var="s" items="${storehouses }">
									<option value="${s.storehouseId }"
										<c:if test="${s.storehouseId eq storehouseId}">
									selected
								</c:if>>${s.stoName }</option>
								</c:forEach>
						</select>
					</span></li>
				</ul>
			</div>
		</div>
		<p style="text-align: center;">
			<a class="btn bg-deep-blue  operation_btn" href="javascript:;"
				id="submit">调拨</a>&nbsp;&nbsp;&nbsp; <a
				class="btn bg-deep-blue  operation_btn" href="javascript:;"
				id="close">取消</a>
		</p>
	</form>
	<script type="text/javascript">
		$(function() {
			/*取消*/
			$("#close").click(function() {
				//当你在iframe页面关闭自身时					
				var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
				parent.layer.close(index); //再执行关闭
			});
		});
		$(function() {
			/*提交修改*/
			$("#submit")
					.click(
							function() {
								var storehouseId = $("#storehouseId").val();
								var commodityId = $("#commodityId").val();
								//使用ajax调拨最低库存
								$
										.post(
												"${pageContext.request.contextPath}/jsp/updateInventoryAllocationRepertoryDetail",
												{
													"storehouseId" : storehouseId,
													"commodityId" : commodityId
												},
												function(data) {
													if (data == "true") {
														layer
																.alert(
																		"调拨成功！",
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
														layer.msg("调拨失败！");
														//刷新当前页面
														window.location
																.reload();
													}
												});
							});
		});
	</script>
</body>
</html>