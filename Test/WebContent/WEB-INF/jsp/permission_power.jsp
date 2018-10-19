<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/statics/css/shop.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/statics/css/Sellerber.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/statics/css/bkg_ui.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/statics/font/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/statics/js/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/js/jquery.cookie.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/shopFrame.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/statics/js/Sellerber.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/layer/layer.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/jquery.dataTables.bootstrap.js"></script>
<title>权限设置</title>
</head>
<body style="overflow: scroll; height: 410px">
	<form action="#" method="post">
		<input type="hidden" id="rid" value="${role.id}" />
		<div class="margin Configure_style " id="Competence">
			<div class="h_products_list">
				<div class="Competence_list ">
					<div class="title_name" style="width: 800px">
						权限分配: <em>${role.rname}</em>
					</div>
					<div class="list_cont clearfix" style="width: 800px">
						<div class="list_height">
							<c:forEach var="p1" items="${p1list}">
								<div class="clearfix col-lg-6 ">
									<dl class="Competence_name">
										<dt class="Columns_One">
											<label class="middle"><input class="ace"
												name="role1" type="checkbox" value="${p1.id}"
												id="" onclick = "pck(this)"
												<c:forEach var="per" items="${perlist}">
  			<c:if test="${per.id==p1.id}">checked="checked"</c:if>  
  		</c:forEach> /><span
												class="lbl">${p1.permission}</span></label>
										</dt>
										<dd class="permission_list clearfix">
											<c:forEach var="p2" items="${p2list}">
												<c:if test="${p2.pid==p1.id}">
													<label class="middle"> <input class="ace"
														name="role2" type="checkbox" onclick="ck(this)"
														value="${p2.id}" id=""
														<c:forEach var="per" items="${perlist}">
  			<c:if test="${per.id==p2.id}">checked="checked"</c:if>  
  			</c:forEach> /><span
														class="lbl" style="width: 100px">${p2.permission}</span></label>
												</c:if>
											</c:forEach>
										</dd>
									</dl>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!--按钮操作-->
			<div class="Button_operation btn_width" style="padding-left: 100px">
				<button class="btn button_btn btn-danger" id="submit" type="button">修改</button>
				<button class="btn button_btn bg-gray" id="close" type="button">取消修改</button>
			</div>
		</div>
	</form>
</body>
</html>
<script type="text/javascript" >
/*1级权限选中*/
function pck(dt){
	var dd = $(dt).parents("dt").next();
	if(!$(dt).is(':checked')){
		$(dd).find("input").attr("checked", false);
	}
}
/*2级权限选中*/
function ck(dd){
	var dt = $(dd).parents("dd").prev();
	if(!$(dt).find("input").is(':checked')){
		$(dt).find("input").prop("checked",true);
	}
}
	$(function() { 
		/*关闭页面*/
	$("#close").click(function(){
		//当你在iframe页面关闭自身时					
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	});
		
	/*提交修改*/
	$("#submit").click(function(){
		var id1=getid1();
		var id2=getid2();
		var pid=id1+id2;
		var rid=$("#rid").val();
		var b=isChecked("role1");
		$.post(
			"${pageContext.request.contextPath}/jsp/updatePerByRid",
			{
				"pid":pid,
				"rid":rid,
				"b":b
			},function(data){
				if(data=="1"){
					layer.msg("清空数据异常！");
					//刷新当前页面
					window.location.reload();
				}else if(data=="2"){
					layer.msg("授权异常！");
					window.location.reload();
					//刷新当前页面
				}else{
					layer.alert("授权成功！",{
						icon:1,
						btn:['确定'],
						yes:function(){
							//当你在iframe页面关闭自身时					
							var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
							parent.location.reload();//刷新父级页面
							parent.layer.close(index); //再执行关闭
						}
					});		
				}
			}			
		);
	});
	
	$("#Competence").frame({
		color_btn:'.skin_select',
		Sellerber_menu:'.add_Competence_style  ',
		page_content:' .Competence_list ',//内容
		header:65,//顶部高度
		menu:450,//栏宽度
	});
});
/*******滚动条*******/
$(".Competence_list .list_cont ").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:true,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
 $(".list_height").height($(window).height()-170);  
 //当文档窗口发生改变时 触发  
    $(window).resize(function(){ 
	 $(".list_height").height($(window).height()-170);
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
//获取选中1级权限id
function getid1(){
	 obj = document.getElementsByName("role1");
	    check_val = "";
	    for(k in obj){
	        if(obj[k].checked)
	        	check_val+=obj[k].value+",";
	    }
	    return check_val;
}
//获取选中2级权限id
function getid2(){
	 obj = document.getElementsByName("role2");
	    check_val = "";
	    for(k in obj){
	        if(obj[k].checked)
	        	check_val+=obj[k].value+",";
	    }
	    return check_val;
}
</script>
