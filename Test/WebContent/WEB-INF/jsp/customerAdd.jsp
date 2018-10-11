<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

</head>
<body>
	<!--添加客户-->
<div id="ad_sort" class="display">
 <div class="add_style">
  <ul>
   <li class="clearfix"><label class="label_name col-xs-2">客户编号：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="customerId" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:200px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">客户名称：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cName" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:200px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">联系人：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cContacts" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:200px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">联系电话：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cPhone" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:200px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">联系地址：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cAddress" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:200px"></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">备注信息：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><textarea name="comments" class="form-control col-xs-12 col-sm-5" id="form_textarea" placeholder="" onkeyup="checkLength(this);" style="width:200px" ></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">50</span>字</span></span></li> 
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

<script type="text/javascript">
jQuery(function($){
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
})
</script>
