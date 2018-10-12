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
<link href="${pageContext.request.contextPath }/statics/css/jquery.pagination.css" rel="stylesheet" type="text/css"/>
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath }/statics/js/jquery.cookie.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/shopFrame.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/Sellerber.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/layer/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/laydate/laydate.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath }/statics/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/jquery.dataTables.bootstrap.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/jquery.pagination.min.js"></script>

<script type="text/javascript">
	 $(function(){
		$("#del").click(function(){
				var sss = $(this).attr('value');
				if(layer.confirm("确定删除吗?")){
					$.ajax({
					type:"post",
					url:"jsp/del",
					data:{id:sss},
					dataType:"json",
					success:function(result){
						if(result>0){
							alert("删除成功");
							window.location.reload();
						}else{
							alert("删除失败");
						}
					}
				})
				}
				
			});
			
	})  
	
	
	
</script>
<title>广告分类</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<div class="margin advertising" id="page_style">
  <div class="operation clearfix">
<button class="btn button_btn btn-danger" type="button" onclick=""><i class="fa fa-trash-o"></i>&nbsp;删除</button>
<span class="submenu"><a href="javascript:void(0)" id="customerAdd" name="" onclick="add_AD_sort()" class="btn button_btn bg-deep-blue" title="添加客户"><i class="fa  fa-edit"></i>&nbsp;添加客户</a></span>
<div class="search  clearfix">
<form action="${pageContext.request.contextPath}/jsp/customerShow.html" method="post">
 <select name="cId" id="cId"  class="form-control col-xs-6"> 
						<option value="0">全部</option>
						<c:forEach var="s" items="${lists}">
							<option value="${s.id}"
								<c:if test="${s.id eq cId}">
									selected
								</c:if>
							>${s.name}</option>
						</c:forEach>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="btn button_btn bg-deep-blue " onclick="search" id="search"  type="submit"><i class="fa  fa-search"></i>&nbsp;搜索</button>
					<input type="hidden" name="customerId" id="customerId" value="${c.customerId }" />
</form>					
</div>

</div>
<!--分类管理-->
<div class="sort_list">

 <table class="table table_list table_striped table-bordered" id="sample-table">
 
  <thead>
  <tr>
  
  <th width="30"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
   <th width="100">客户编号</th>
   <th>客户名称</th> 
   <th>联系人</th>   
   <th>联系电话</th>
   <th width="180">联系地址</th>
   <th width="150">客户类型</th>
   <th width="200">操作</th>
   </tr>   
   		<c:forEach var="c" items="${pageUtils.lists }">            
   		
				<tr>
				<th><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
					<th>${c.customerId}</th>
					<th>${c.cName}</th>
					<th>${c.cContacts}</th>
					<th>${c.cPhone}</th>
					<th>${c.cAddress}</th>
					<th>${c.cTypename}</th>
					
					<th>
						<a href="javascript:;" onclick="Advert_add(this,'${c.customerId}')" class="btn bg-deep-blue  operation_btn">编辑</a> 
						<a href="javascript:;${c.customerId}" onclick="picture_del(this,'+10001+')" class="btn btn-danger operation_btn" id="del">删除</a> 
						<a href="advert_detailed_left.html" onclick="Advert_info(this,'+234+')" class="btn bg-deep-blue operation_btn">查看</a>
					</th>
				</tr>
			</c:forEach>
  </thead>
  <tbody>
   <tr>
   </tr>
    <input id="totalPage" value="${pageUtils.totalPage }" type="hidden">
    <input id="currentPage" value="${pageUtils.currentPage }" type="hidden">
  </tbody>
 </table>
 <span><span class="r">共有数据:<strong>${pageUtils.totalCount}</strong>条</span></span>
 
 	   <div class="box">
				<div id="pagination1" class="page fl"></div>
					<div class="info fl">
							<p>
								<span id="current1"></span>
							</p>
						</div>
					</div>
 	
		<script>
			$(function() {
			var a = $("#totalPage").val();
			var b = $("#currentPage").val();
				$("#pagination1").pagination(
						{
							currentPage : parseInt(b),
							totalPage : a,
							callback : function(current) {
							$("#current1").text(current);
							window.location.href = "${pageContext.request.contextPath }/jsp/customerShow.html?currentPage="
													+ current;
										}
						});
				});
			</script>
							

</div>
</div>





<!--添加客户-->
<div id="ad_sort" class="display">
 <div class="add_style" id="customerAdd">
  <ul>
   <li class="clearfix"><label class="label_name col-xs-2">客户编号：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="customerId" id="customerId" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:200px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">客户名称：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cName" id="cName" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:200px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">联系人：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cContacts" id="cContacts" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:200px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">联系电话：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cPhone" id="cPhone" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:200px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">联系地址：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cAddress" id="cAddress" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:200px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">备注信息：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><textarea name="comments" id="comments" class="form-control col-xs-12 col-sm-5" id="form_textarea" placeholder="" onkeyup="checkLength(this);" style="width:200px" ></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">50</span>字</span></span></li> 
     <li class="clearfix"><label class="label_name col-xs-2">客户类型：&nbsp;&nbsp;</label><span class="cont_style col-xs-9">
    	<select name="cId">
    			<option value="0">全部</option>
    			<c:forEach var="c" items="${lists}">
    				<option value="${c.id}">${c.name}</option>
    			</c:forEach>
    		</select> 
     </span></li>
  </ul>
 </div>
</div>



</body>
</html>
<script>
/* var dataSet=[
 ['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>','1','首页轮播图（大）','首页轮播图','4','2016-08-28 15:23:12','启用','','<a href="javascript:void()" onclick="Advert_add(this,'+102+')" class="btn bg-deep-blue  operation_btn">添加</a> <a href="javascript:void()" onclick="picture_del(this,'+10001+')" class="btn btn-danger operation_btn">删除</a> <a href="advert_detailed_left.html" onclick=Advert_info(this,'+234+')" class="btn bg-deep-blue operation_btn">查看</a>'],
	 ['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>','1','首页轮播图（大）','首页轮播图','4','2016-08-28 15:23:12','启用','','<a href="javascript:void()" onclick="Advert_add(this,'+102+')" class="btn bg-deep-blue  operation_btn">添加</a> <a href="javascript:void()" onclick="picture_del(this,'+10001+')" class="btn btn-danger operation_btn">删除</a> <a href="advert_detailed_left.html" onclick=Advert_info(this,'+234+')" class="btn bg-deep-blue operation_btn">查看</a>'],
	 ['<label><input type="checkbox" class="ace"><span class="lbl"></span></label>','1','首页轮播图（大）','首页轮播图','4','2016-08-28 15:23:12','启用','','<a href="javascript:void()" onclick="Advert_add(this,'+102+')" class="btn bg-deep-blue  operation_btn">添加</a> <a href="javascript:void()" onclick="picture_del(this,'+10001+')" class="btn btn-danger operation_btn">删除</a> <a href="advert_detailed_left.html" onclick=Advert_info(this,'+234+')" class="btn bg-deep-blue operation_btn">查看</a>'],
 ]; */

	
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
	/*客户-删除*/
 /* function picture_del(obj,id){
	layer.confirm('确认要删除吗？',{icon:0,},function(index){
		if(id!=""){
			$.post("jsp/delete?id="+id,null,function(data){
				if(data == "ok"){
					layer.msg('已删除!',{
						icon : 1,
						time : 1000
					},function(){
						window.location.reload();
					});
				}else if(data == "error"){
					layer.alert('删除失败!', {icon: 2});
					return ;
				}
			},"text");
		}
		/* $(obj).parents("tr").remove();
		layer.msg('已删除!',{icon:1,time:1000}); 
	});
}  */
	
	

/*****编辑客户信息******/  
 function Advert_add(obj ,id){
	layer.open({
        type: 2,
        title: '编辑客户信息',
		maxmin: true, 
		shadeClose: false, //点击遮罩关闭层
        area : ['700px' , '520px'],
        content:"${pageContext.request.contextPath}/jsp/doupdate.html?customerId="+id
    });	
} 
/***************添加客户***********/
   function add_AD_sort( ){
	  layer.open({
		url: "",
        type: 1,
        title: '添加客户',
		maxmin: false, 
		shadeClose: false, //点击遮罩关闭层
        area : ['600px' , ''],
        content:$('#ad_sort'),
		btn:['添加','取消'],
			yes:function(index,layero){	
		 var num=0;
		 var str="";
		  $("#customerAdd input[type$='text']").each(function(n){
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
        	  var customerId = $("#customerId").val();
        	  var cName = $("#cName").val();
        	  var cContacts = $("#cContacts").val();
        	  var cPhone = $("#cPhone").val();
        	  var cAddress = $("#cAddress").val();
        	  var cId = $("#cId").val();
        	  var comments = $("#comments").val();
        	  $.ajax({
        		  type:"post",
        		  url:"${pageContext.request.contextPath}/jsp/doadd",
        		  data:{customerId:customerId,cName:cName,cContacts:cContacts,cPhone:cPhone,
        			  cAddress:cAddress,cId:cId,comments:comments},
        			  dataType:"json",
        			  success:function(data){		
        				  if(data.result>0){
        					  layer.alert('添加成功！',{
        			               title: '提示框',				
        								icon:1,		
        						  });  
        				  }else{
        					  layer.alert('添加失败！',{
       			               	title: '提示框',				
       							icon:1,		
       						  });
        				  }
        				  layer.close(index);
        			  }
        	  })
			  
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
	var maxChars = 50; //
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
