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
		<div class="add_menber" id="add_menber_style">
			<ul class=" page-content">
				<li><label class="label_name">员工姓名：</label><span
					class="add_name"><input name="eName"
						value="${employee.eName}" type="text" class="text_add" /></span>
					<div class="prompt r_f"></div></li>
					 <li class="clearfix col-xs-4 col-lg-5 col-ms-5 "><label class="label_name ">生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日：</label> 
	     			<input class="laydate-icon col-xs-4 col-lg-3" name="birthDate" value="${employee.birthDate}" id="start" style="margin-left: 10px;width:176px;">
				   <li class="clearfix col-xs-4 col-lg-5 col-ms-5 "><label class="label_name ">入职时间：</label> 
	     			<input class="laydate-icon col-xs-4 col-lg-3" name="entryDate" value="${employee.entryDate}" id="end" style="margin-left: 10px;width:176px;">
				<li><label class="label_name">联系电话：</label><span
					class="add_name"><input name="ePhone" type="text"
						value="${employee.ePhone}" class="text_add" /></span>
					<div class="prompt r_f"></div></li>
				<li><label class="label_name">家庭住址：</label><span
					class="add_name"><input name="eAddress"
						value="${employee.eAddress}" type="text" class="text_add" /></span>
					<div class="prompt r_f"></div></li>
				<li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span
					class="add_name"> <label><input
							name="form-field-radio" name="eSex" type="radio" class="ace"
							<c:if test="${employee.eSex=='男'}">checked="checked"</c:if>><span
							class="lbl">男</span></label>&nbsp;&nbsp;&nbsp; <label><input
							name="form-field-radio" name="eSex" type="radio" class="ace"
							<c:if test="${employee.eSex=='女'}">checked="checked"</c:if>><span
							class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;
				</span></li>
				<li class="adderss"><label class="label_name">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</label><span
					class="add_name">
					<textarea  rows="1" cols="70" name="comments">${employee.comments}</textarea>
						</span>
					<div class="prompt r_f"></div></li>
				<li class="adderss"><label class="label_name">所属部门：</label> <span
					class="add_name"> <c:forEach var="dept" items="${deptlist}">
							<label><input type="radio" name="departmentId" value="${dept.departmentId}"
								class="ace"
								<c:if test="${dept.departmentId==employee.departmentId}">checked="checked"</c:if>><span
								class="lbl">${dept.dName}</span></label>&nbsp;&nbsp;		
     	</c:forEach>
				</span></li>
				<li class="adderss"><label class="label_name">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：</label>
					<span class="add_name"> <c:forEach var="job"
							items="${joblist}">
							<label><input type="radio" name="jobId" class="ace" value="${job.jobId}"
								<c:if test="${job.jobId==employee.jobId}">checked="checked"</c:if>><span
								class="lbl">${job.jName}</span></label>&nbsp;&nbsp;		
     	</c:forEach>
				</span></li>
			</ul>
		</div>
		<p style="text-align: center;">
			<a class="btn btn-xs btn-info" href="javascript:;" id="submit">修改</a>&nbsp;&nbsp;&nbsp; 
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
$(function(){
	/*关闭*/
	$("#close").click(function(){
		//当你在iframe页面关闭自身时					
		var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
		parent.layer.close(index); //再执行关闭
	});
	/*提交修改*/
	$("#submit").click(function(){
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
		var departmentId=$("input[name='departmentId']:checked ").val().trim();
		if(departmentId==null||departmentId.length==0){
			layer.msg("请选择部门！");
			return;
		}
		//获取职务id
		var jobId=$("input[name='jobId']:checked ").val().trim();
		if(jobId==null||jobId.length==0){
			layer.msg("请选择职位！");
			return;
		}
		//获取备注
		var comments=$("input[name='comments']").val().trim();
		//使用ajax修改员工信息
		$.post(
		"${pageContext.request.contextPath}/jsp/doEmployeeUpdate",
		{
			"eName":eName,
			"birthDate":birthDate,
			"entryDate":entryDate,
			"ePhone":ePhone,
			"eAddress":eAddress,
			"departmentId":departmentId,
			"jobId":jobId,
			"comments":comments
		},function(data){
			alert(data);
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