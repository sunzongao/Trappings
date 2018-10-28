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
		<div id="ad_sort">
			<div class="add_style">
				<ul>
					<li class="clearfix"><label class="label_name col-xs-2">最低库存：&nbsp;&nbsp;</label><span
						class="cont_style col-xs-9"> <input name="minimumStock" type="text"
							id="minimumStock" class="col-xs-10 col-sm-5" style="width: 350px"></span>
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
			var minimumStock = $("#minimumStock").val();
			if(minimumStock==""){
				layer.msg("最低库存不能为空！");
				return;
			}
			//使用ajax修改最低库存信息
			$.post(
			"${pageContext.request.contextPath}/jsp/updateRepertoryAllMinimumStock",
			{	
				"minimumStock":minimumStock,
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