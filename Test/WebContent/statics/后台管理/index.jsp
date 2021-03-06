<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta charset="utf-8">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<title>操作手册</title>
</head>

<body>
 <div class="container">
    <div class="color4 alert">本框架不支持移动端使用，只支持pc端以及小屏幕使用。</div>
 	<div class="margin">
 	<div class="">
 	<h2>框架：</h2>
 	<h5>
 	<p class="margin">$(function() { </p> 		 
		<p class="margin">$("<b class="color1">参数[1]</b>").frame({</p>  <p class="margin"> <b class="color2">设置参数值[2]</b></p><p class="margin"> });</p>
 	</h5>
 	<h4 class="margin"><b class="color3">[1]</b>:该参数为设置框架的必备条件填写该参数才能使用框架效果，该参数可以为class属性也可以为ID属性</h4>
 	<h4 class="margin"><b class="color3">[2]</b>:该元素设置框架里的不同属性实现效果，具体参数值请看下面的说明</h4>
 	</div>
 	<div class="clearfix mtb30">
 	   <h2 class="title_name color2">主框架结构参数说明</h2>
 		<table class="table tab-content table-bordered table-striped table-hover table-responsive " >
 			<thead><tr><th class="text-center" width="12%">参数</th><th class="text-center" width="12%">参数名</th><th class="text-center" width="15%">默认值</th><th class="text-center">说明</th></tr></thead>
 			<tbody>
 			<tr><td class="text-center">float</td><td class="text-center">方位</td><td class="text-center color4">left</td><td>设置菜单栏目录板块显示的方向，<b class="color4">left</b>为左侧，<b class="color4">right</b>为右侧，默认左侧显示</td></tr>
 			<tr>
 			<td class="text-center">hheight</td>
 			<td class="text-center">顶部高度</td>
 			<td class="text-center color4">70</td>
 			<td>设置顶部显示板块的高度值，默认为70，可自定义高度。当高度值为<b class="color1">0</b>时框架改变，顶部将不再显示。</td>
 			</tr>
 				<tr>
 			<td class="text-center">bheight</td>
 			<td class="text-center">底部高度</td>
 			<td class="text-center color4">	30</td>
 			<td>设置底部显示板块的宽度，默认30,可自定义高度，30高度值比较适合，可为0</td>
 			</tr>
 				<tr>
 			<td class="text-center">mwidth</td>
 			<td class="text-center">栏目宽度</td>
 			<td class="text-center color4">200</td>
 			<td>设置菜单栏目宽度值，默认200，可自定义，一般200最好
 			<p class="color2">注：当mwidth等于switchwidth宽度时执行图标菜单栏显示效果，此时无菜单栏样式切换模式。</p>
 			</td>
 			</tr>
 				<tr>
 			<td class="text-center">header</td>
 			<td class="text-center">顶部板块</td>
 			<td class="text-center color4">null</td>
 			<td>设置顶部板块显示区域，ID，class不区分，可在该属性下编写你自己的样式</td>
 			</tr>
 				<tr>
 			<td class="text-center">Sellerber_left</td>
 			<td class="text-center">左侧板块</td>
 			<td class="text-center color4">自定义	</td>
 			<td>设置板块参数名，可在该板块下自己编辑样式内容</td>
 			</tr>
 				<tr>
 			<td class="text-center">Sellerber_bottom</td>
 			<td class="text-center">底部板块</td>
 			<td class="text-center color4">	自定义</td>
 			<td>设置板块参数名，可在该板块下自己编辑样式内容</td>
 			</tr>
 				<tr>
 			<td class="text-center">Sellerber_content</td>
 			<td class="text-center">内容板块</td>
 			<td class="text-center color4">自定义	</td>
 			<td>设置板块参数名，可在该板块下自己编辑样式内容</td>
 			</tr>
 				<tr>
 			<td class="text-center">switchwidth</td>
 			<td class="text-center">图标栏宽度</td>
 			<td class="text-center color4">60</td>
 			<td>设置你图标菜单栏显示的宽度值，默认60，可自定义宽度,设置该值内容显示更全面，适合小屏幕使用</td>
 			</tr>
 				<tr>
 			<td class="text-center">click_switch</td>
 			<td class="text-center">点击切换</td>
 			<td class="text-center color4">null	</td>
 			<td>设置该值主要切换栏目显示样式，由原来的图文栏目，图标显示模式也会变，切换成图标显示模式，宽度变小，内容区显示更全面，属性自定义。</td>
 			</tr>
 				<tr>
 			<td class="text-center">minStatue</td>
 			<td class="text-center">切换栏</td>
 			<td class="text-center color4">true	</td>
 			<td>用于切换菜单栏显示模式，使用，为<b class="color1">true</b>可以进行菜单栏的显示模式，当为<b class="color1">false</b>无切效果模式</td>
 			</tr>
 				<tr>
 			<td class="text-center">icon_unfold</td>
 			<td class="text-center">图标</td>
 			<td class="text-center color4">	null</td>
 			<td>用户自定义图标显示的方法，同switch方法一起用</td>
 			</tr>
 				<tr>
 			<td class="text-center">time</td>
 			<td class="text-center">时间</td>
 			<td class="text-center color4">null	</td>
 			<td>自定义设置显示时间位置参数。（方位）</td>
 			</tr>
 			<tr>
 			<td class="text-center">color_btn</td>
 			<td class="text-center">皮肤</td>
 			<td class="text-center color4">null</td>
 			<td>设置系统皮肤颜色点击事件，需添加相应的css文件</td>
 			</tr>
 				<tr>
 			<td class="text-center">logo_img</td>
 			<td class="text-center">logo图标地址</td>
 			<td class="text-center color4">null</td>
 			<td>自定义公司logo地址<b class="color1">当顶部板块header为0时显示该logo否则不显示</b></td>
 			</tr>
 				<tr>
 			<td class="text-center">prompt</td>
 			<td class="text-center">消息板块</td>
 			<td class="text-center color4">自定义</td>
 			<td>自定义class或id用于执行显示消息框</td>
 			</tr>
 				<tr>
 			<td class="text-center">prompt_btn</td>
 			<td class="text-center">消息点击</td>
 			<td class="text-center color4">	自定义</td>
 			<td>自定义class或id用于执行点击时弹出消息框。</td>
 			</tr>
 				<tr>
 			<td class="text-center">mouIconOpen</td>
 			<td class="text-center">图标显示（展开）</td>
 			<td class="text-center color4">自定义</td>
 			<td>设置显示用于框架菜单栏中的箭头指示方向（<b class="color2">使用字体库文件或是图标文件</b>）</td>
 			</tr>
 				<tr>
 			<td class="text-center">mouIconClose</td>
 			<td class="text-center">图标显示（隐藏）</td>
 			<td class="text-center color4">自定义</td>
 			<td>设置显示用于框架菜单栏中的箭头指示方向（<b class="color2">使用字体库文件或是图标文件</b>）</td>
 			</tr>
 			<tr>
 			<td class="text-center">data</td>
 			<td class="text-center">数据</td>
 			<td class="text-center color4">null</td>
 			<td>设置主框架菜单栏的数据源</td>
 			</tr>
 			<tr>
 			<td class="text-center">Rightclick</td>
 			<td class="text-center">右键禁用</td>
 			<td class="text-center color4">false或true</td>
 			<td>是否禁用右键功能（<b class="color2">内部框架禁用同样使用Rightclick</b>）</td>
 			</tr>
 			<tr>
 			<td class="text-center">prompt_width</td>
 			<td class="text-center">消息框宽度</td>
 			<td class="text-center color4">400</td>
 			<td>设置框架消息框的宽度值，可自定义宽度。</td>
 			</tr>
 			<tr>
 			<td class="text-center">Defining</td>
 			<td class="text-center">扩展功能</td>
 			<td class="text-center color4">自定义</td>
 			<td>用于扩展相应的功能；<p>使用方法Defining:function(thisBox,settings){}</p></td>
 			</tr>
 	
 			</tbody>
 		</table>
 	 </div>
 	 <div class="clearfix mtb30">
 	   <h2 class="title_name color2">内页框架结构参数说明</h2>
 	   <div class="clearfix">
 	   	<div class="mtb20">该框架使用和外主框架一样，不一样是使用的参数不同，方便配置。更快速的进行界面搭配</div>
 	   	 	    <table class="table tab-content table-bordered table-striped table-hover table-responsive " >
 	   <thead><tr><th class="text-center" width="12%">参数</th><th class="text-center" width="12%">参数名</th><th class="text-center" width="15%">默认值</th><th class="text-center">说明</th></tr></thead>
 	   	<tbody>
	    	<tr>
 			<td class="text-center">datalist</td>
 			<td class="text-center">数据列表</td>
 			<td class="text-center color4">自定义</td>
 			<td>设置一屏显示数据列表高度值，详细内页使用。</td>
 			</tr>
 			<tr>
 			<td class="text-center">page_content</td>
 			<td class="text-center">内页内容</td>
 			<td class="text-center color4">自定义class或id</td>
 			<td>配置设置内页框架的参数，用于一屏显示使用。</td>
 			</tr>
 			<tr>
 			<td class="text-center">treename</td>
 			<td class="text-center">树状图名</td>
 			<td class="text-center color4">自定义</td>
 			<td>设置树状图显示</td>
 			</tr>
 			</tbody>
 		</table>
 	   </div>
		</div>
		 <div class="clearfix mtb30">
 	   <h2 class="title_name color2">必要参数说明（class）</h2>
 	   <div class="clearfix">
 	   	<div>框架有些需要一定的制度样式名称方便构建界面,一般为class样式属性名称，添加位置也有所不同，请根据手册进行配置</div>
 	   </div>

 	   <div class="mtb20">
 	   	
 	   
 	   <table class="table tab-content table-bordered table-striped table-hover table-responsive " >
 	   	<thead><tr><th class="text-center" width="20%">参数</th><th class="text-center" width="20%">值</th><th class="text-center">说明</th></tr></thead>
 	   	<tbody>
 	   		<tr>
 			<td class="text-center">same_module<span class="color2">(选填)</span></td>
 			<td>class</td>
 			<td class="text-center color4">用于内框架一屏显示某板块。	</td>
 			</tr>
	   	<tr>
 			<td class="text-center">searchs_style<span class="color2">(选填)</span></td>
 			<td>class</td>
 			<td class="text-center color4">	用于内框架一屏显示搜索模块。</td>
 			</tr>
	   	  	<tr>
 			<td class="text-center">menuUl<span class="color2">(必填)</span></td>
 			<td>class</td>
 			<td class="text-center color4">用于执行菜单栏目切换使用，当在iframe中使用菜单栏目切换时以及显示菜单栏目时使用</td>
 			</tr>
	   	  	<tr>
 			<td class="text-center">submenu<span class="color2">(必填)</span></td>
 			<td>class</td>
 			<td class="text-center color4">用于执行菜单栏目切换使用，当在iframe中使用菜单栏目切换时以及显示菜单栏目时使用</td>
 			</tr>
	   	  	<tr>
 			<td class="text-center">min_title_list<span class="color2">(外框架)</span></td>
 			<td>id</td>
 			<td class="text-center color4">框架选项卡栏目显示使用</td>
 			</tr>
	   	  	<tr>
 			<td class="text-center">js-tabNav-prev<span class="color2">(外框架)</span></td>
 			<td>id</td>
 			<td class="text-center color4">选项卡移动（超出显示宽度时）左侧移动</td>
 			</tr>
	   		<tr>
 			<td class="text-center">js-tabNav-next<span class="color2">(外框架)</span></td>
 			<td>id</td>
 			<td class="text-center color4">选项卡移动（超出显示宽度时）右侧移动</td>
 			</tr>
	   	<tr>
 			<td class="text-center">show_iframe<span class="color2">(外框架)</span></td>
 			<td>id</td>
 			<td class="text-center color4">菜单栏，选项卡切换内容显示模块</td>
 			</tr>
 	   	</tbody>
	    </table>
		</div>
		</div>
 	</div>
 </div>
</body>
</html>
