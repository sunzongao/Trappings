<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/proTree.js" ></script>
<script src="${pageContext.request.contextPath }/statics/js/dist/echarts.js" type="text/javascript"></script>
<!--[if lt IE 9]>
<script src="js/html5shiv.js" type="text/javascript"></script>
<script src="js/respond.min.js"></script>
<script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
</head>
<body style="height:200px;width:1500px;overflow: scroll; ">
<div id="add_brand" class="margin">
<div class="h_products_list clearfix mb20" id="Sellerber">
  <div class="Sellerber_left menu" id="menuBar" style="margin-left: 1px;marginpx">
    <div class="menu_style" id="menu_style">
    <div class="list_content">
     <div class="side_list">
      <div class="left_add clearfix">
       <div class="column_title">生成订单</div>
								<ul class="add_conent">
									<li class=" clearfix"><label class="label_name"><i>*</i>采购单号：</label>
										<input name="" type="text" class="add_text form-control" />
									</li>
									<li class=" clearfix"><label class="label_name"><i>*</i>开单日期：</label>
										<input class="laydate-icon col-xs-4 col-lg-3" name=""
										id="start" style="width: 165px;">
									</li>
									<li class=" clearfix"><label class="label_name"><i>*</i>供货商：</label>
										<input name="" type="text" class="add_text"
										style="width: 120px" />
									</li>
									<li class=" clearfix"><label class="label_name"><i>*</i>收货仓库：</label>
											
									</li>
									<li class=" clearfix"><label class="label_name"><i>*</i>经办人：</label>
										
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
        <div class="left_produt produt_select_style"  style="height: 400px;margin-left: 20px">
           <div class="title_name">商品列表</div>
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
   <div class="operation clearfix mb20 same_module align" style="margin: auto;">
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
              {"id": 2, "name": "欧诗漫OSM奢华金萃臻贵娇宠礼盒","status":"关闭"}];
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
