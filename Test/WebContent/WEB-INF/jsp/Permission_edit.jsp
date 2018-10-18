<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, role-scalable=no" />
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
<title>员工管理</title>
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
				action="${pageContext.request.contextPath}/jsp/roleList.html"
				method="post">
				<ul class="choice_search">
					<li class="clearfix col-xs-2 col-lg-2 col-ms-3 "><label
						class="label_name ">角色名称：</label><input name="rname"
						value="${rname}" type="text"
						class="form-control col-xs-6 col-lg-5" /></li>
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
		<div class="bkg_List_style list_Exhibition list_show padding15">
			<div class="datalist_show">
				<div class="bkg_List clearfix datatable_height confirm">
					<table class="table  table_list table_striped table-bordered">
						<thead>
							<tr>
								<th>角色编号</th>
								<th>名称</th>
								<th>编辑</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${util.lists}" var="role">
								<tr>
									<td>${role.id}</td>
									<td class="td-status">${role.rname}</td>
									<td class="td-manage"><a title="授权"
										onclick="member_edit(this,${role.id})" href="javascript:;"
										class="btn button_btn bg-deep-blue">授权</a> <a title="查看"
										href="javascript:;" onclick="show_permission(this,${role.id})"
										class="btn button_btn btn-green">查看</a> <a title="查看"
										href="javascript:;" onclick="add_Role()"
										class="btn button_btn btn-green">新增角色</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<p style="margin-top: 5px; text-align: center;">
						<a
							href="${pageContext.request.contextPath}/jsp/roleList.html?pageindex=1&rname=${rname}"
							class="btn btn-xs btn-info"
							<c:if test="${util.currentPage==1}">style="display: none;"</c:if>>首页</a>&nbsp;&nbsp;
						<a
							href="${pageContext.request.contextPath}/jsp/roleList.html?pageindex=${util.currentPage-1}&rname=${rname}"
							class="btn btn-xs btn-info"
							<c:if test="${util.currentPage==1}">style="display: none;"</c:if>>上一页</a>&nbsp;&nbsp;
						<a
							href="${pageContext.request.contextPath}/jsp/roleList.html?pageindex=${util.currentPage+1}&rname=${rname}"
							class="btn btn-xs btn-info"
							<c:if test="${util.currentPage==util.totalPage}">style="display: none;"</c:if>>下一页</a>&nbsp;&nbsp;
						<a
							href="${pageContext.request.contextPath}/jsp/roleList.html?pageindex=${util.totalPage}&rname=${rname}"
							class="btn btn-xs btn-info"
							<c:if test="${util.currentPage==util.totalPage}">style="display: none;"</c:if>>尾页</a>
						<span style="font-size: 16px;">第${util.currentPage}页/共${util.totalPage}页</span>
					</p>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>
<script>
/*新增权限*/
 function add_Role(){
	 layer.open({
	        type: 2,
	        title: '新增权限',
			maxmin: true, 
			shadeClose:true, //点击遮罩关闭层
			scrollbar: true,
	        area : ['1100px' , '450px'],
	        content:"${pageContext.request.contextPath}/jsp/add_Role"
	        });
}
/*查看*/
function show_permission(obj,id){
	layer.open({
        type: 2,
        title: '查看',
		maxmin: true, 
		shadeClose:true, //点击遮罩关闭层
		scrollbar: true,
        area : ['800px' , '450px'],
        content:"${pageContext.request.contextPath}/jsp/show_permission?rid="+id
        });
} 
/*管理员-停用*/
function Competence_close(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$.post(
		"${pageContext.request.contextPath}/jsp/updateroleState",
		{
			"id":id,
			"state":0
		},function(data){
			if(data=="true"){
				$(obj).parents("tr").find(".td-manage").prepend("<a style='text-decoration:none' class='btn button_btn btn-Dark-success' onClick='Competence_start(this,"+id+")' href='javascript:;' title='启用'>启用</a>");
				$(obj).parents("tr").find(".td-status").html('<span class="label label-danger label-sm">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			}
		});
	});
}
/*管理员-启用*/
function Competence_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.post(
				"${pageContext.request.contextPath}/jsp/updateroleState",
				{
					"id":id,
					"state":1
				},function(data){
					if(data=="true"){
						$(obj).parents("tr").find(".td-manage").prepend("<a style='text-decoration:none' class='btn button_btn btn-gray' onClick='Competence_close(this,"+id+")' href='javascript:;' title='停用'>停用</a>");
						$(obj).parents("tr").find(".td-status").html('<span class="label label-success label-sm">已启用</span>');
						$(obj).remove();
						layer.msg('已启用!',{icon: 6,time:1000});
					}
				});
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
});
/*用户-授权*/
function member_edit(obj,id){
	  layer.open({
        type: 2,
        title: '授权',
		maxmin: true, 
		shadeClose:true, //点击遮罩关闭层
		scrollbar: true,
        area : ['800px' , '450px'],
        content:"${pageContext.request.contextPath}/jsp/permision_edit?rid="+id
        });
}
	/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.post(
		"${pageContext.request.contextPath}/jsp/employeeDelete",
		{
			"employeeId":id
		},function(data){
			if(data=="true"){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			}
		}
		);
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
</script>
