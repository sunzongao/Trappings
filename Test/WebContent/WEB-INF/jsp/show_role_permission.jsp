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
		<div class="margin Configure_style " id="Competence">
			<div class="h_products_list">
				<div class="Competence_list ">
					<div class="title_name" style="width: 800px">
						权限分配: <em>${role.rname}</em>
					</div>
					<div class="list_cont clearfix" style="width: 800px">
						<div class="list_height">
							<c:forEach var="p1" items="${p1list}">
							<c:forEach var="per" items="${perlist}">
							<c:if test="${per.id==p1.id}">
								<div class="clearfix col-lg-6 ">
									<dl class="Competence_name">
										<dt class="Columns_One">
										<c:forEach var="per" items="${perlist}">
											<c:if test="${per.id==p1.id}">
												<label class="middle"><span
													class="lbl">${p1.permission}</span></label>
											</c:if>
  										</c:forEach>
										</dt>
										<dd class="permission_list clearfix">
											<c:forEach var="p2" items="${p2list}">
												<c:if test="${p2.pid==p1.id}">
												<c:forEach var="per" items="${perlist}">
												<c:if test="${per.id==p2.id}">
													<label class="middle"> 
  														<span class="lbl" style="width: 100px">${p2.permission}</span></label>
												</c:if>
											</c:forEach>
												</c:if>
											</c:forEach>
										</dd>
									</dl>
								</div>
								</c:if>
								</c:forEach>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!--按钮操作-->
			<div class="Button_operation btn_width" style="padding-left: 100px">
				<button class="btn button_btn bg-gray" id="close" type="button">关闭</button>
			</div>
		</div>
	</form>
</body>
</html>
<script type="text/javascript">
	$(function() {
		/*关闭页面*/
		$("#close").click(function() {
			//当你在iframe页面关闭自身时					
			var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			parent.layer.close(index); //再执行关闭
		});

		$("#Competence").frame({
			color_btn : '.skin_select',
			Sellerber_menu : '.add_Competence_style  ',
			page_content : ' .Competence_list ',//内容
			header : 65,//顶部高度
			menu : 450,//栏宽度
		});
	});
	/*******滚动条*******/
	$(".Competence_list .list_cont ").niceScroll({
		cursorcolor : "#888888",
		cursoropacitymax : 1,
		touchbehavior : true,
		cursorwidth : "5px",
		cursorborder : "0",
		cursorborderradius : "5px"
	});
	$(".list_height").height($(window).height() - 170);
	//当文档窗口发生改变时 触发  
	$(window).resize(function() {
		$(".list_height").height($(window).height() - 170);
	});
</script>
