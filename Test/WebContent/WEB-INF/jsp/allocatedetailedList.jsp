<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<title>调拨详细</title>
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
				<label class="label_name "></label> <input
							class="laydate-icon col-xs-4 col-lg-3" name="allocateTime" style="width: 160px"
							value="${allocateTime}" id="start"> 
							<button class="btn button_btn bg-deep-blue " onclick="search()"
							type="button" style="margin-left: 20px; margin-bottom: 2px ">
							<i class="fa  fa-search"></i>&nbsp;搜索
						</button>
				<div class="search  clearfix"></div>
			</div>
			<!--分类管理-->
			<div class="sort_list">
				<table class="table table_list table_striped table-bordered"
					id="sample-table">
					<thead>
						<tr id="first">
							<th>调拨编号</th>
							<th>商品名称</th>
							<th>商品单位</th>
							<th>商品品牌</th>
							<th>调拨时间</th>
							<th>原属仓库</th>
							<th>调走数量</th>
							<th>调往仓库</th>
							<th>调来数量</th>
							<th>调拨人</th>
						</tr>
						<div id="se">
							<c:forEach var="d" items="${pageUtil.lists }">
								<tr>
									<th>${d.allocateId }</th>
									<th>${d.allocatedetailedCName }</th>
									<th>${d.allocatedetailedUName}</th>
									<th>${d.allocatedetailedBName }</th>
									<th>${fn:substring(d.allocateTime,0,10) }</th>
									<th><c:if test="${d.theOriginalWarehouse == 1}">
											中央仓库
										</c:if> <c:if test="${d.theOriginalWarehouse == 2 }">
											一号仓库
										</c:if> <c:if test="${d.theOriginalWarehouse == 3 }">
											二号仓库
										</c:if></th>
									<th>${d.quantity }</th>
									<th>${d.allocatedetailedStoName }</th>
									<th>${d.quantity }</th>
									<th>${d.allocatedetailedSurName }</th>
								</tr>
							</c:forEach>
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
				</p>
			</div>
		</div>
	</form>

</body>
</html>
<script>

/* 设置内页框架布局 */
function search(){
		$("#form").submit();
	}

	/* 分页 */
	function jump(currenntPage) {
		$("#currenntPage").val(currenntPage);
		$("#form").submit();
	}

	

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
	  elem: '#start',
	  format: 'YYYY-MM-DD',
	 // min: laydate.now(), //设定最小日期为当前日期
	  max: '2099-06-16', //最大日期
	  istime: true,
	  istoday: false,
	  choose: function(datas){
	       end.min = datas; //开始日选好后，重置结束日的最小日期
	       end.start = datas //将结束日的初始值设定为开始日
	  }
	};
	var end = {
	  elem: '#end',
	  format: 'YYYY-MM-DD',
	  //min: laydate.now(),
	  max: '2099-06-16',
	  istime: true,
	  istoday: false,
	  choose: function(datas){
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
