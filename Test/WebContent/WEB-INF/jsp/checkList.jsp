<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
<title>库存盘点</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
	<form action="" method="post" id="form">
		<div class="margin advertising" id="page_style">
			<div class="operation clearfix">
				<select name="storehouseId" id="storehouseId"
					class="form-control col-xs-6" style="width: 10%">
					<c:forEach var="s" items="${storehouses }">
						<option value="${s.storehouseId }"
							<c:if test="${s.storehouseId eq storehouseId}">
									selected
								</c:if>>${s.stoName }</option>
					</c:forEach>
				</select>

				<div class="search  clearfix">
					<input type="hidden" id="currenntPage" name="currenntPage"  /> 盘点编号:<input
						type="text" id="checkId" name="checkId" disabled="disabled" value="${checkId }" style='border-left:0px;border-top:0px;border-right:0px;border-bottom:1px ' 
						/> &nbsp;&nbsp;&nbsp;&nbsp;
				</div>
			</div>
			<!--分类管理-->
			<div class="sort_list">
				<table class="table table_list table_striped table-bordered"
					id="sample-table">
					<thead>
						<tr id="first">
							<th>商品编号</th>
							<th>商品名称</th>
							<th>商品单位</th>
							<th>商品品牌</th>
							<th>库存量</th>
							<th>盘点量</th>
							<th>盘点差距</th>
							<th>所属仓库</th>
							<th>操作</th>
						</tr>
						<div id="se">
							<c:forEach var="r" items="${pageUtil.lists }">
								<tr>
									<th>${r.commodityId }</th>
									<th>${r.repertoryCName }</th>
									<th>${r.repertoryUName}</th>
									<th>${r.repertoryBName }</th>
									<th id="${inventory }">${r.inventory }</th>
									<th width="8%"><input type="text"
										name="jisuan"
										onkeyup="value=value.replace(/[^\d]/g,'')"
										placeholder="请手动输入盘点量" 
										 style='border-left:0px;border-top:0px;border-right:0px;border-bottom:1px;background-color: #F2F2F2 ' /></th>
									<th>
									<input type="text"
										name="inventoryGap" id="inventoryGap" readonly
										 style='border-left:0px;border-top:0px;border-right:0px;
										 border-bottom:1px;background-color: #F2F2F2 ' />
									</th>
									<th>${r.repertorySeName }</th>
									<th>
									<a title="报损" onclick="add_AD_baosun('${r.commodityId }','${r.unitId}','${r.brandId }','${r.storehouseId }')"
										href="javascript:void()"
										class="btn bg-deep-blue  operation_btn" id="baosun" style="display: none">报损</a>
										<a title="报溢" href="javascript:void()"
										onclick="add_AD_baoyi('${r.commodityId }','${r.unitId}','${r.brandId }','${r.storehouseId }')"
										class="btn btn-danger operation_btn"  id="baoyi" style="display: none">报溢</a></th>
								</tr>
							</c:forEach>
							<input type="hidden" name="overflowOrBreakage" id="overflowOrBreakage"/>
						</div>
					</thead>
					<tbody>
						<tr>
						</tr>
					</tbody>
				</table>
				<p style="margin-top: 5px; text-align: center;">
					<a href="javascript:jump(1)" class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>首页</a>
					<a href="javascript:jump(${pageUtil.currentPage-1})"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>上一页</a>
					<a href="javascript:jump(${pageUtil.currentPage+1})"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==pageUtil.totalPage}">style="display: none;"</c:if>>下一页</a>
					<a href="javascript:jump(${pageUtil.totalPage})"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==pageUtil.totalPage}">style="display: none;"</c:if>>尾页</a>
					<span style="font-size: 16px;">第${pageUtil.currentPage}页/共${pageUtil.totalPage}页</span>
					<%-- 	<a
						href="${pageContext.request.contextPath}/jsp/check.html?currenntPage=1&storehouseId=${storehouseId}"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>首页</a>&nbsp;&nbsp;
					<a
						href="${pageContext.request.contextPath}/jsp/check.html?currenntPage=${pageUtil.currentPage-1}&storehouseId=${storehouseId}"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>上一页</a>&nbsp;&nbsp;
					<a
						href="${pageContext.request.contextPath}/jsp/check.html?currenntPage=${pageUtil.currentPage+1}&storehouseId=${storehouseId}"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==pageUtil.totalPage}">style="display: none;"</c:if>>下一页</a>&nbsp;&nbsp;
					<a
						href="${pageContext.request.contextPath}/jsp/check.html?currenntPage=${pageUtil.totalPage}&storehouseId=${storehouseId}"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==pageUtil.totalPage}">style="display: none;"</c:if>>尾页</a> --%>
					<%-- <span style="font-size: 16px;">第${pageUtil.currentPage}页/共${pageUtil.totalPage}页</span> --%>
				</p>
			</div>
		</div>
	</form>

</body>
</html>
<script>

/* 添加报溢信息 */
function add_AD_baoyi(commodityId,unitId,brandId,storehouseId){
	/*  获取盘点量和库存量之间的差*/
	var text = $("input[name='jisuan']").val();
	var text2 = $("input[name='jisuan']").parent().prev().html();
	var inventoryGap = text - text2;
	var checkId = $("#checkId").val();
	var overflowOrBreakage = $("#overflowOrBreakage").val();
	var overflowOrBreakage=1;
	layer.confirm('是否确认报溢？', function(index) {
		
		$.post("${pageContext.request.contextPath}/jsp/addDetail",
				{"commodityId":commodityId,"unitId":unitId,"brandId":brandId,"inventoryGap":inventoryGap,
				  "checkId":checkId,"overflowOrBreakage":overflowOrBreakage,"storehouseId":storehouseId},
				  function(data){
					  if(data=="true"){
						  layer.msg('报溢成功!', {
								icon : 1,
								time : 1000
							});
						  $("#baoyi").hide();
					  }
					  
				  });
	});	
};



/* 添加报损信息 */
function add_AD_baosun(commodityId,unitId,brandId,storehouseId){
	/*  获取盘点量和库存量之间的差*/
	var text = $("input[name='jisuan']").val();
	var text2 = $("input[name='jisuan']").parent().prev().html();
	var inventoryGap = text - text2;
	var checkId = $("#checkId").val();
	var overflowOrBreakage = $("#overflowOrBreakage").val();
	var overflowOrBreakage=2;
	layer.confirm('是否确认报损？', function(index) {
		$.post("${pageContext.request.contextPath}/jsp/addDetail",
				{"commodityId":commodityId,"unitId":unitId,"brandId":brandId,"inventoryGap":inventoryGap,
				  "checkId":checkId,"overflowOrBreakage":overflowOrBreakage,"storehouseId":storehouseId},
				  function(data){
					  if(data=="true"){
						  layer.msg('报损成功!', {
								icon : 1,
								time : 1000
							});
						  $("#baosun").hide();
					  }
				  });
	});
};
	
	

	/*点击仓库列表下拉框，自动在表格中显示别的值  */
	$(function() {
		$("#storehouseId")
				.change(
						function() {
							var id = $("#storehouseId").val();
							window.location.href = "${pageContext.request.contextPath}/jsp/check.html?storehouseId="
									+ id;
						});
	});

	/* input change事件，获取输入的值，与盘点量比较，然后计算差距 */
	$(function() {
		$("input[name='jisuan']").change(
				function() {
					//输入的值
					var text = $(this).val();
					//库存量
					var text2 = $(this).parent().prev().html();
					var cha = text - text2;
					$(this).parent().next().html(cha);
					if (text > text2) {
						$(this).parent().next().next().next().children(
								"a:eq(1)").show();
						$(this).parent().next().next().next().children(
								"a:eq(0)").hide();
					} else	{
						$(this).parent().next().next().next().children(
								"a:eq(0)").show();
						$(this).parent().next().next().next().children(
								"a:eq(1)").hide();
					}
				});
	});

	/* 分页 */
	function jump(currenntPage) {
		$("#currenntPage").val(currenntPage);
		$("#form").submit();
	}

	/* 根据商品编号查重 */
	$("#commodityId").change(function() {
		var id = $("#commodityId").val();
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/jsp/chaChong",
			data : {
				'commodityId' : id
			},
			dataType : "json",
			success : function(data) {
				if (data == true) {
					$(".layui-layer-btn0").hide();
					$("#msg").text("商品编号不可以使用").css({
						color : "red"
					});
				} else {
					$(".layui-layer-btn0").show();
					$("#msg").text("商品编号可以使用").css("color", "green");
				}
			}
		});
	});

	jQuery(function($) {
		var oTable1 = $('#sample-table').dataTable({
			"data" : dataSet,
			"width" : "100%",
			"bLengthChange" : false,
			"iDisplayLength" : 20,
			//"columns" : _tableCols,
			"aaSorting" : [ [ 1, "desc" ] ],//默认第几个排序
			"bStateSave" : true,//状态保存
			"searching" : false,
			"aoColumnDefs" : [ {
				"orderable" : false,
				"aTargets" : [ 0, 2, 3 ]
			} ]

		});

		$('table th input:checkbox').on(
				'click',
				function() {
					var that = this;
					$(this).closest('table').find(
							'tr > td:first-child input:checkbox').each(
							function() {
								this.checked = that.checked;
								$(this).closest('tr').toggleClass('selected');
							});

				});
	});
	/*库存-删除*/
	function picture_del(obj, id, inventory) {
		layer.confirm('确认要删除吗？', function(index) {
			$.post("${pageContext.request.contextPath}/jsp/deleteRepertory", {
				"commodityId" : id,
				"inventory" : inventory
			}, function(data) {
				if (data == "true") {
					$(obj).parents("tr").remove();
					layer.msg('已删除!', {
						icon : 1,
						time : 1000
					});
				} else if (data == "false") {
					layer.msg('库存数量大于0，不能删除!', {
						icon : 1,
						time : 1000
					});
				}
			});
		});
	}

	/*库存-编辑*/
	function member_edit(id) {
		layer
				.open({
					type : 2,
					title : '修改库存信息',
					maxmin : true,
					shadeClose : true, //点击遮罩关闭层
					scrollbar : true,
					area : [ '800px', '450px' ],
					content : "${pageContext.request.contextPath}/jsp/repertoryUpdate?id="
							+ id
				});
	}

	/*checkbox激发事件*/
	$('#checkbox').on('click', function() {
		if ($('input[name="checkbox"]').prop("checked")) {
			$('.Date_selection ').css('display', 'block');
		} else {

			$('.Date_selection').css('display', 'none');
		}
	});
	/******时间设置*******/
	var start = {
		elem : '#start',
		format : 'YYYY-MM-DD',
		min : laydate.now(), //设定最小日期为当前日期
		max : '2099-06-16', //最大日期
		istime : true,
		istoday : false,
		choose : function(datas) {
			end.min = datas; //开始日选好后，重置结束日的最小日期
			end.start = datas //将结束日的初始值设定为开始日
		}
	};
	var end = {
		elem : '#end',
		format : 'YYYY-MM-DD',
		min : laydate.now(),
		max : '2099-06-16',
		istime : true,
		istoday : false,
		choose : function(datas) {
			start.max = datas; //结束日选好后，重置开始日的最大日期
		}
	};
	laydate(start);
	laydate(end);
	/*******滚动条*******/
	$("body").niceScroll({
		cursorcolor : "#888888",
		cursoropacitymax : 1,
		touchbehavior : false,
		cursorwidth : "5px",
		cursorborder : "0",
		cursorborderradius : "5px"
	});
	function checkLength(which) {
		var maxChars = 200; //
		if (which.value.length > maxChars) {
			layer.open({
				icon : 2,
				title : '提示框',
				content : '您出入的字数超多限制!',
			});
			// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
			which.value = which.value.substring(0, maxChars);
			return false;
		} else {
			var curr = maxChars - which.value.length; //200 减去 当前输入的
			document.getElementById("sy").innerHTML = curr.toString();
			return true;
		}
	};
</script>
