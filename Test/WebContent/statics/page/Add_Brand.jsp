<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加品牌</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
<script type="text/javascript" src="js/proTree.js" ></script>
<script src="${pageContext.request.contextPath }/statics/js/dist/echarts.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
</head>
<body>
<div id="add_brand" class="margin">
<div class="h_products_list clearfix mb20" id="Sellerber">
  <div class="Sellerber_left menu" id="menuBar">
    <div class="show_btn" id="rightArrow"><span></span></div>
    <div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
    <div class="menu_style" id="menu_style">
    <div class="list_content">
     <div class="side_list">
      <div class="left_add clearfix">
       <div class="column_title">添加品牌</div>
      <ul class="add_conent">
       <li class=" clearfix"><label class="label_name"><i>*</i>品牌名称：</label> <input name="" type="text" class="add_text form-control"/></li>
       <li class=" clearfix"><label class="label_name"><i>*</i>品牌序号：</label> <input name="" type="text" class="add_text form-control" style="width:80px"/></li>
       <li class=" clearfix"><label class="label_name">品牌图片：</label>
           <div class="demo l_f">
	           <div class="logobox"><div class="resizebox"><img src="${pageContext.request.contextPath }/statics/images/image.png" width="100px" alt="" height="100px"/></div></div>	
               <div class="logoupload">
                  <div class="btnbox"><a id="uploadBtnHolder" class="uploadbtn" href="javascript:;">上传替换</a></div>
                  <div style="clear:both;height:0;overflow:hidden;"></div>
                  <div class="progress-box" style="display:none;">
                    <div class="progress-num">上传进度：<b>0%</b></div>
                    <div class="progress-bar"><div style="width:0%;" class="bar-line"></div></div>
                  </div>
              </div>            
                      
           </div> <div class="prompt"><p>图片大小<b>120px*60px</b>图片大小小于5MB,</p><p>支持.jpg;.gif;.png;.jpeg格式的图片</p></div>  
    </li>
         <li class=" clearfix"><label class="label_name"><i>*</i>所属地区：</label> <input name="" type="text" class="add_text" style="width:120px"/></li>
         <li class=" clearfix"><label class="label_name">品牌描述：</label> <textarea name="" cols="" rows="" class="textarea" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">500</span>字</span></li>
         <li class=" clearfix"><label class="label_name"><i>*</i>显示状态：</label> 
         <label><input name="checkbox" type="radio" class="ace" checked="checked"><span class="lbl">显示</span></label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <label><input type="radio" class="ace" name="checkbox"><span class="lbl">不显示</span></label>
         </li>
       </ul>
     </div>
      </div>
    </div>
  </div>
 </div>
 <div class="right_add list_Exhibition list_show">
  <div class="column_title">添加商品</div>
 
    <div class="p_select_list clearfix">
        <div class="left_produt produt_select_style" >
           <span class="seach_style"><input name="" type="text"  id="seach" class="seach"><i class="fa fa-search"></i></span>
           <div id="select_style" class="datatable_height"></div>   
          
        </div>
        <div  class="Switching_btn"> 
        
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
        <div class="right_product produt_select_style ">
          <div class="title_name">选中产品</div>
          <div class="datatable_height">
          <select multiple="multiple" id="select2" class="select">
          </select>
         </div>
        </div>
      </div>
  </div>
  </div>
   <div class="operation clearfix mb20 same_module align">
 <input name="" type="button"  class="btn button_btn bg-deep-blue" value="保存"/>
 <input name="" type="reset" value="取消" class="btn button_btn btn-Dark-success"/>
</div>
</div>
</body>
</html>
<script type="text/javascript">
	function checkLength(which) {
	var maxChars = 500;
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
		var curr = maxChars - which.value.length; // 减去 当前输入的
		document.getElementById("sy").innerHTML = curr.toString();
		return true;
	}
}
//下拉框交换JQuery
$(function(){
    //移到右边
    $('#add').click(function() {
    //获取选中的选项，删除并追加给对方
        $('#select1 option:selected').appendTo('#select2');
    });
    //移到左边
    $('#remove').click(function() {
        $('#select2 option:selected').appendTo('#select1');
    });
    //全部移到右边
    $('#add_all').click(function() {
        //获取全部的选项,删除并追加给对方
        $('#select1 option').appendTo('#select2');
    });
    //全部移到左边
    $('#remove_all').click(function() {
        $('#select2 option').appendTo('#select1');
    });
    //双击选项
    $('#select1').dblclick(function(){ //绑定双击事件
        //获取全部的选项,删除并追加给对方
        $("option:selected",this).appendTo('#select2'); //追加给对方
    });
    //双击选项
    $('#select2').dblclick(function(){
       $("option:selected",this).appendTo('#select1');
    });
});
		var user=[{"id": 1, "name": "贝德玛（Bioderma）温和卸妆水净妍/舒妍洁肤液卸妆水 ","status":"关闭"},
              {"id": 2, "name": "欧诗漫OSM奢华金萃臻贵娇宠礼盒","status":"关闭"},
              {"id": 3, "name": "舒蕾洗发水奢养精油套装","status":"关闭"},
              {"id": 4, "name": "雅芳小黑裙香体乳150g","status":"关闭"},
              {"id": 5, "name": "嘉媚乐（CAMENAE）玫瑰之爱保","status":"启用"},
              {"id": 6, "name": "欧莱雅男士护肤套装 劲能极速活肤液50ml","status":"启用"},
              {"id": 7, "name": "美即面膜净透亮肤套装面膜贴升级版","status":"启用"},
              {"id": 8, "name": "可悠然（KUYURA）美肌沐浴露（欣怡幽香）550ml ","status":"启用"},
              {"id": 9, "name": "李施德林漱口水冰蓝口味500ml双包装","status":"启用"},
              {"id": 10, "name": "吕(Ryo)滋养韧发密集莹韧[滋润型]洗护套装 ","status":"启用"},
              {"id": 11, "name": "美宝莲（MAYBELLINE）气垫BB","status":"关闭"},
              {"id": 12, "name": "I'M CONCEALER我爱水润遮瑕液 #02 自然肤色","status":"启用"},
              {"id": 13, "name": "Apple iPhone 6s (A1700) 64G 玫瑰金色 移动联通电信4G手机","status":"启用"},
              {"id": 14, "name": "小米Max全网通 高配版 3GB内存 64GB ROM 金色 移动联通电信4G手机 ","status":"启用"},
              {"id": 15, "name": "OPPOR94GB+64GB内存版 玫瑰金 全网通4G手机 双卡双待","status":"启用"},
              {"id": 16, "name": "华为P9全网通 3GB+32GB版 流光金 移动联通电信4G手机 双卡双待 ","status":"启用"},
              {"id": 17, "name": "华为Mate 8 3GB+32GB版 月光银 移动联通电信4G手机 双卡双待","status":"启用"},
              {"id": 18, "name": "努比亚(nubia)【3+64GB】小牛5Z11mini 白色 移动联通电信4G手机 双卡双待","status":"启用"},
              {"id": 19, "name": "三星GalaxyA9(SM-A9100)魔幻金全网通4G手机 双卡双待 ","status":"启用"},
              {"id": 20, "name": "华为畅享5梦幻金移动联通电信4G手机双卡双待","status":"关闭"}];
     $(document).ready(function(){
        var seach=$("#seach");
		seach.keyup(function(event){
		//获取当前文本框的值
        var seachText=$("#seach").val();
		 var product="<select multiple='multiple' id='select1' class='select'>";
		  if(seachText!=""){			 
			  $.each(user,function(id, item){				     				    
                     //如果包含则为select赋值
                     if(item.name.indexOf(seachText)!=-1){
                        product+="<option value="+item.id+">"+"("+item.status+")"+item.name+"</option>";
                     }
                  })								  
				  $("#select_style").html(product);
			  }
			  else{					 
				  $.each(user,function(id, item){
					name = item.name; 
					status= item.status;
				   product+="<option value="+item.id+">"+"("+item.status+")"+item.name+"</option>";				   
				  })
                  $("#select_style").html(product);
               }
			   product+"</select>";
		}) ;
					
			    var product="";	
				 product+="<select multiple='multiple' id='select1' class='select'>";
				  $.each(user,function(id, item){
					name = item.name;  
					status= item.status;
				   product+="<option value="+item.id+" title="+item.name+">"+"("+item.status+")"+item.name+"</option>";
				   
				  })
				  product+"</select>";
                  $("#select_style").html(product);        
	})
$(function() { 
	$("#Sellerber").frame({
		float : 'left',
		color_btn:'.skin_select',
		Sellerber_menu:'.list_content',
		page_content:'.list_show',//内容
		datalist:".datatable_height",//数据列表高度取值
		header:65,//顶部高度
		mwidth:550,//菜单栏宽度
		treename:".add_conent",
		Defining:function(thisBox,settings){
			thisBox.find(settings.page_content).niceScroll({
			    cursorcolor:"#888888",  
				cursoropacitymax:1,  
				touchbehavior:false,  
				cursorwidth:"5px",  
				cursorborder:"0",  
				cursorborderradius:"5px",
		   });
			
		}
		
	});
});
</script>
<script type="text/javascript">
function updateProgress(file) {
	$('.progress-box .progress-bar > div').css('width', parseInt(file.percentUploaded) + '%');
	$('.progress-box .progress-num > b').html(SWFUpload.speed.formatPercent(file.percentUploaded));
	if(parseInt(file.percentUploaded) == 100) {
		// 如果上传完成了
		$('.progress-box').hide();
	}
}
function initProgress() {
	$('.progress-box').show();
	$('.progress-box .progress-bar > div').css('width', '0%');
	$('.progress-box .progress-num > b').html('0%');
}
function successAction(fileInfo) {
	var up_path = fileInfo.path;
	var up_width = fileInfo.width;
	var up_height = fileInfo.height;
	var _up_width,_up_height;
	if(up_width > 120) {
		_up_width = 120;
		_up_height = _up_width*up_height/up_width;
	}
	$(".logobox .resizebox").css({width: _up_width, height: _up_height});
	$(".logobox .resizebox > img").attr('src', up_path);
	$(".logobox .resizebox > img").attr('width', _up_width);
	$(".logobox .resizebox > img").attr('height', _up_height);
}
var swfImageUpload;
$(document).ready(function() {
	var settings = {
		flash_url : "${pageContext.request.contextPath }/statics/js/swfupload/swfupload.swf",
		flash9_url : "${pageContext.request.contextPath }/statics/js/swfupload/swfupload_fp9.swf",
		upload_url: "upload.php",// 接受上传的地址
		file_size_limit : "5MB",// 文件大小限制
		file_types : "*.jpg;*.gif;*.png;*.jpeg;",// 限制文件类型
		file_types_description : "图片",// 说明，自己定义
		file_upload_limit : 100,
		file_queue_limit : 0,
		custom_settings : {},
		debug: false,
		// Button settings
		button_image_url: "${pageContext.request.contextPath }/statics/js/swfupload/upload-btn.png",
		button_width: "95",
		button_height: "30 ",
		button_placeholder_id: 'uploadBtnHolder',
		button_window_mode : SWFUpload.WINDOW_MODE.TRANSPARENT,
		button_cursor : SWFUpload.CURSOR.HAND,
		button_action: SWFUpload.BUTTON_ACTION.SELECT_FILE,
		
		moving_average_history_size: 40,
		
		// The event handler functions are defined in handlers.js
		swfupload_preload_handler : preLoad,
		swfupload_load_failed_handler : loadFailed,
		file_queued_handler : fileQueued,
		file_dialog_complete_handler: fileDialogComplete,
		upload_start_handler : function (file) {
			initProgress();
			updateProgress(file);
		},
		upload_progress_handler : function(file, bytesComplete, bytesTotal) {
			updateProgress(file);
		},
		upload_success_handler : function(file, data, response) {
			// 上传成功后处理函数
			var fileInfo = eval("(" + data + ")");
			successAction(fileInfo);
		},
		upload_error_handler : function(file, errorCode, message) {
			alert('上传发生了错误！');
		},
		file_queue_error_handler : function(file, errorCode, message) {
			if(errorCode == -110) {
				alert('您选择的文件太大了。');	
			}
		}
	};
	swfImageUpload = new SWFUpload(settings);
});
</script>
