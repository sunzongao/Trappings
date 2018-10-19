<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/statics/css/shop.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/statics/css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="${pageContext.request.contextPath}/statics/css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="${pageContext.request.contextPath}/statics/font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/statics/js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/statics/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/shopFrame.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/statics/js/Sellerber.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/statics/js/layer/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/statics/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/statics/js/jquery.dataTables.bootstrap.js"></script>
<title>新增角色</title>
</head>
<body style="overflow: scroll; height: 410px">
<div class="margin Configure_style " id="Competence">
<div class="h_products_list">
<div class=" add_Competence_style l_f width50" id="add_Competence_style" style="width: 100px">
  <div class="title_name">添加角色</div>
   <ul class="add_Authority_style">
    <li class="clearfix"><label class="label_name col-xs-2 col-lg-2">角色名称：</label><span class="col-xs-9"><input name="flag" type="text"  class="col-xs-5"/>(请填写字母)</span></li>
    <li class="clearfix"><label class="col-xs-2 col-lg-2 label_name" for="form-field-1">角色描述：</label>
    <span class="col-xs-9"><input name="rname" type="text"  class="col-xs-5"/></span>
    </li>
   </ul>
</div>
<div class="Competence_list " style="overflow-y:scroll; ">
<div class="title_name">权限分配</div>
  <div class="list_cont clearfix">
  <div class="list_height">
  <c:forEach var="p1" items="${p1list}"> 
	   <div class="clearfix col-lg-6 " style="float: left;">
	    <dl class="Competence_name"> 
	     <dt class="Columns_One">
	     	<c:if test="${p1.grade==1}">
	     		<label class="middle">
		    		 <input class="ace" onclick="pck(this)" type="checkbox" name="role1" id="id-disable-check8" value="${p1.id}" />
		    		 <span class="lbl" >${p1.permission}</span>
	    		 </label>
	     	</c:if>
	     </dt>
	     <dd class="permission_list clearfix">
	    	<c:forEach var="p2" items="${p2list}">
		    	<c:if test="${p2.pid==p1.id }">
		    	    <label class="middle">
		    	 		<input class="ace" onclick="ck(this)" name="role2" type="checkbox" id="id-disable-check11" value="${p2.id}" />
		    	 		<span class="lbl">${p2.permission}</span>
		    	 	</label>
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

</div>
<!--按钮操作-->
<div class="Button_operation btn_width">
    <button class="btn button_btn btn-danger" id="submit" type="button">提交</button>
    <button class="btn button_btn bg-gray" id="close" type="button">取消添加</button>
    <a href="javascript:ovid()" onclick="javascript :history.back(-1);" class="btn btn-info button_btn"><i class="fa fa-reply"></i> 返回上一步</a>
 </div>
</div>
</body>
</html>
<script type="text/javascript">
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
		var bflag=false;//角色flag是否重名
		var brname=false;//角色rname是否重名
		/*关闭页面*/
		$("#close").click(function(){
			//当你在iframe页面关闭自身时					
			var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
			parent.layer.close(index); //再执行关闭
		});
		$("input[name='flag']").blur(function(){
			var flag=$("input[name='flag']").val().trim();
			if(flag==null||flag.length==0){
				layer.msg("角色名不能为空！");
				return;
			}
			$.post(
			"${pageContext.request.contextPath}/jsp/renameflag",
			{
				"flag":flag
			},function(data){
				if(data=="true"){
					bflag=true;
				}else{
					layer.msg("角色名重复！");
					bflag=false;
				}
				if(bflag==true&&brname==true){
					 $("#submit").show();
				}else{
					 $("#submit").hide();
				}
			});
		});
		$("input[name='rname']").blur(function(){
			var rname=$("input[name='rname']").val().trim();
			if(rname==null||rname.length==0){
				layer.msg("角色描述不能为空！");
				return;
			}
			$.post(
					"${pageContext.request.contextPath}/jsp/renamername",
					{
						"rname":rname
					},function(data){
						if(data=="true"){
							brname=true;
						}else{
							layer.msg("角色描述重复！");
							brname=false;
						}
						if(bflag==true&&brname==true){
							 $("#submit").show();
						}else{
							 $("#submit").hide();
						}
					}
				);
		});
		/*添加角色*/
		$("#submit").click(function(){
			//判断角色名是否符合规范
			var flag=$("input[name='flag']").val().trim();
			var reg = /^[a-zA-Z]*$/;
			if(!reg.test(flag)){
				layer.msg("角色名只能为字母！");
				return;
			}
			var pid1=getid1();
			var pid2=getid2();
			id=pid1+pid2;
			//获取角色描述
			var rname=$("input[name='rname']").val().trim();
			//是否进行授权操作
			var power=false;
			if(!isChecked("role1")){//未授权
				layer.confirm('未授权，是否继续？',{icon:0},function(){
					id="";
					$.post(
					"${pageContext.request.contextPath}//jsp/addrole",
					{
						"id":id,
						"flag":flag,
						"rname":rname,
						"power":power
					},function(data){
							if(data=="1"){
								layer.msg("新增数据异常！");
								//刷新当前页面
								window.location.reload();
							}else if(data=="2"){
								layer.msg("授权数据异常！");
								//刷新当前页面
								window.location.reload();
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
					});
				});
			}else{//授权
				power=true;
				$.post(
						"${pageContext.request.contextPath}//jsp/addrole",
						{
							"id":id,
							"flag":flag,
							"rname":rname,
							"power":power
						},function(data){
								if(data=="1"){
									layer.msg("新增数据异常！");
									//刷新当前页面
									window.location.reload();
								}else if(data=="2"){
									layer.msg("授权数据异常！");
									//刷新当前页面
									window.location.reload();
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
						});
			}
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
/*字数限制*/
function checkLength(which) {
	var maxChars = 200; //
	if(which.value.length > maxChars){
	   layer.open({
	   icon:2,
	   title:'提示框',
	   content:'您出入的字数超多限制!',	
    });
		// 超过限制的字数了就将 文本框中的内容按规定的字数 截取
		which.value = which.value.substring(0,maxChars);
		return false;
	}else{
		var curr = maxChars - which.value.length; //200 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
};
/*按钮复选框选择*/
$(function(){
	$(".Competence_name dt input:checkbox").click(function(){
		$(this).closest("dl").find("dd input:checkbox").prop("checked",$(this).prop("checked"));
	});
	$(".permission_list input:checkbox").click(function(){
		var l =$(this).parent().parent().find("input:checked").length;
		if($(this).prop("checked")){
			$(this).closest("dl").find("dt input:checkbox").prop("checked",true);
			$(this).parents(".Competence_name").find("dt").first().find("input:checkbox").prop("checked",true);
		}
		else{
			if(l==0){
				$(this).closest("dl").find("dt input:checkbox").prop("checked",false);
			}			
		}		
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
