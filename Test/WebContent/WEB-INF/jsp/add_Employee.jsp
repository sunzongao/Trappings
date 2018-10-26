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
	<form action="${pageContext.request.contextPath}/jsp/doEmployeeUpdate"
		method="post">
		<input name="employeeId" value="${employee.employeeId}" type="hidden"> 
		<div class="add_menber" id="add_menber_style">
			<ul class=" page-content">
				<li><label class="label_name">工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label><span
					class="add_name"><input name="employeeId" id="employeeId" readonly="readonly"
						 type="text" class="text_add" /></span>
					<div class="prompt r_f"></div></li>
				<li><label class="label_name">员工姓名：</label><span
					class="add_name"><input name="eName"
						type="text" class="text_add" /></span>
					<div class="prompt r_f"></div></li>
					 <li class="clearfix col-xs-4 col-lg-5 col-ms-5 "><label class="label_name ">生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日：</label> 
	     			<input class="laydate-icon col-xs-4 col-lg-3" name="birthDate" value="${employee.birthDate}" id="start" style="margin-left: 10px;width:165px;">
				   <li class="clearfix col-xs-4 col-lg-5 col-ms-5 "><label class="label_name ">入职时间：</label> 
	     			<input class="laydate-icon col-xs-4 col-lg-3" name="entryDate" value="${employee.entryDate}" id="end" style="margin-left: 10px;width:165px;">
				<li><label class="label_name">联系电话：</label><span
					class="add_name"><input name="ePhone" type="text"
						 class="text_add" /></span>
					<div class="prompt r_f"></div></li>
				<li><label class="label_name">家庭住址：</label><span
					class="add_name"><input name="eAddress"
						 type="text" class="text_add" /></span>
					<div class="prompt r_f"></div></li>
				<li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span
					class="add_name"> <label><input value="男"
							 name="eSex" type="radio" checked="checked" class="ace"
							><span
							class="lbl">男</span></label>&nbsp;&nbsp;&nbsp; <label><input
							 name="eSex" type="radio" class="ace" value="女"
							><span
							class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;
				</span></li>
				<li><label class="label_name"></label><span
					class="add_name"></span>
					<div class="prompt r_f"></div></li>
				<li class="adderss"><label class="label_name">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label><span
					class="add_name">
					<textarea  rows="1" cols="70" name="comments"></textarea>
						</span>
					<div class="prompt r_f"></div></li>
				<li class="adderss"><label class="label_name">所属部门：</label> <span
					class="add_name"> 
					<c:forEach var="dept" items="${deptlist}">
							<label><input type="radio" name="departmentId" value="${dept.departmentId}"
								class="ace"
								><span
								class="lbl">${dept.dName}</span></label>&nbsp;&nbsp;
     				</c:forEach>
     				</span></li>
				<li class="adderss"><label class="label_name">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</label>
					<span class="add_name" id="job"> 
			<c:forEach var="job"
							items="${joblist}">
							<label><input type="radio" name="jobId" class="ace" value="${job.jobId}"
								><span
								class="lbl">${job.jName}</span></label>&nbsp;&nbsp;		
     		</c:forEach>
				</span></li>
			</ul>
		</div>
		<p style="text-align: center;">
			<a class="btn btn-xs btn-info" href="javascript:;" id="submit"  style="font-size: 15px"><em>提交</em></a>&nbsp;&nbsp;&nbsp;
			<a class="btn btn-xs btn-info" href="javascript:;" id="reset" style="font-size: 15px">重置</a>
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
var end = {
  elem: '#end',
  format: 'YYYY-MM-DD',
  //min: laydate.now(),
  max: getNowFormatDate(),
  istime: true,
  istoday: false,
  choose: function(datas){
      start.max = datas; //结束日选好后，重置开始日的最大日期
  }
};
laydate(start);
laydate(end);

function RndNum(){
	var employeeId=$("input[name='employeeId']").val().trim();
	employeeId="YG";
    for(var i=0;i<6;i++){
    	employeeId+=Math.floor(Math.random()*10);
    }
    $("#employeeId").val(employeeId);
}

$(function(){
	
	RndNum();
	
	
	
	//进行工号的查重
	var employeeId;
	$("input[name='employeeId']").blur(function(){
		 employeeId=$("#employeeId").val().trim();
		if(employeeId==null||employeeId.length==0){
			layer.msg("工号不能为空！");
			return;
		}
		$.post(
			"${pageContext.request.contextPath}/jsp/checkid",
			{
				"employeeId":employeeId
			},function(data){
				if(data=="true"){
					  layer.msg('工号重复',{icon:5,time:2000 },  
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
	/*部门改变后更改对应职位显示*/
	$("input[name='departmentId']").change(function(){
		//获取改变后的部门id
		var departmentId=$("input[name='departmentId']:checked").val().trim();
		$.post(
		"${pageContext.request.contextPath}/jsp/updateJob",
		{
			"departmentId":departmentId
		},function(d){
			$("#job").html("");
			var data=JSON.parse(d);
			for(var i=0;i<data.length;i++){
				$("#job").append("<label><input type='radio' name='jobId' class='ace' value='"+data[i].jobId+"'><span class='lbl'>"+data[i].jName+"</span></label>&nbsp;&nbsp;");
			}
		});
	});
	/*关闭*/
	$("#reset").click(function(){
		//关闭当前页面
		window.location.reload();
	});
	/*提交修改*/
	$("#submit").click(function(){
		//获取员工id
		var employeeId=$("input[type='hidden']").val().trim();
		//获取修改后的姓名
		var eName=$("input[name='eName']").val().trim();
		if(eName==null||eName.length==0){
			layer.msg("员工姓名不能为空！");
			return;
		}
		//获取员工生日
		var birthDate=$("input[name='birthDate']").val().trim();
		//获取入职时间
		var entryDate=$("input[name='entryDate']").val().trim();
		//获取员工联系电话
		var ePhone=$("input[name='ePhone']").val().trim();
		if(ePhone==null||ePhone.length==0){
			layer.msg("联系电话不能为空！");
			return;
		}else if(!(/^1[3|4|5|8][0-9]\d{4,8}$/.test(ePhone))){
			layer.msg("请输入正确的手机号！");
			return;
		}
		//获取住址
		var eAddress=$("input[name='eAddress']").val().trim();
		if(eAddress==null||eAddress.length==0){
			layer.msg("请填写家庭住址！");
			return;
		}
		//获取部门id
		var departmentId;
		if(isChecked("departmentId")){
			departmentId=$("input[name='departmentId']:checked ").val().trim();
		}else{
			departmentId="";		
		}
		if(departmentId==null||departmentId.length==0){
			layer.msg("请选择部门！");
			return;
		}
		//获取员工性别
		var eSex=$("input[name='eSex']:checked").val().trim();
		//获取职务id
		var jobId;
		if(isChecked("jobId")){
			jobId=$("input[name='jobId']:checked ").val().trim();
		}else{
			jobId="";		
		}
		if(jobId==null||jobId.length==0){
			layer.msg("请选择职位！");
			return;
		}
		//获取备注
		var comments=$("textarea[name='comments']").val().trim();
		//使用ajax修改员工信息
		$.post(
		"${pageContext.request.contextPath}/jsp/addemployee",
		{	
			"employeeId":employeeId,
			"eName":eName,
			"birthDate":birthDate,
			"entryDate":entryDate,
			"eSex":eSex,
			"ePhone":ePhone,
			"eAddress":eAddress,
			"departmentId":departmentId,
			"jobId":jobId,
			"comments":comments
		},function(data){
			if(data=="true"){
				layer.alert("新增成功！",{
					icon:1,
					btn:['确定'],
					yes:function(){
						window.location.href="${pageContext.request.contextPath}/jsp/tomember_list.html";
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