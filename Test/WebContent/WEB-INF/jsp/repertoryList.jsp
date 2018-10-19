<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="${pageContext.request.contextPath }/statics/css/shop.css" type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="${pageContext.request.contextPath }/statics/font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script type="${pageContext.request.contextPath }/statics/text/javascript" src="js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/shopFrame.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/Sellerber.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/layer/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/laydate/laydate.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/jquery.dataTables.bootstrap.js"></script>
<title>广告分类</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<form action="" method="get">
<div class="margin advertising" id="page_style">
  <div class="operation clearfix">
<button class="btn button_btn btn-danger" type="button" onclick=""><i class="fa fa-trash-o"></i>&nbsp;删除</button>
<span class="submenu"><a href="javascript:void(0)" name="" onclick="add_AD_sort()" class="btn button_btn bg-deep-blue" title="添加库存"><i class="fa  fa-edit"></i>&nbsp;添加库存</a></span>

<div class="search  clearfix">
				<select name="brandId" id="brandId" 
					class="form-control col-xs-6" style="width: 23%">
					<option value="0">--商品品牌 --</option>
					<c:forEach var="b" items="${brands }">
						<option value="${b.brandId }"
							<c:if test="${b.brandId eq brandId}">
									selected
								</c:if>>${b.bName }</option>
					</c:forEach>
				</select>

				<select name="unitId" id="unitId" 
					class="form-control col-xs-6" style="width: 23%">
					<option value="0">--商品单位--</option>
					<c:forEach var="u" items="${units }">
						<option value="${u.unitId }"
							<c:if test="${u.unitId eq unitId}">
									selected
								</c:if>>${u.uName }</option>
					</c:forEach>
				</select>
				
				<select name="storehouseId" id="storehouseId"
					class="form-control col-xs-6" style="width: 23%">
					<option value="0">--所属仓库--</option>
					<c:forEach var="s" items="${storehouses }">
						<option value="${s.storehouseId }"
							<c:if test="${s.storehouseId eq storehouseId}">
									selected
								</c:if>>${s.stoName }</option>
					</c:forEach>
				</select>
				 &nbsp;&nbsp;&nbsp;&nbsp;
				<input type="submit" value="搜索" class="btn button_btn bg-deep-blue "/>
			</div>
		</div>
		<!--分类管理-->
		<div class="sort_list">
			<table class="table table_list table_striped table-

bordered"
				id="sample-table">
				<thead>
					<tr>
						<th width="30"><label><input type="checkbox"
								class="ace"><span class="lbl"></span></label></th>
						<th>商品编号</th>
						<th>商品名称</th>
						<th>库存量</th>
						<th>单位</th>
						<th>品牌</th>
						<th>供应商</th>
						<th>入库时间</th>
						<th>所属仓库</th>
						<th>操作</th>
					</tr>
					<c:forEach var="r" items="${pageUtil.lists }">
						<tr>
							<th>
							<label>
							<input type="hidden" value="${r.commodityId }" />
								<input id="a" type="checkbox" class="ace" value="${r.commodityId }" name="ace" class="ace" >
								<span class="lbl"></span>
							</label>
							</th>
							<th>${r.commodityId }</th>
							<th>${r.cName }</th>
							<th>${r.inventory }</th>
							<th>${r.repertoryUName}</th>
							<th>${r.repertoryBName }</th>
							<th>${r.repertorySName }</th>
							<th>${r.laidTime }</th>
							<th>${r.repertorySeName }</th>
							<th>
							<a title="编辑" onclick="member_edit(this)" href="javascript:;${r.commodityId}"  class="btn bg-deep-blue  operation_btn" >编辑</a> 
							<a title="删除" href="javascript:void()" onclick="picture_del(this,'${r.commodityId}')" class="btn btn-danger operation_btn">删除</a> 
							</th>
					</c:forEach>
				</thead>
				<tbody>
					<tr>
					</tr>
				</tbody>
			</table>
 	<p style="margin-top: 5px;text-align: center;">
		<a href="${pageContext.request.contextPath}/jsp/repertoryList.html?currenntPage=1&brandId=${brandId}&unitId=${unitId}&storehouseId=${storehouseId}" class="btn btn-xs btn-info" <c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>首页</a>&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/jsp/repertoryList.html?currenntPage=${pageUtil.currentPage-1}&brandId=${brandId}&unitId=${unitId}&storehouseId=${storehouseId}" class="btn btn-xs btn-info" <c:if test="${pageUtil.currentPage==1}">style="display: none;"</c:if>>上一页</a>&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/jsp/repertoryList.html?currenntPage=${pageUtil.currentPage+1}&brandId=${brandId}&unitId=${unitId}&storehouseId=${storehouseId}" class="btn btn-xs btn-info" <c:if test="${pageUtil.currentPage==pageUtil.totalPage}">style="display: none;"</c:if>>下一页</a>&nbsp;&nbsp;
		<a href="${pageContext.request.contextPath}/jsp/repertoryList.html?currenntPage=${pageUtil.totalPage}&brandId=${brandId}&unitId=${unitId}&storehouseId=${storehouseId}" class="btn btn-xs btn-info" <c:if test="${pageUtil.currentPage==pageUtil.totalPage}">style="display: none;"</c:if>>尾页</a>
		<span style="font-size: 16px;">第${pageUtil.currentPage}页/共${pageUtil.totalPage}页</span>
  	</p>
</div>
</div>
</form>
<!--添加库存-->
<div id="ad_sort" class="display">
 <div class="add_style">
  <ul>
   <li class="clearfix"><label class="label_name col-xs-2">商品编号：&nbsp;&nbsp;</label><span class="cont_style col-xs-9">
   		<select name="commodityId" id="commodityId" 
					class="form-control col-xs-6" style="width: 30%">
					<option value="0">--商品编号--</option>
					<c:forEach var="c1" items="${commoditys }">
						<option value="${c1.commodityId }">${c1.commodityId }</option>
					</c:forEach>
				</select>
				<span id="msg"></span>
   </span></li>
   <li class="clearfix"><label class="label_name col-xs-2">商品名称：&nbsp;&nbsp;</label><span class="cont_style col-xs-9">
   		<input name="商品名称" type="text" id="cName" disabled="disabled"  class="col-xs-10 col-sm-5" style="width:450px" >
   </span></li>
   <li class="clearfix"><label class="label_name col-xs-2">库存数量：&nbsp;&nbsp;</label><span class="cont_style col-xs-9">
   		<input name="库存数量" type="text" id="inventory" class="col-xs-10 col-sm-5" style="width:450px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">商品单位：&nbsp;&nbsp;</label><span class="cont_style col-xs-9">
   		<select name="unitId1" id="unitId1" 
					class="form-control col-xs-6" style="width: 30%">
					<option value="0">--商品单位--</option>
					<c:forEach var="u1" items="${units }">
						<option value="${u1.unitId }">${u1.uName }</option>
					</c:forEach>
				</select>
   	</span></li>
   	<li class="clearfix"><label class="label_name col-xs-2">商品品牌：&nbsp;&nbsp;</label><span class="cont_style col-xs-9">
   		<select name="brandId1" id="brandId1" 
					class="form-control col-xs-6" style="width: 30%">
					<option value="0">--商品品牌--</option>
					<c:forEach var="b1" items="${brands }">
						<option value="${b1.brandId }">${b1.bName }</option>
					</c:forEach>
				</select>
   	</span></li>
   	<li class="clearfix"><label class="label_name col-xs-2">供 应  商：&nbsp;&nbsp;</label><span class="cont_style col-xs-9">
   			<select name="supplierId1" id="supplierId1" 
					class="form-control col-xs-6" style="width: 30%">
					<option value="0">--供应商--</option>
					<c:forEach var="s1" items="${suppliers }">
						<option value="${s1.supplierId }">${s1.sName }</option>
					</c:forEach>
				</select></span>
   	</li>
   	   	<li class="clearfix"><label class="label_name col-xs-2">所属仓库：&nbsp;&nbsp;</label><span class="cont_style col-xs-9">
   		<select name="storehouseId1" id="storehouseId1"
					class="form-control col-xs-6" style="width: 30%" onchange="select(this)">
					<option value="0">--所属仓库--</option>
					<c:forEach var="s1" items="${storehouses }">
						<option value="${s1.storehouseId }">${s1.stoName }</option>
					</c:forEach>
				</select>
   	</span></li>
  </ul>
 </div>
</div>
 
</body>
</html>
<script>
 
 /*点击商品列表下拉框，自动在input标签中显示别的值  */
 $(function(){
		$("#commodityId").change(function(){
			var id = $("#commodityId").val();
			var cName = $("#cName").val();
			$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/AjaxErJiLianDong",
					data:{'CommodityId':id},
					success:function(data){
						if(data=="0"){
							$("#cName").val("");
							$("#msg").html(" ");
						}else{
							$("#cName").val(data);
						}
					}
			})
		})	; 
	 });
 
 /* 根据商品编号查重 */
	$("#commodityId").change(function(){
		var id = $("#commodityId").val();
		$.ajax({
			type:"post",
			url:"${pageContext.request.contextPath}/jsp/chaChong",
			data:{'commodityId':id},
			dataType:"json",
			success:function(data){
				if(data==true){
					$(".layui-layer-btn0").hide();
					$("#msg").text("商品编号不可以使用").css({color:"red"});
				}else{
					$(".layui-layer-btn0").show();
					$("#msg").text("商品编号可以使用").css("color","green");
				}
			}
		});
	}); 
 
 jQuery(function($) {
				var oTable1 = $('#sample-table').dataTable( {
				"data": dataSet,
				"width":"100%",	
				"bLengthChange":false,
				"iDisplayLength": 20,
				//"columns" : _tableCols,
				"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		        "bStateSave": true,//状态保存
				"searching": false,
		        "aoColumnDefs": [{"orderable":false,"aTargets":[0,2,3]
				}]
		
			   });
			
				$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
			}); 
	/*库存-删除*/
function picture_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.post(
			"${pageContext.request.contextPath}/jsp/deleteRepertory",
			{"commodityId":id},function(data){
				if(data=="true"){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
				}
			}
		);
	});
}
	
	

/*库存-编辑*/
function member_edit(id){
	  layer.open({
        type: 2,
        title: '修改库存信息',
		maxmin: true, 
		shadeClose:true, //点击遮罩关闭层
		scrollbar: true,
        area : ['800px' , '450px'],
        content:"${pageContext.request.contextPath}/jsp/repertoryUpdate?id="+id
        });
}
/***************添加库存***********/
function add_AD_sort( ){
	  layer.open({
        type: 1,
        title: '添加库存',
		maxmin: false, 
		shadeClose: false, //点击遮罩关闭层
        area : ['600px' , ''],
        content:$('#ad_sort'),
		btn:['添加','取消'],
			yes:function(index,layero){	
		 var num=0;
		 var str="";
		  $(".add_style input[type$='text']").each(function(n){
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
        	  var commodityId = $("#commodityId").val();
        	  var cName = $("#cName").val();
        	  var inventory = $("#inventory").val();
        	  var unitId = $("#unitId1").val();
        	  var brandId = $("#brandId1").val();
        	  var supplierId = $("#supplierId1").val();
        	  var storehouseId = $("#storehouseId1").val();
        	  if(unitId==0){
        		  layer.msg("请选择商品单位！");
        		  return;
        	  }
        	  if(brandId==0){
        		  layer.msg("请选择商品品牌！");
        		  return;
        	  }
        	  if(supplierId==0){
        		  layer.msg("请选择供应商！");
        		  return;
        	  }
        	  if(storehouseId==0){
        		  layer.msg("请选择所属仓库！");
        		  return;
        	  }
        	  $.post("${pageContext.request.contextPath}/jsp/addRepertory",{"commodityId":commodityId,"cName":cName,"inventory":inventory,
					"unitId":unitId,"brandId":brandId,"supplierId":supplierId,"storehouseId":storehouseId
				},function(data){
					if(data=="true"){
						 layer.alert('添加成功！',{
				               title: '提示框',				
							icon:1,		
							  });
							   layer.close(index);
							   
					}else{
						layer.alert('添加失败！',{
				               title: '提示框',				
							icon:1,		
							  });
						window.location.reload();
					}
				})
				window.location.reload();
		  }	
		 
		 }
	  })
	}
 /*checkbox激发事件*/
$('#checkbox').on('click',function(){
	if($('input[name="checkbox"]').prop("checked")){
		 $('.Date_selection ').css('display','block');
		}
	else{
		
		 $('.Date_selection').css('display','none');
		}	
	});
  /******时间设置*******/
  var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
    min: laydate.now(), //设定最小日期为当前日期
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
    min: laydate.now(),
    max: '2099-06-16',
    istime: true,
    istoday: false,
    choose: function(datas){
        start.max = datas; //结束日选好后，重置开始日的最大日期
    }
};
laydate(start);
laydate(end);
/*******滚动条*******/
$("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
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

</script>
