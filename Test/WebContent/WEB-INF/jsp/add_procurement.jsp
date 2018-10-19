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
<body style="height:560px;width:1500px;overflow: scroll; ">
<form action="${pageContext.request.contextPath}/jsp/add_dosupplier.html"
		method="post">
<div id="add_brand" class="margin">
<div class="h_products_list clearfix mb20" id="Sellerber" style="height: 470px;width: 1290px">
  <div class="Sellerber_left menu" id="menuBar" style="margin-left: 1px;marginpx">
    <div class="menu_style" id="menu_style">
    <div class="list_content">
     <div class="side_list">
      <div class="left_add clearfix" style="width: 450px;  float: left; height: 470px">
       <div class="column_title"  style="margin-top: 2px;margin-left: 5px">生成订单</div>
		<div class="add_menber" id="add_menber_style">
			<ul class=" page-content">
				<li style="margin-top: 20px">
					<label class="label_name" style="margin-left: 12px">采购单编号：</label>
					<span class="add_name">
						<input name="supplierId" id="supplierId" type="text" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li class="clearfix col-xs-4 col-lg-5 col-ms-5 " style="margin-top: 20px">
					<label class="label_name ">开单日期：</label> 
	     			<input class="laydate-icon col-xs-4 col-lg-3" name="sDate"  id="start" style="margin-left: 10px;width:165px;">
				</li>
				
				
				
				<li style="margin-top: 20px">
					<label class="label_name" style="margin-left: 12px">供应商名称：</label>
					<span class="add_name">
						<select name="dept" style="width: 159px">
								<option value="-1" >全部</option>
								<c:forEach var="d" items="${dept}">
									<option value="${d.id}" <c:if test="${param.dept==d.id }">selected="selected"</c:if>>${d.dname}</option>
								</c:forEach>
						</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				
				
				<li style="margin-top: 20px">
					<label class="label_name">收货仓库：</label>
					<span class="add_name">
						<select name="dept" style="width: 165px">
								<option value="-1" >全部</option>
								<c:forEach var="d" items="${dept}">
									<option value="${d.id}" <c:if test="${param.dept==d.id }">selected="selected"</c:if>>${d.dname}</option>
								</c:forEach>
						</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				
				<li style="margin-top: 20px">
					<label class="label_name" style="float:left; padding-right: 14px">经办人：</label>
					<span class="add_name">
						<select name="dept" style="width: 159px">
								<option value="-1" >全部</option>
								<c:forEach var="d" items="${dept}">
									<option value="${d.id}" <c:if test="${param.dept==d.id }">selected="selected"</c:if>>${d.dname}</option>
								</c:forEach>
						</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li style="margin-top: 20px">
					<label class="label_name" style="float:left; padding-right: 14px">经办人：</label>
					<span class="add_name">
						<select name="dept" style="width: 165px">
								<option value="-1" >全部</option>
								<c:forEach var="d" items="${dept}">
									<option value="${d.id}" <c:if test="${param.dept==d.id }">selected="selected"</c:if>>${d.dname}</option>
								</c:forEach>
						</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li class="adderss" style="height: 100px;margin-top: 20px" >
				<label class="label_name">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label>
				<span class="add_name">
					<textarea  rows="2" cols="50" name="comments" style="height: 100px; width: 375px"></textarea>
				</span>
					<div class="prompt r_f"></div>
				</li>
				
				<li>
				</li>
				<li>
				</li>
				
			</ul>
		</div>
</div>
      </div>
    </div>
  </div>
 </div>
 <div class="right_add list_Exhibition list_show" style="width: 1290px;">
  <div class="column_title" style="margin-top: 2px">添加商品</div>
 
    <div class="p_select_list clearfix">
        <div class="left_produt produt_select_style"  style="height: 400px;">
           <div class="title_name" style="width: ">商品列表</div>
           <div id="select_style" class="datatable_height"></div>   
          	
        </div>
        <div  class="Switching_btn" style="margin-top: 100px"> 
        
          <span id="add_all"  class="Switching">
          <input type="button" class="btn button_btn btn-success" value=">>"/>
          </span>
          <span id="add" class="Switching">
          <input type="button" class="btn button_btn bg-deep-blue" value=">"/>
          </span>
          <span id="remove"  class="Switching">
          <input type="button" class="btn button_btn bg-deep-blue" value="<"/>
          </span>
          <span id="remove_all"  class="Switching">
          <input type="button" class="btn button_btn btn-success" value="<<"/>
          </span> 
          </div>
        <div class="right_product produt_select_style " style="height: 400px">
          <div class="title_name">选中产品</div>
          <div class="datatable_height">
          <select multiple="multiple" id="select2" class="select">
          </select>
         </div>
        </div>
      </div>
  </div>
  </div>
   <div class="operation clearfix mb20 same_module align" style="width: 1290px">
   <a class="btn btn-xs btn-info" href="javascript:;" id="submit"  style="font-size: 15px"><em>提交</em></a>&nbsp;&nbsp;&nbsp;
			<a class="btn btn-xs btn-info" href="javascript:;" id="reset" style="font-size: 15px">重置</a>
</div>
</div>
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

function RndNum(){
	var supplierId=$("input[name='supplierId']").val().trim();
    supplierId="CG";
    for(var i=0;i<13;i++){
    	supplierId+=Math.floor(Math.random()*10);
    }
    $("#supplierId").val(supplierId);
}

$(function(){
	
	RndNum();

	
	//供应商编号查重
	var supplierId;
	$("input[name='supplierId']").blur(function(){
		supplierId=$("#supplierId").val().trim();
		if(supplierId==null||supplierId.length==0){
			layer.msg("供应商编号不能为空!");
			return;
		}
		$.post(
			"${pageContext.request.contextPath}/jsp/supplier_checkid.html",
			{
				"supplierId":supplierId
			},function(data){
				if(data=="true"){
					  layer.msg('编号已存在！',{icon:5,time:2000 },  
							  function () {
						  $("#submit").hide();
		                }
					  );
				}else{
					$("#submit").show();
				}
			}
		);
	})
	/*重置*/
	$("#reset").click(function(){
		//重置当前页面
		window.location.reload();
	});
	/*添加*/
	$("#submit").click(function(){
		//获取供应商id
		var supplierId=$("input[name='supplierId']").val().trim();
		//获取供应商名称
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
		if(sDate==null||sDate.length==0){
			layer.msg("请选择合作开始时间！");
			return;
		}
		
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
		//使用ajax新增供应商信息
		$.post(
		"${pageContext.request.contextPath}/jsp/add_dosupplier.html",
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
				layer.alert("新增成功！",{
					icon:1,
					btn:['确定'],
					yes:function(){
						window.location.href="${pageContext.request.contextPath}/jsp/supplier_list.html";
					}
				});
				
			}else{
				layer.msg("新增失败！");
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
</script>
</html>