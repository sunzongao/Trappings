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
<title>供应商管理</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
	<div class="margin" id="page_style">
		<div class="operation clearfix same_module mb15">
			<form id="form1"
				action="${pageContext.request.contextPath}/jsp/supplier_list.html"
				method="post">
				<ul class="choice_search">
					<li class="clearfix col-xs-2 col-lg-2 col-ms-3 "><label
						class="label_name " style="width: 80px">供货商名称：</label><input
						name="sName" value="${sName}" type="text"
						class="form-control col-xs-6 col-lg-5" style="width: 100px" /></li>
					<button class="btn button_btn bg-deep-blue " onclick="search()"
						type="button">
						<i class="fa  fa-search"></i>&nbsp;搜索
					</button>
				</ul>
			</form>
		</div>
		<div class="h_products_list clearfix" id="Sellerber">
			<div class="Sellerber_left menu" id="menuBar">
				<div class="show_btn" id="rightArrow">
					<span></span>
				</div>
				<div class="side_title">
					<a title="隐藏" class="close_btn"><span></span></a>
				</div>
				<div class="menu_style" id="menu_style">
					<div class="list_content"></div>
				</div>
			</div>
		</div>
		<shiro:hasPermission name="GYSLB">
			<div class="bkg_List_style list_Exhibition list_show padding15">

				<div class="bkg_List_operation clearfix searchs_style">

					<ul class="bkg_List_Button_operation">
						<li class="btn btn-danger"><a href="javascrpt:void()"
							onclick="deleteItem()" class="btn_add"><em
								class="bkg_List_icon icon_add"></em>批量删除</a></li>
					</ul>

				</div>
		</shiro:hasPermission>
		<div class="datalist_show">
			<div class="bkg_List clearfix datatable_height confirm">
				<table class="table  table_list table_striped table-bordered">
					<thead>
						<tr>
							<shiro:hasPermission name="GYSLB">
								<th width="40"><label><input id="a" type="checkbox"
										class="ace" /><span class="lbl"></span></label></th>
							</shiro:hasPermission>
							<th>供货商编号</th>
							<th>供货商名称</th>
							<th>联系人</th>
							<th>联系电话</th>
							<th>Email</th>
							<th>联系地址</th>
							<th>合作时间</th>
							<th>状态</th>
							<shiro:hasPermission name="GYSLB">
							<th>编辑</th>
							</shiro:hasPermission>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pageUtil.lists}" var="s">
							<tr>
								<shiro:hasPermission name="GYSLB">
									<td><label><input type="checkbox"
											value="${s.supplierId}" name="ace" class="ace"><span
											class="lbl"></span></label></td>
								</shiro:hasPermission>
								<td>${s.supplierId}</td>
								<td><a href="javascript:;${s.supplierId }"
									onClick="userinfo(this)">${s.sName}</a></td>
								<td>${s.sContacts}</td>
								<td>${s.sPhone}</td>
								<td>${s.sEmail}</td>
								<td>${s.sAddress}</td>
								<td>${s.sDate}</td>
								<c:if test="${s.sStatus==1}">
									<td>启用</td>
								</c:if>
								<c:if test="${s.sStatus==2}">
									<td>禁用</td>
								</c:if>
								<shiro:hasPermission name="GYSLB">
								<td class="td-manage"><a title="编辑"
									onclick="member_edit(this)" href="javascript:;${s.supplierId}"
									class="btn btn-xs btn-info">编辑</a> <a title="删除"
									onclick="member_del(this,'${s.supplierId}')"
									href="javascript:;" class="btn btn-xs btn-delete">删除</a></td>
									</shiro:hasPermission>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<p style="margin-top: 5px; text-align: center;">
					<a
						href="${pageContext.request.contextPath}/jsp/supplier_list.html?pageindex=1&sName=${sName}"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>首页</a>&nbsp;&nbsp;
					<a
						href="${pageContext.request.contextPath}/jsp/supplier_list.html?pageindex=${pageUtil.currentPage-1}&sName=${sName}"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>上一页</a>&nbsp;&nbsp;
					<a
						href="${pageContext.request.contextPath}/jsp/supplier_list.html?pageindex=${pageUtil.currentPage+1}&sName=${sName}"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==pageUtil.totalPage}">style="display: none;"</c:if>>下一页</a>&nbsp;&nbsp;
					<a
						href="${pageContext.request.contextPath}/jsp/supplier_list.html?pageindex=${pageUtil.totalPage}&sName=${sName}"
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
//判断某个单选或复选按钮是否被选中至少一个
function isChecked(chkName){
	var cps = document.getElementsByName(chkName);
	var chk = false;
	for(var i=0;i<cps.length;i++){
		chk =cps[i].checked;
		if(chk){
			break;
		}
	}
	return chk
}

//获取选中员工id
function getid(){
	 obj = document.getElementsByName("ace");
	    check_val = "";
	    for(k in obj){
	        if(obj[k].checked)
	        	check_val+=obj[k].value+",";
	    }
	    return check_val;
}
/*批量删除*/
function deleteItem(){
	if(!isChecked("ace")){
		layer.msg("请选中要删除的供应商！");
		return;
	}
	var a=getid();
	layer.confirm('确认要删除多条记录吗？',function(index){
		$.post(
				"${pageContext.request.contextPath}/jsp/supplier_todelete.html",
				{
					"id":a
				},function(data){
					if(data=="true"){
						layer.msg('删除成功！');
						window.location.reload();
					}else{
						layer.msg('删除异常！');
					}
				}
			);
	});
	
	
	
}



/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.post(
		"${pageContext.request.contextPath}/jsp/supplier_delete.html",
		{
			"supplierId":id
		},function(data){
			if(data=="true"){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			}
		}
		);
	});
}


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
function userinfo(id){
	 layer.open({
        type: 2,
        title: '供货商信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['450px' , '450px'],
        content:'${pageContext.request.contextPath}/jsp/supplier_show.html?id='+id,
	 })
}
/*用户-编辑*/
function member_edit(id){
	  layer.open({
        type: 2,
        title: '修改供应商信息',
		maxmin: true, 
		shadeClose:true, //点击遮罩关闭层
		scrollbar: true,
        area : ['800px' , '400px'],
        content:"${pageContext.request.contextPath}/jsp/supplier_toupdate.html?id="+id,
        });
}

/********************列表操作js******************/
$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
});
</script>
