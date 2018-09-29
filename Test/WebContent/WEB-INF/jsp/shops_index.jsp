<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${pageContext.request.contextPath }/statics/css/shop.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/skin/blue/skin.css" rel="stylesheet" type="text/css" id="skin" />
<link href="${pageContext.request.contextPath }/statics/css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/css/bkg_ui.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath }/statics/js/layer/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/Sellerber.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/shopFrame.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/jquery.nicescroll.js" type="text/javascript"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery.cookie.js"></script> 
<title>店铺管理</title>
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
   <div class="l_f logo header"><img src="${pageContext.request.contextPath }/statics/images/logo_03.png" /></div>
   <div class="r_f Columns_top clearfix header">
   <!--<div class="time_style l_f"><i class="fa  fa-clock-o"></i><span id="time"></span></div>-->
      <div class="search_style l_f">
        <form action="#" method="get" class="sidebar_form">
		 <div class="input-group">
			<input type="text" name="q" class="form-control"><span class="input-group-btn"><a class="btn_flat" href="javascript:" onclick=""><i class="fa fa-search"></i></a></span>
		 </div>
        </form>
     </div>
   <div class="news l_f "><a href="#" class="fa fa-bell Notice prompt" id="promptbtn"></a><em>5</em></div>
     <div class="administrator l_f">
       <img src="${pageContext.request.contextPath }/statics/images/avatar.png"  width="36px"/><span class="user-info">欢迎你,超级管理员</span><i class="glyph-icon fa  fa-caret-down"></i>
       <ul class="dropdown-menu">
        <li><a href="#"><i class="fa fa-user"></i>个人信息</a></li>
        <li><a href="#"><i class="fa fa-cog"></i>系统设置</a></li>
        <li><a href="javascript:void(0)" id="Exit_system"><i class="fa fa-user-times"></i>退出</a></li>
       </ul>
     </div> 
   </div>
  </div>
<!--左侧-->
  <div class="Sellerber_left menu" id="menuBar">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
    <div class="menu_style" id="menu_style">
    <div class="list_content">
    <!--栏目切换-->
    <div class="switch_style">
    	<em class="fa fa-th-large switch"></em>
    	<em class="fa fa-list switch_unfold"></em>
    </div>
    <div class="skin_select clearfix">
      <ul class="dropdown-menu dropdown-caret clearfix">
         <li><a class="colorpick-btn selected" href="javascript:void(0)" data-val="default"  id="default" style="background-color:#222A2D" ></a></li>
         <li><a class="colorpick-btn" href="javascript:void(0)" data-val="blue" style="background-color:#438EB9;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:void(0)" data-val="green" style="background-color:#72B63F;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:void(0)" data-val="gray" style="background-color:#41a2ff;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:void(0)" data-val="red" style="background-color:#FF6868;" ></a></li>
         <li><a class="colorpick-btn" href="javascript:void(0)" data-val="purple" style="background-color:#6F036B;" ></a></li>
        </ul>     
     </div>
     <!--左侧菜单栏目-->  
     <div class="column_list" >
		 <ul class="menuUl menu_list" id="column_list"> 	
		 </ul>
	 </div> 
    </div>
  </div>
 </div>
<!--内容-->
  <div class="Sellerber_content" id="contents">
    <div class="breadcrumbs" id="breadcrumbs">
       <a id="js-tabNav-prev" class="radius btn-default left_roll" href="javascript:;"><i class="fa fa-backward"></i></a>
       <div class="breadcrumb_style clearfix">
	     <ul class="breadcrumb clearfix" id="min_title_list">
          <li class="active home"><span title="我的桌面" data-href="index.html"><i class="fa fa-home home-icon"></i>首页</span></li>
         </ul>
      </div>
       <a id="js-tabNav-next" class="radius btn-default right_roll" href="javascript:;"><i class="fa fa-forward"></i></a>
       <div class="btn-group radius roll-right">
		 <a class="dropdown tabClose" data-toggle="dropdown" aria-expanded="false">页签操作<i class="fa fa-caret-down" style="padding-left: 3px;"></i></a>
			<ul class="dropdown-menu dropdown-menu-right" id="dropdown_menu">
				<li><a class="tabReload" href="javascript:void(0);">刷新当前</a></li>
				<li><a class="tabCloseCurrent" href="javascript:void(0);">关闭当前</a></li>
				<li><a class="tabCloseAll" href="javascript:void(0);">全部关闭(首页)</a></li>
				<li><a class="tabCloseOther" href="javascript:void(0);">除此之外全部关闭</a></li>
			</ul>
		</div>
		<a href="javascript:void()" class="radius roll-right fullscreen"><i class="fa fa-arrows-alt"></i></a>
    </div>
  <!--具体内容-->  
  <div id="iframe_box" class="iframe_content">
  <div class="show_iframe index_home" id="show_iframe">
       <iframe scrolling="yes" class="simei_iframe" frameborder="0" src="${pageContext.request.contextPath }/statics/page/index.jsp" name="iframepage" data-href="index.html"></iframe>
       </div>
      </div>
  </div>
<!--底部-->
  <div class="Sellerber_bottom info" id="bottom">
  <span class="l_f">版权所有：江苏易佳服饰有限公司</span>
 </div>
</body>
</html>
<script type="text/javascript">
	var data =[
    {
    	 id:1,
		 pid:0,
		 url:"#",
		 icon:'fa fa-home',
         name:'系统首页',
    },
    {
		 id:2,
		 pid:0,
		 url:"#",
		 icon:'fa fa-desktop',
		 name:'商品管理',
    },
    {
		 id:3,
		 pid:0,
		 url:"#",
		 icon:'fa fa-database',
		 name:'交易管理',
    },
    {
		 id:4,
		 pid:0,
		 url:"#",
		 icon:'fa fa-credit-card',
		 name:'支付管理',
    },
    {
		 id:5,
		 pid:0,
		 url:"#",
		 icon:'fa fa-cogs',
		 name:'系统管理',
    },
    {
		 id:7,
		 pid:0,
		 url:"#",
		 icon:'fa fa-users',
		 name:'管理员',
    },
    {
		 id:8,
		 pid:0,
		 url:"#",
		 icon:'fa fa-user',
		 name:'会员管理',	  
    },
    {
		 id:10,
		 pid:0,
		 url:"#",
		 icon:'fa fa-file-photo-o',
		 name:'广告管理',
    },{
		 id:12,
		 pid:0,
		 url:"#",
		 icon:'fa fa-home',
		 name:'前端管理',
    },{
		 id:14,
		 pid:0,
		 url:"#",
		 icon:'fa fa-laptop',
		 name:'店铺管理',
    },
		{
		  id:26,
		  pid:8,
		  icon:'fa fa-angle-double-right',
		  url:"${pageContext.request.contextPath }/jsp/member_list.jsp",
		  name:'会员列表',

	},
	{
		 id:26,
		 pid:1,
		 icon:'fa fa-angle-double-right',
		 url:"${pageContext.request.contextPath }/jsp/index.jsp",
		 name:'首页',

  },
	{
		  id:34,
		  pid:2,
		  icon:'fa fa-angle-double-right',
		  url:'${pageContext.request.contextPath }/jsp/add_product.jsp',
		  name:'添加商品',

	},
	{
		 id:35,
		 pid:2,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/Brand_Manage.jsp',
		 name:'品牌管理',

  },
	{
		 id:36,
		 pid:2,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/Products.jsp',
		 name:'商品分类',

	},
		{
		 id:45,
		 pid:7,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/admin_Competence.jsp',
		 name:'权限设置',

	},{
		 id:46,
		 pid:3,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/Order_form.jsp',
		 name:'订单管理',

	},{
		 id:47,
		 pid:3,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/Refund.jsp',
		 name:'退款管理',

	},{
		 id:54,
		 pid:7,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/administrator_list.jsp',
		 name:'管理员设置',

	},{
		 id:55,
		 pid:7,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/Personal_info.jsp',
		 name:'管理员信息',

	},
		{
		 id:56,
		 pid:2,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/Products.jsp',
		 name:'分类管理',

	},
	{
		 id:38,
		 pid:3,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/Brand_Manage.jsp',
		 name:'订单处理',

  },
	{
		 id:39,
		 pid:3,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/Order_Logistics.jsp',
		 name:'物流管理',

	},{
		 id:43,
		 pid:10,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/Advertising_list.jsp',
		 name:'广告列表',

	},
		{
		 id:44,
		 pid:10,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/Advertising_sort.jsp',
		 name:'广告分类',

	},{
		 id:45,
		 pid:5,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/system_columns.jsp',
		 name:'栏目设置',

	},
		{
		 id:46,
		 pid:5,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/form_builder.jsp',
		 name:'自定页面',

	},
		{
		 id:46,
		 pid:5,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/jsp/system_info.jsp',
		 name:'系统设置',

	},
		{
		 id:47,
		 pid:5,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/statics/page/rizhi_list.jsp',
		 name:'系统日志',

	},{
		 id:49,
		 pid:13,
		 icon:'fa fa-angle-double-right',
		 url:'${pageContext.request.contextPath }/statics/page/Notice.jsp',
		 name:'消息通知',

	}]
//设置框架
 $(function() {  		 
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
});
$('#Exit_system').on('click', function(){
      layer.confirm('是否确定退出系统？', {
     btn: ['是','否'] ,//按钮
	 icon:2,
    }, 
	function(){
	  location.href="${pageContext.request.contextPath }/statics/page/login.jsp";  
    });
});
</script>

