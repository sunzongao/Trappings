<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<title>Insert title here</title>
<style type="text/css">
		  textarea{
		  height:40px;
	  	resize:none ;
	  }
</style>
</head>
<body>
	<!--修改员工信息-->
	<form action=""
		method="post">
		<div class="add_menber" id="add_menber_style">
			<ul class=" page-content">
				<li>
					<label class="label_name">商品编号：</label>
					<span class="add_name">
						<input readonly="readonly"   style="color: red"  name="commodityId" id="commodityId" value="${commodity.commodityId}" type="text" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li>
					<label class="label_name">商品名称：</label>
					<span class="add_name">
						<input name="cName" id="cName" value="${commodity.cName}" type="text" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>
				
	     		<li>
					<label class="label_name">商品类别：</label>
					<span class="add_name">
					<select name="genreId" id="genreId" class="form-control col-xs-6"
						style="width: 150px">
								<c:forEach var="g" items="${genres}">
									<option value="${g.genreId}" <c:if test="${g.genreId eq commodity.genreId}">selected="selected"</c:if>>${g.gName }</option>
								</c:forEach>
					</select>
					</span>
					<div class="prompt r_f"></div>
				</li>	
				
				<li>
					<label class="label_name">商品单位：</label>
					<span class="add_name">
					<select name="unitId" id="unitId" class="form-control col-xs-6"
						style="width: 150px">
								<c:forEach var="u" items="${units}">
									<option value="${u.unitId}" <c:if test="${u.unitId eq commodity.unitId}">selected="selected"</c:if>>${u.uName }</option>
								</c:forEach>
					</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li>
					<label class="label_name">商品品牌：</label>
					<span class="add_name">
					<select name="brandId" id="brandId" class="form-control col-xs-6"
						style="width: 150px">
								<c:forEach var="b" items="${brands}">
									<option value="${b.brandId }" <c:if test="${b.brandId eq commodity.brandId}">selected="selected"</c:if>>${b.bName }</option>
								</c:forEach>
					</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li>
					<label class="label_name">商品颜色：</label>
					<span class="add_name">
					<select name="pigmentId" id="pigmentId" class="form-control col-xs-6"
						style="width: 150px">
								<c:forEach var="p" items="${pigments}">
									<option value="${p.pigmentId }" <c:if test="${p.pigmentId eq commodity.pigmentId}">selected="selected"</c:if>>${p.pName }</option>
								</c:forEach>
					</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li>
					<label class="label_name">商品尺寸：</label>
					<span class="add_name">
					<select name="dimensionId" id="dimensionId" class="form-control col-xs-6"
						style="width: 150px">
								<c:forEach var="d" items="${dimensions}">
									<option value="${d.dimensionId }" <c:if test="${d.dimensionId eq commodity.dimensionId}">selected="selected"</c:if>>${d.dName }</option>
								</c:forEach>
					</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li>
					<label class="label_name">供货商：</label>
					<span class="add_name">
					<select name="supplierId" id="supplierId" class="form-control col-xs-6"
						style="width: 150px">
								<c:forEach var="s" items="${suppliers}">
									<option value="${s.supplierId}" <c:if test="${s.supplierId  eq commodity.supplierId }">selected="selected"</c:if>>${s.sName }</option>
								</c:forEach>
					</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				
				
				<li class="adderss">
					<label class="label_name">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
					<span class="add_name">
						<textarea  rows="3" cols="60" name="comments" style="height: 50px;">${commodity.comments}</textarea>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
			</ul>
		</div>
		<div style="text-align: center;  margin-top: 20px">
			<a class="btn btn-xs btn-info" href="javascript:;" id="submit">修改</a>&nbsp;&nbsp;&nbsp; 
			<a class="btn btn-xs btn-info" href="javascript:;" id="close">关闭</a>
		</div>
	</form>
</body>
<script type="text/javascript">


$(function(){
	/*关闭*/
	$("#close").click(function(){
		//当你在iframe页面关闭自身时					
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	});
	/*提交修改*/
	$("#submit").click(function(){
		//获取商品编号
		var commodityId=$("#commodityId").val();
		//获取商品名称
		var cName=$("#cName").val();
		if(cName==null||cName.length==0){
			layer.msg("商品名称不能为空！");
			return;
		}
		//获取类别
		var genreId=$("#genreId").val();
	
		//获取单位
		var unitId=$("#unitId").val();
		//获取颜色
		var pigmentId=$("#pigmentId").val();
		//获取尺寸
		var dimensionId=$("#dimensionId").val();
		//获取供货商
		var supplierId=$("#supplierId").val();
		
		//获取品牌
		var brandId=$("#brandId").val();
		
		
		//获取备注
		var comments=$("textarea[name='comments']").val().trim();
		//使用ajax修改员工信息
		
		$.post(
			"${pageContext.request.contextPath}/jsp/commodity_doupdate.html",
		{	
			"commodityId":commodityId,
			"cName":cName,
			"genreId":parseInt(genreId),
			"unitId":parseInt(unitId),
			"pigmentId":parseInt(pigmentId),
			"dimensionId":parseInt(dimensionId),
			"supplierId":supplierId,
			"brandId":parseInt(brandId),
			"comments":comments
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
//获取当前时间，格式YYYY-MM-DD
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}
</script>
</html>