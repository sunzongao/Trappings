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
<form action="${pageContext.request.contextPath}/jsp/doRepertoryUpdate" method="post">
		<div id="ad_sort">
			<div class="add_style">
				<ul>
					<li class="clearfix"><label class="label_name col-xs-2">商品编号：&nbsp;&nbsp;</label><span
						class="cont_style col-xs-9"> <select name="commodityId"
							id="commodityId" class="form-control col-xs-6" style="width: 30%">
								<c:forEach var="c1" items="${commoditys }">
									<option value="${c1.commodityId }"
										<c:if test="${c1.commodityId eq  repertory.commodityId}">
											selected
										</c:if>
									>${c1.commodityId }</option>
								</c:forEach>
						</select>
						<span id="msg"></span>
					</span></li>
					<li class="clearfix"><label class="label_name col-xs-2">商品名称：&nbsp;&nbsp;</label><span
						class="cont_style col-xs-9"> <input name="cName" type="text"
							id="cName" disabled="disabled" class="col-xs-10 col-sm-5"
							style="width: 450px" value="${repertory.cName }">
					</span></li>
					<li class="clearfix"><label class="label_name col-xs-2">库存数量：&nbsp;&nbsp;</label><span
						class="cont_style col-xs-9"> <input name="inventory" type="text"
							id="inventory" class="col-xs-10 col-sm-5" style="width: 450px" value="${repertory.inventory }"></span></li>
					<li class="clearfix"><label class="label_name col-xs-2">商品单位：&nbsp;&nbsp;</label><span
						class="cont_style col-xs-9"> <select name="unitId"
							id="unitId" class="form-control col-xs-6" style="width: 30%">
								<c:forEach var="u1" items="${units }">
									<option value="${u1.unitId }"
										<c:if test="${u1.unitId eq repertory.unitId }">
											selected
										</c:if>
									>${u1.uName }</option>
								</c:forEach>
						</select>
					</span></li>
					<li class="clearfix"><label class="label_name col-xs-2">商品品牌：&nbsp;&nbsp;</label><span
						class="cont_style col-xs-9"> <select name="brandId"
							id="brandId" class="form-control col-xs-6" style="width: 30%">
								<c:forEach var="b1" items="${brands }">
									<option value="${b1.brandId }"
										<c:if test="${b1.brandId eq repertory.brandId }">
											selected
										</c:if>
									>${b1.bName }</option>
								</c:forEach>
						</select>
					</span></li>
					<li class="clearfix"><label class="label_name col-xs-2">供
							应 商：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"> <select
							name="supplierId" id="supplierId" class="form-control col-xs-6"
							style="width: 30%">
								<c:forEach var="s1" items="${suppliers }">
									<option value="${s1.supplierId }"
										<c:if test="${s1.supplierId eq repertory.supplierId }">
											selected
										</c:if>
									>${s1.sName }</option>
								</c:forEach>
						</select></span></li>
					<li class="clearfix"><label class="label_name col-xs-2">所属仓库：&nbsp;&nbsp;</label><span
						class="cont_style col-xs-9"> <select name="storehouseId"
							id="storehouseId" class="form-control col-xs-6"
							style="width: 30%" onchange="select(this)">
								<c:forEach var="s1" items="${storehouses }">
									<option value="${s1.storehouseId }"
										<c:if test="${s1.storehouseId eq  repertory.storehouseId}">
											selected
										</c:if>
									>${s1.stoName }</option>
								</c:forEach>
						</select>
					</span>
					</li>
				</ul>
			</div>
		</div>
		<p style="text-align: center;">
			<a class="btn bg-deep-blue  operation_btn" href="javascript:;" id="submit">修改</a>&nbsp;&nbsp;&nbsp; 
			<a class="btn bg-deep-blue  operation_btn" href="javascript:;" id="close" >取消</a>
		</p>
	</form> 
	<script type="text/javascript">
	 /*点击商品列表下拉框，自动在input标签中显示别的值  */
	 $(function(){
			$("#commodityId").change(function(){
				var id = $("#commodityId").val();
				var cName = $("#cName").val();
				$.ajax({
						type:"post",
						url:"${pageContext.request.contextPath}/AjaxErJiLianDong",
						data:{'CommodityId':id},
						success:function(data){
							$("#cName").val(data);
						}
				})
			})	; 
		 });
	 
	 /* 根据商品编号查重 */
		$("#commodityId").change(function(){
			var id = $("#commodityId").val();
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/jsp/chaChong",
				data:{'commodityId':id},
				dataType:"json",
				success:function(data){
					if(data==true){
						$("#submit").hide();
						$("#msg").text("商品编号不可以使用").css({color:"red"});
					}else{
						$("#submit").show();
						$("#msg").text("商品编号可以使用").css("color","green");
					}
				}
			});
		}); 

	 	$(function(){
		/*取消*/
		$("#close").click(function(){
			//当你在iframe页面关闭自身时					
			var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			parent.layer.close(index); //再执行关闭
		});
	 	});
	$(function(){
		/*提交修改*/
		$("#submit").click(function(){
			var commodityId = $("#commodityId").val().trim();
			var cName = $("#cName").val().trim();
			var unitId = $("#unitId").val().trim();
			var brandId = $("#brandId").val().trim();
			var supplierId = $("#supplierId").val().trim();
			var storehouseId = $("#storehouseId").val().trim();
			var inventory = $("input[name='inventory']").val().trim();
			if(inventory==0){
				layer.msg("库存数量不能为空！");
				return;
			}
			//使用ajax修改员工信息
			$.post(
			"${pageContext.request.contextPath}/jsp/doRepertoryUpdate",
			{	
				"commodityId":commodityId,
				"cName":cName,
				"inventory":inventory,
				"unitId":unitId,
				"brandId":brandId,
				"supplierId":supplierId,
				"storehouseId":storehouseId
			},function(data){
				if(data=="true"){
					layer.alert("修改成功！",{
						icon:1,
						btn:['确定'],
						yes:function(){
							//当你在iframe页面关闭自身时					
							var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
							parent.location.reload();//刷新父级页面
							parent.layer.close(index); //再执行关闭
						}
					});
					
				}else{
					layer.msg("修改失败！");
					//刷新当前页面
					window.location.reload();
				}
			}
			);
		});
	});
	</script>
</body>
</html>