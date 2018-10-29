<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
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
	src="${pageContext.request.contextPath }/statics/js/Sellerber.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/shopFrame.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery.dataTables.bootstrap.js"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/layer/layer.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/laydate/laydate.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/proTree.js"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<title>采购计划</title>
</head>
<body>

	<div class="margin" id="page_style">
		<!--列表展示-->
		<form id="form1"
			action="${pageContext.request.contextPath}/jsp/procurement_list2.html"
			method="post">
			<div class="list_Exhibition list_show padding15">
				<div class="operation clearfix mb15  searchs_style">
					<div class="search  clearfix" style="margin-right: 150px">
						<label class="label_name">单据号：</label> <input name="procurementId"
							type="text" class="" value="${procurementId }" />
						<button class="btn button_btn bg-deep-blue " onclick="search()"
							type="button" style="margin-left: 20px; margin-bottom: 2px">
							<i class="fa  fa-search"></i>&nbsp;搜索
						</button>
					</div>
					<div class="search  clearfix">
						<label class="label_name ">开单日期：</label> <input
							class="laydate-icon col-xs-4 col-lg-3" name="begintime"
							value="${begintime}" id="start"> <span
							style="float: left; padding: 0px 5px; line-height: 32px;">至</span>
						<input class="laydate-icon col-xs-4 col-lg-3" name="endtime"
							value="${endtime}" id="end">

					</div>
		</form>

	</div>
	<div class=" datalist_show">
		<div class="datatable_height confirm">
			<table class="table table_list table_striped table-bordered" id="">
				<thead>
					<tr>
						<td>单据号</td>
						<td>开单日期</td>
						<td>供货商</td>
						<td>收货仓库</td>
						<td>经办人</td>
						<td>制定人</td>
						<td>签收状态</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${pageUtil.lists}" var="p">
						<c:if test="${loginUser.id==p.userId}">
							<input type="hidden" name="condition" class="condition"
								value="${p.condition }" />
							<tr>
								<td>${p.procurementId }</td>
								<td>${p.billingTime }</td>
								<td>${p.sName }</td>
								<td>${p.stoName }</td>
								<td>${p.surname }</td>
								<td>${p.draName }</td>
								<c:if test="${p.sign==1}">
									<td class="td-status">已签收</td>
								</c:if>
								<c:if test="${p.sign==2}">
									<td class="td-status">未签收</td>
								</c:if>
								<td class="td-manage"><a
									onClick="member_stop(this,'${ p.procurementId}','${p.sign}')"
									href="javascript:;" title="签收"
									class="<c:if test="${p.sign==2}">btn btn-xs btn-status</c:if>"><c:if
											test="${p.sign==2}">签收</c:if></a> <a title="查看"
									onclick="procurementinfo(this)"
									href="javascript:;${p.procurementId}"
									class="btn btn-xs btn-info">查看</a></td>
							</tr>
						</c:if>
					</c:forEach>



				</tbody>
			</table>
			<p style="margin-top: 5px; text-align: center;">
				<a
					href="${pageContext.request.contextPath}/jsp/procurement_list2.html?pageindex=1"
					class="btn btn-xs btn-info"
					<c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>首页</a>&nbsp;&nbsp;
				<a
					href="${pageContext.request.contextPath}/jsp/procurement_list2.html?pageindex=${pageUtil.currentPage-1}&procurementId=${procurementId }&begintime=${begintime}&endtime=${endtime}"
					class="btn btn-xs btn-info"
					<c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>上一页</a>&nbsp;&nbsp;
				<a
					href="${pageContext.request.contextPath}/jsp/procurement_list2.html?pageindex=${pageUtil.currentPage+1}&procurementId=${procurementId }&begintime=${begintime}&endtime=${endtime}"
					class="btn btn-xs btn-info"
					<c:if test="${pageUtil.currentPage==pageUtil.totalPage}">style="display: none;"</c:if>>下一页</a>&nbsp;&nbsp;
				<a
					href="${pageContext.request.contextPath}/jsp/procurement_list2.html?pageindex=${pageUtil.totalPage}&procurementId=${procurementId }&begintime=${begintime}&endtime=${endtime}"
					class="btn btn-xs btn-info"
					<c:if test="${pageUtil.currentPage==pageUtil.totalPage}">style="display: none;"</c:if>>尾页</a>
				<span style="font-size: 16px;">第${pageUtil.currentPage}页/共${pageUtil.totalPage}页</span>
			</p>
		</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>
<script>
/*签收*/
function member_stop(obj,id,con){
	var con=1;
	layer.confirm('是否签收？',function(index){
		$.post("${pageContext.request.contextPath}/jsp/procurement_qianshou.html",
				{
					"procurementId" : id,
					"sign":con
				}, function(data) {
					layer.alert("签收成功！",{
						icon:1,
						btn:['确定'],
						yes:function(){
							location.reload();//刷新父级页面
						}
					});
				});
	});
}

//查看订单详情
function procurementinfo(id){
	 layer.open({
        type: 2,
        title: '采购单详情',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['800px' , '480px'],
        content:'${pageContext.request.contextPath}/jsp/procurement_show.html?id='+id,
	 })
}

	$(function () { $(".displayPart").displayPart();  });
	//设置内页框架布局
	function search(){
			$("#form1").submit();
		}
		$(function() { 
			$("#a").change(function(){
				var that = this;
				$(this).closest('table').find('td input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
			});
		$("#Sellerber").frame({
			float : 'left',
			color_btn:'.skin_select',
			Sellerber_menu:'.list_content',
			page_content:'.list_show',//内容
			datalist:".datatable_height",//数据列表高度取值
			header:65,//顶部高度
			mwidth:200,//菜单栏宽度
			
		});
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
</script>
