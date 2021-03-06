<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath }/statics/css/shop.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/statics/skin/blue/skin.css"
	rel="stylesheet" type="text/css" id="skin" />
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
	src="${pageContext.request.contextPath }/statics/js/layer/layer.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/Sellerber.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/shopFrame.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/statics/js/jquery.nicescroll.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/jquery.cookie.js"></script>
<title>易佳服饰后台管理系统</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script type="text/javascript" src="js/PIE/PIE_IE678.js"></script>
 <![endif]-->
<body>
	<div class="Sellerber" id="Sellerber">
		<!--顶部-->
		<div class="Sellerber_header apex clearfix" id="Sellerber_header">
			<div class="l_f logo header">
				<img
					src="${pageContext.request.contextPath }/statics/images/logo_03.png" />
			</div>
			<div class="r_f Columns_top clearfix header">
				<!--<div class="time_style l_f"><i class="fa  fa-clock-o"></i><span id="time"></span></div>-->
				<div class="search_style l_f">
				</div>
				<div class="news l_f ">
				<shiro:hasRole name="Purchasing"><a href="#" class="fa fa-bell Notice prompt" id="promptbtn"></a><em>6</em></shiro:hasRole>
				<shiro:hasRole name="Warehouse"><a href="#" class="fa fa-bell Notice prompt" id="promptbtn"></a><em>6</em></shiro:hasRole>
				</div>
				<div class="administrator l_f">
					<img src="${pageContext.request.contextPath }/statics/images/avatar.png" width="36px" /><span class="user-info">欢迎你 ${loginUser.surname}
					</span><i class="glyph-icon fa  fa-caret-down"></i>
					<ul class="dropdown-menu">
					<shiro:hasRole name="Warehouse">
						<li><a href="javascript:void(0)" id="Exit_user"><i
								class="fa fa-user-times"></i>修改库存预警数量</a></li>
					</shiro:hasRole>
						<li><a href="javascript:void(0)" id="Exit_system"><i
								class="fa fa-user-times"></i>退出</a></li>
					</ul>
				</div>
			</div>
		</div>
		<!--左侧-->
		<div class="Sellerber_left menu" id="menuBar">
			<div class="show_btn" id="rightArrow">
				<span></span>
			</div>
			<div class="side_title">
				<a title="隐藏" class="close_btn"><span></span></a>
			</div>
			<div class="menu_style" id="menu_style">
				<div class="list_content">
					<!--栏目切换-->
					<div class="switch_style">
						<em class="fa fa-th-large switch"></em> <em
							class="fa fa-list switch_unfold"></em>
					</div>
					<!--左侧菜单栏目-->
					<div class="column_list">
						<ul class="menuUl menu_list" id="column_list">
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!--内容-->
		<div class="Sellerber_content" id="contents">
			<div class="breadcrumbs" id="breadcrumbs">
				<a id="js-tabNav-prev" class="radius btn-default left_roll"
					href="javascript:;"><i class="fa fa-backward"></i></a>
				<div class="breadcrumb_style clearfix">
					<ul class="breadcrumb clearfix" id="min_title_list">
						<li class="active home"><span title="我的桌面"
							data-href="index.html"><i class="fa fa-home home-icon"></i>首页</span></li>
					</ul>
				</div>
				<a id="js-tabNav-next" class="radius btn-default right_roll"
					href="javascript:;"><i class="fa fa-forward"></i></a>
				<div class="btn-group radius roll-right">
					<a class="dropdown tabClose" data-toggle="dropdown"
						aria-expanded="false">页签操作<i class="fa fa-caret-down"
						style="padding-left: 3px;"></i></a>
					<ul class="dropdown-menu dropdown-menu-right" id="dropdown_menu">
						<li><a class="tabReload" href="javascript:void(0);">刷新当前</a></li>
						<li><a class="tabCloseCurrent" href="javascript:void(0);">关闭当前</a></li>
						<li><a class="tabCloseAll" href="javascript:void(0);">全部关闭(首页)</a></li>
						<li><a class="tabCloseOther" href="javascript:void(0);">除此之外全部关闭</a></li>
					</ul>
				</div>
				<a href="javascript:void()" class="radius roll-right fullscreen"><i
					class="fa fa-arrows-alt"></i></a>
			</div>
			<!--具体内容-->
			<div id="iframe_box" class="iframe_content">
				<div class="show_iframe index_home" id="show_iframe">
					<iframe scrolling="yes" class="simei_iframe" frameborder="0"
						src="${pageContext.request.contextPath }/statics/page/index.jsp"
						name="iframepage" data-href="index.html"></iframe>
				</div>
			</div>
		</div>
		<!--底部-->
		<div class="Sellerber_bottom info" id="bottom">
			<span class="l_f">版权所有：江苏易佳服饰有限公司</span>
		</div>
		  <!--消息提示板块内容-->
<div class="prompt_style prompt">
	<div class="prompt_title">通知消息</div>
	<div class="prompt_info clearfix">
	  <div class="tz_title">订单消息（5）</div>
	  <a href="" class=""><i class="fa fa-user icon_prompt label-danger"></i>你有订单还没有处理请及时处理，点击查看详细</a>
    </div>
    <div class="prompt_info clearfix">
	  <div class="tz_title">订单消息（5）</div>
	  <a href="" class=""><i class="fa fa-volume-up icon_prompt label-success"></i>你有订单还没有处理请及时处理，点击查看详细</a>
    </div>
    <div class="prompt_info clearfix">
	  <div class="tz_title">订单消息（5）</div>
	  <a href="" class=""><i class="fa fa-user icon_prompt label-warning"></i>你有订单还没有处理请及时处理，点击查看详细</a>
    </div>
    <div class="prompt_info clearfix">
	  <div class="tz_title">订单消息（5）</div>
	  <a href="" class=""><i class="fa fa-user icon_prompt label-danger"></i>你有订单还没有处理请及时处理，点击查看详细</a>
    </div>
    <div class="prompt_info clearfix submenu">
	  <div class="tz_title">订单消息（5）</div>
	  <a href="javascript:void()" class="" name="Personal_info.html" title="订单消息"><i class="fa fa-user icon_prompt label-danger"></i>你有订单还没有处理请及时处理</a>
    </div>
  </div> 
		
</body>
</html>
<script type="text/javascript">
//设置框架
 $(function() {  
	 $("#Exit_user").click(function(){
		 layer.open({
		        type: 2,
		        title: '修改库存预警数量',
				maxmin: true, 
				shadeClose:true, //点击遮罩关闭层
				scrollbar: true,
		        area : ['500px' , '200px'],
		        content:"${pageContext.request.contextPath}/jsp/toUpdateRepertoryAllMinimumStock"
		      }); 
	 });
	 $.get("${pageContext.request.contextPath}/getdata",null,
				function(data) {
		 			var d=JSON.parse(data);
		 			ison(d);
				});
});
function ison(data){
	 $("#Sellerber").frame({
			float : 'left',//设置菜单栏目方向属性
			minStatue:true,//切换模式
			hheight:70,//设置顶部高度 高度为0时自动样式切换（达到另外一种界面效果）
			bheight:30,//设置底部高度
			mwidth:200,//菜单栏宽度（最好不要改动该数值，一般200的宽度值最好）
			switchwidth:50,//切换菜单栏目宽度
			color_btn:'.skin_select',//设置颜色
			menu_nav:'.menu_list',//设置栏目属性
			column_list:'.column_list',//设置栏目名称
			time:'.date_time',//设置时间属性(不填写不显示)
			logo_img:'images/logo_01.png',//logo地址链接（当header为0时显示该属性）
		    Sellerber_content:'.Sellerber_content',//右侧名称
			Sellerber_menu:'.list_content', //左侧栏目
			header:'.Sellerber_header',//顶部栏目	
			prompt:'.prompt_style',
			prompt_btn:'#promptbtn',//点击事件
			data:data,//数据
			mouIconOpen:"fa fa-angle-down",// 菜单(展开)图标
		    mouIconClose:"fa fa-angle-up" , // 菜单（隐藏）图标
			Rightclick:true//是否禁用右键
		 }); 
	
}
$('#Exit_system').on('click', function(){
      layer.confirm('是否确定退出系统？', {
     btn: ['是','否'] ,//按钮
	 icon:2,
    }, 
	function(){
	  location.href="${pageContext.request.contextPath }/loginout";  
    });
});
</script>

