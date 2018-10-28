<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
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
<title>广告分类</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
	<form id="form1"
		action="${pageContext.request.contextPath}/jsp/commodity_list.html"
		method="get">
		<div class="margin advertising" id="page_style">
			<div class="operation clearfix">
			<shiro:hasPermission name="KCPD">
				<a class="btn button_btn btn-danger" href="javascrpt:void()"
					onclick="deleteItem()"> <i class="fa fa-trash-o"></i>&nbsp;批量删除
				</a> <span class="submenu"><a href="javascript:void(0)" name=""
					onclick="add()" class="btn button_btn bg-deep-blue"
					title="添加库存"><i class="fa  fa-edit"></i>&nbsp;新增商品</a></span>
			</shiro:hasPermission>
					 <label
					class="label_name">商品编号：</label> <input name="commodityId"
					type="text" class="" value="${commodityId }" />
		
				<div class="search  clearfix">

					<select name="genreId" id="genreId" class="form-control col-xs-6"
						style="width: 100px">
						<option value="-1">-类别-</option>
						<c:forEach var="g" items="${genres}">
							<option value="${g.genreId}"
								<c:if test="${g.genreId==genreId}">selected="selected"</c:if>>${g.gName }</option>
						</c:forEach>
					</select> <select name="unitId" id="unitId" class="form-control col-xs-6"
						style="width: 100px">
						<option value="-1">-单位-</option>
						<c:forEach var="u" items="${units}">
							<option value="${u.unitId}"
								<c:if test="${u.unitId==unitId}">selected="selected"</c:if>>${u.uName }</option>
						</c:forEach>
					</select> <select name="brandId" id="brandId" class="form-control col-xs-6"
						style="width: 100px">
						<option value="-1">-品牌-</option>
						<c:forEach var="b" items="${brands}">
							<option value="${b.brandId }"
								<c:if test="${b.brandId==brandId}">selected="selected"</c:if>>${b.bName }</option>
						</c:forEach>
					</select> <select name="supplierId" id="supplierId"
						class="form-control col-xs-6" style="width: 180px">
						<option value="">-供货商-</option>
						<c:forEach var="s" items="${suppliers}">
							<option value="${s.supplierId}"
								<c:if test="${s.supplierId ==supplierId }">selected="selected"</c:if>>${s.sName }</option>
						</c:forEach>
					</select> &nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn button_btn bg-deep-blue " onclick="search()"
						type="button" style="margin-bottom: 2px">
						<i class="fa  fa-search"></i>&nbsp;搜索
					</button>
				</div>
			</div>
			<!--分类管理-->
			<div class="sort_list">
				<table class="table table_list table_striped table-bordered"
					id="sample-table">
					<thead>
						<tr >
							<shiro:hasPermission name="KCPD">
								<th style="background-color: #666;color: white;" width="30"><label><input id="a" type="checkbox"
									class="ace" /><span class="lbl"></span></label></th>
							</shiro:hasPermission>
							
							<th style="background-color: #666;color: white;">商品编号</th>
							<th style="background-color: #666;color: white;">商品名称</th>
							<th style="background-color: #666;color: white;">商品类别</th>
							<th style="background-color: #666;color: white;">单位</th>
							<th style="background-color: #666;color: white;">颜色</th>
							<th style="background-color: #666;color: white;">尺寸</th>
							<th style="background-color: #666;color: white;">品牌</th>
							<th style="background-color: #666;color: white;">供应商</th>
							<shiro:hasPermission name="KCPD">
							<th style="background-color: #666;color: white;">操作</th>
							</shiro:hasPermission>
						</tr>
						<c:forEach var="c" items="${pageUtil.lists }">
							<tr>
							<shiro:hasPermission name="KCPD">
								<th><label><input type="checkbox"
										value="${c.commodityId}" name="ace" class="ace"><span
										class="lbl"></span></label> </label></th>
							</shiro:hasPermission>
								<th><a href="javascript:;${c.commodityId}"
									style="color: blue" onclick="userinfo(this)">${c.commodityId }</a></th>
								<th>${c.cName }</th>
								<th>${c.genre.gName }</th>
								<th>${c.unit.uName }</th>
								<th>${c.pigment.pName}</th>
								<th>${c.dimension.dName }</th>
								<th>${c.brand.bName }</th>
								<th>${c.supplier.sName }</th>
								<shiro:hasPermission name="KCPD">
								<th><a title="编辑" onclick="member_edit('${c.commodityId}')"
									href="javascript:;" class="btn btn-xs btn-info">编辑</a> <a
									title="删除" onclick="member_del(this,'${c.commodityId}')"
									href="javascript:;" class="btn btn-xs btn-delete">删除</a></th>
								</shiro:hasPermission>
						</c:forEach>
					</thead>
					<tbody>
						<tr>
						</tr>
					</tbody>
				</table>
				<p style="margin-top: 5px; text-align: center;">
					<a
						href="${pageContext.request.contextPath}/jsp/commodity_list.html?pageindex=1&commodityId=${commodityId}&genreId=${genreId}&unitId=${unitId}&brandId=${brandId }&supplierId=${supplierId}"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>首页</a>&nbsp;&nbsp;
					<a
						href="${pageContext.request.contextPath}/jsp/commodity_list.html?pageindex=${pageUtil.currentPage-1}&commodityId=${commodityId}&genreId=${genreId}&unitId=${unitId}&brandId=${brandId }&supplierId=${supplierId}"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>上一页</a>&nbsp;&nbsp;
					<a
						href="${pageContext.request.contextPath}/jsp/commodity_list.html?pageindex=${pageUtil.currentPage+1}&commodityId=${commodityId}&genreId=${genreId}&unitId=${unitId}&brandId=${brandId }&supplierId=${supplierId}"
						class="btn btn-xs btn-info"
						<c:if test="${pageUtil.currentPage==pageUtil.totalPage}">style="display: none;"</c:if>>下一页</a>&nbsp;&nbsp;
					<a
						href="${pageContext.request.contextPath}/jsp/commodity_list.html?pageindex=${pageUtil.totalPage}&commodityId=${commodityId}&genreId=${genreId}&unitId=${unitId}&brandId=${brandId }&supplierId=${supplierId}"
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
		layer.msg("请选中要删除的商品！");
		return;
	}
	var a=getid();
	layer.confirm('确认要删除多条记录吗？',function(index){
		$.post(
				"${pageContext.request.contextPath}/jsp/commodity_todelete.html",
				{
					"id":a
				},function(data){
					layer.alert("删除成功！",{
						icon:1,
						btn:['确定'],
						yes:function(){
							location.reload();
						}
					});
				}
			);
	});
}


/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.post(
		"${pageContext.request.contextPath}/jsp/commodity_delete.html",
		{
			"commodityId":id
		},function(data){
			layer.alert("删除成功！",{
				icon:1,
				btn:['确定'],
				yes:function(){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
					location.reload();
				}
			});
		}
		);
	});
}

/*添加-商品*/
function add(){
	 layer.open({
       type: 2,
       title: '新增商品',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
		 area : ['600px' , '420px'],
       content:'${pageContext.request.contextPath}/jsp/commodity_toadd.html',
	 })
}

/*商品-详细*/
function userinfo(id){
	 layer.open({
       type: 2,
       title: '商品详细',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
       area : ['300px' , '400px'],
       content:'${pageContext.request.contextPath}/jsp/commodity_show.html?id='+id,
	 })
}	
	
/*商品-编辑*/
function member_edit(id){
	  layer.open({
        type: 2,
        title: '编辑商品信息',
		maxmin: true, 
		shadeClose:true, //点击遮罩关闭层
		scrollbar: true,
        area : ['600px' , '420px'],
        content:"${pageContext.request.contextPath}/jsp/commodity_toupdate.html?id="+id,
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
