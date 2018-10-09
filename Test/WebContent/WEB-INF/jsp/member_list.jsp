<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath }/statics/css/shop.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/shopFrame.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/Sellerber.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/layer/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/laydate/laydate.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/proTree.js" ></script>
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
   <form id="form1" action="${pageContext.request.contextPath}/jsp/tomember_list.html" method="post">
   	 <ul class="choice_search">
	     <li class="clearfix col-xs-2 col-lg-2 col-ms-3 "><label class="label_name ">员工名称：</label><input name="eName" value="${eName}" type="text"  class="form-control col-xs-6 col-lg-5"/></li>
	      <li class="clearfix col-xs-4 col-lg-5 col-ms-5 "><label class="label_name ">入职时间：</label> 
	     <input class="laydate-icon col-xs-4 col-lg-3" name="begintime" value="${begintime}" id="start" style=" margin-right:10px; height:28px; line-height:28px; float:left">
	      <span  style=" float:left; padding:0px 10px; line-height:32px;">至</span>
	      <input class="laydate-icon col-xs-4 col-lg-3" name="endtime" value="${endtime}" id="end" style="height:28px; line-height:28px; float:left"></li>
	     <button class="btn button_btn bg-deep-blue " onclick="search()"  type="button"><i class="fa  fa-search"></i>&nbsp;搜索</button>
    </ul>
   </form>
  </div>
 <div class="h_products_list clearfix" id="Sellerber">
   <div class="Sellerber_left menu" id="menuBar">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div> 
    <div class="menu_style" id="menu_style">
    <div class="list_content">
    </div>
  </div>
 </div>
</div>
<div class="bkg_List_style list_Exhibition list_show padding15">
 <div class="bkg_List_operation clearfix searchs_style">
  <ul class="bkg_List_Button_operation">
   <li class="btn btn-danger"><a href="javascrpt:void()" class="btn_add"><em class="bkg_List_icon icon_add"></em>删除用户</a></li>
  </ul>
 </div>
  <div class="datalist_show">
 <div class="bkg_List clearfix datatable_height confirm">
  <table class="table  table_list table_striped table-bordered">
   <thead>
   <tr>
     <th  width="40"><label><input id="a" type="checkbox" class="ace" /><span class="lbl"></span></label></th>
     <th>员工姓名</th>
     <th>性别</th>
     <th>出生日期</th>
     <th>入职时间</th>
     <th>电话</th>
     <th>住址</th>	
     <th>所属部门</th>
     <th>职务</th>
      <th>编辑</th>	
    </tr>
   </thead>
   <tbody>
   	<c:forEach items="${util.lists}" var="emp">
   		 <tr>
	     <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
	     <td><a href="javascript:" onClick="userinfo(this,121)">${emp.eName}</a></td>
	     <td>${emp.eSex}</td>
	     <td>${emp.birthDate}</td>
	     <td>${emp.entryDate}</td>
	     <td>${emp.ePhone}</td>
	     <td>${emp.eAddress}</td>
	     <td>${emp.dName}</td>
	     <td>${emp.jName}</td>
	     <td class="td-manage">
	        <a title="编辑" onclick="member_edit('编辑','member-add.html','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" >编辑</a> 
	        <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-delete" >删除</a>
	     </td>
   	 </tr>
   	</c:forEach>
   </tbody>
  </table>
  
  	<p style="margin-top: 5px;text-align: center;">
		<a href="${pageContext.request.contextPath}/jsp/tomember_list.html?pageindex=${util.currentPage}&eName=${eName}&begintime=${begintime}&endtime=${endtime}" class="btn btn-xs btn-info" <c:if test="${util.currentPage==1}">style="display: none;"</c:if>>首页</a>&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/jsp/tomember_list.html?pageindex=${util.currentPage-1}&eName=${eName}&begintime=${begintime}&endtime=${endtime}" class="btn btn-xs btn-info" <c:if test="${util.currentPage==1}">style="display: none;"</c:if>>上一页</a>&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/jsp/tomember_list.html?pageindex=${util.currentPage+1}&eName=${eName}&begintime=${begintime}&endtime=${endtime}" class="btn btn-xs btn-info" <c:if test="${util.currentPage==util.totalPage}">style="display: none;"</c:if>>下一页</a>&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/jsp/tomember_list.html?pageindex=${util.totalPage}&eName=${eName}&begintime=${begintime}&endtime=${endtime}" class="btn btn-xs btn-info" <c:if test="${util.currentPage==util.totalPage}">style="display: none;"</c:if>>尾页</a>
		<span style="font-size: 16px;">第${util.currentPage}页/共${util.totalPage}页</span>
  	</p>
    </div>
   </div>
  </div>
 </div>
</div>
<!--修改员工信息-->
<div class="add_menber" id="add_menber_style" style="display:none">
  
    <ul class=" page-content">
     <li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input value="" name="用户名" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">真实姓名：</label><span class="add_name"><input name="真实姓名" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
     <label><input name="form-field-radio" type="radio" checked="checked" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">保密</span></label>
     </span>
     <div class="prompt r_f"></div>
     </li>
     <li><label class="label_name">固定电话：</label><span class="add_name"><input name="固定电话" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">移动电话：</label><span class="add_name"><input name="移动电话" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">电子邮箱：</label><span class="add_name"><input name="电子邮箱" type="text"  class="text_add"/></span><div class="prompt r_f"></div></li>
     <li class="adderss"><label class="label_name">家庭住址：</label><span class="add_name"><input name="家庭住址" type="text"  class="text_add" style=" width:350px"/></span><div class="prompt r_f"></div></li>
     <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label>
     <span class="add_name">
     <label><input name="form-field-radio1" type="radio" checked="checked" class="ace"><span class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio1" type="radio" class="ace"><span class="lbl">关闭</span></label>
     </span>
     <div class="prompt r_f"></div></li>
    </ul>
 </div>
 <!--用户信息-->
 <div class="userinfo_style" id="userinfo_style" style="display: none">
 	<div class="member_show" >
<div class="member_jbxx clearfix" >
  <img class="img" src="${pageContext.request.contextPath}/statics/images/user.png">
  <dl  class="right_xxln">
  <dt><span class="">张三</span> <span class="">余额：40</span></dt>
  <dd class="" style="margin-left:0">这家伙很懒，什么也没有留下</dd>
  </dl>
</div>
<div class="member_content">
  <ul>
   <li><label class="label_name">性别：</label><span class="name">男</span></li>
   <li><label class="label_name">手机：</label><span class="name">13456765555</span></li>
   <li><label class="label_name">固定电话：</label><span class="name">021-454443344</span></li>
   <li><label class="label_name">邮箱：</label><span class="name">admin@mail.com</span></li>
   <li><label class="label_name">地址：</label><span class="name">江苏南京市雨花台区创业路5号紫荆花园2懂4单元402</span></li>
   <li><label class="label_name">注册时间：</label><span class="name">2014.12.20</span></li>
   <li><label class="label_name">积分：</label><span class="name">330</span></li>
   <li><label class="label_name">等级：</label><span class="name">普通用户</span></li>
   
  </ul>
</div>
</div>
 </div>
</body>
</html>
<script>
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
	$("#Sellerber").frame({
		float : 'left',
		color_btn:'.skin_select',
		Sellerber_menu:'.list_content',
		page_content:'.list_show',//内容
		datalist:".datatable_height",//数据列表高度取值
		header:65,//顶部高度
		mwidth:200,//菜单栏宽度
		
	});
});
/******时间设置*******/
  var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
   // min: laydate.now(), //设定最小日期为当前日期
    max: '2099-06-16', //最大日期
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
    max: '2099-06-16',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，重置开始日的最大日期
    }
};
laydate(start);
laydate(end);
function userinfo(id){
	 layer.open({
        type: 1,
        title: '用户信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['600px' , ''],
        content:$('#userinfo_style'),
	 })
				}
/*用户-编辑*/
function member_edit(id){
	  layer.open({
        type: 1,
        title: '修改用户信息',
		maxmin: true, 
		shadeClose:false, //点击遮罩关闭层
        area : ['800px' , ''],
        content:$('#add_menber_style'),
		btn:['提交','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
     $(".add_menber input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('添加成功！',{
               title: '提示框',				
			icon:1,		
			  });
			   layer.close(index);	
		  }		  		     				
		}
    });
}
	/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000});
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
</script>
