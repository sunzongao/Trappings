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
		<input name="supplierId" value="${supplier.supplierId}" type="hidden"> 
		<div class="add_menber" id="add_menber_style">
			<ul class=" page-content">
				<li>
					<label class="label_name">供应商名称：</label>
					<span class="add_name">
						<input name="sName" value="${supplier.sName}" type="text" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li class="clearfix col-xs-4 col-lg-5 col-ms-5 ">
					<label class="label_name ">合作时间：</label> 
	     			<input class="laydate-icon col-xs-4 col-lg-3" name="sDate" value="${supplier.sDate}" id="start" style="margin-left: 10px;width:166px;">
	     		</li>
	     			
	     			
	     		<li>
					<label class="label_name">联系人：</label>
					<span class="add_name">
						<input name="sContacts" type="text" value="${supplier.sContacts}" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>	
				
				<li>
					<label class="label_name">Email：</label>
					<span class="add_name">
						<input name="sEmail" type="text" value="${supplier.sEmail}" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li>
					<label class="label_name">联系电话：</label>
					<span class="add_name">
						<input name="sPhone" type="text" value="${supplier.sPhone}" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li>
					<label class="label_name">家庭住址：</label>
					<span class="add_name">
						<input name="sAddress" value="${supplier.sAddress}" type="text" class="text_add" style="width: 250px"/>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li>
					<label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label>
					<span class="add_name"> 
						<label>
							<input value="1" name="sStatus" type="radio" class="ace" <c:if test="${supplier.sStatus==1}">checked="checked"</c:if>>
							<span class="lbl">启用</span>
						</label>&nbsp;&nbsp;&nbsp; 
						<label>
						<input name="sStatus" type="radio" class="ace" value="2" <c:if test="${supplier.sStatus==2}">checked="checked"</c:if>>
							<span class="lbl">禁用</span>
						</label>&nbsp;&nbsp;&nbsp;
					</span>
				</li>
				
				<li>
					<label class="label_name"></label>
					<span class="add_name">
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li class="adderss">
					<label class="label_name">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
					<span class="add_name">
						<textarea  rows="2" cols="80" name="comments" style="height: 50px;">${supplier.comments}</textarea>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
			</ul>
		</div>
		<p style="text-align: center; padding-top: 20px">
			<a class="btn btn-xs btn-info0" href="javascript:;" id="submit">修改</a>&nbsp;&nbsp;&nbsp; 
			<a class="btn btn-xs btn-info" href="javascript:;" id="close">关闭</a>
		</p>
	</form>
</body>
<script type="text/javascript">
/******时间设置*******/
var start = {
  elem: '#start',
  format: 'YYYY-MM-DD',
 // min: laydate.now(), //设定最小日期为当前日期
  max: getNowFormatDate(), //最大日期
  istime: true,
  istoday: false,
  choose: function(datas){
       end.min = datas; //开始日选好后，重置结束日的最小日期
       end.start = datas //将结束日的初始值设定为开始日
  }
};
laydate(start);


$(function(){
	/*关闭*/
	$("#close").click(function(){
		//当你在iframe页面关闭自身时					
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	});
	/*提交修改*/
	$("#submit").click(function(){
		//获取供应商id
		var supplierId=$("input[type='hidden']").val().trim();
		//获取修改后的供应商名称
		var sName=$("input[name='sName']").val().trim();
		if(sName==null||sName.length==0){
			layer.msg("供应商名称不能为空！");
			return;
		}
		//获取联系人
		var sContacts=$("input[name='sContacts']").val().trim();
		if(sContacts==null||sContacts.length==0){
			layer.msg("联系人不能为空！");
			return;
		}
		//获取合作时间
		var sDate=$("input[name='sDate']").val().trim();
		//获取联系电话
		var sPhone=$("input[name='sPhone']").val().trim();
		if(sPhone==null||sPhone.length==0){
			layer.msg("联系电话不能为空！");
			return;
		}else if(!(/^1[3|4|5|8][0-9]\d{8}$/.test(sPhone))){
			layer.msg("请输入正确的手机号！");
			return;
		}
		//获取Email
		var sEmail=$("input[name='sEmail']").val().trim();
		if(sEmail==null||sEmail.length==0){
			layer.msg("邮箱不能为空！");
			return;
		}else if(!(/^[A-Za-z\d]+([-_.][A-Za-z\d]+)*@([A-Za-z\d]+[-.])+[A-Za-z\d]{2,4}$/.test(sEmail))){
			layer.msg("邮箱格式不正确！");
			return;
		}
		//获取住址
		var sAddress=$("input[name='sAddress']").val().trim();
		if(sAddress==null||sAddress.length==0){
			layer.msg("请填联系住址！");
			return;
		}
		//获取状态
		var sStatus=$("input[name='sStatus']:checked ").val().trim();
		if(sStatus==null||sStatus.length==0){
			layer.msg("请选择状态！");
			return;
		}
		//获取备注
		var comments=$("textarea[name='comments']").val().trim();
		//使用ajax修改员工信息
		
		$.post(
			"${pageContext.request.contextPath}/jsp/supplier_doupdate.html",
		{	
			"supplierId":supplierId,
			"sName":sName,
			"sContacts":sContacts,
			"sPhone":sPhone,
			"sEmail":sEmail,
			"sAddress":sAddress,
			"sDate":sDate,
			"sStatus":sStatus,
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