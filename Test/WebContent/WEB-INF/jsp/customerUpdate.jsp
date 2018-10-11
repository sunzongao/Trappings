<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<!--编辑客户信息-->
<div id="Advert_add_style" class="Advert_add_style padding display" >
 <div class="add_style">
 <ul>
  <li class="clearfix"><label class="label_name col-xs-2">客户编号：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="customerId" value="${customer.customerId}" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:450px"></span></li>
  <li class="clearfix"><label class="label_name col-xs-2">客户名称：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cName" value="${customer.cName}" type="text" id="form-field-1"  class="col-xs-10 col-sm-5" style="width:450px"></span></li>
  <li class="clearfix"><label class="label_name col-xs-2">联系人：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cContacts" value="${customer.cContacts}" type="text" id="form-field-1"  class="col-xs-10 col-sm-5" style="width:450px"></span></li>
  <li class="clearfix"><label class="label_name col-xs-2">联系电话：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cPhone" value="${customer.cPhone}" type="text" id="form-field-1"  class="col-xs-10 col-sm-5" style="width:450px"></span></li>
  <li class="clearfix"><label class="label_name col-xs-2">联系地址：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="cAddress" value="${customer.cAddress}" type="text" id="form-field-1"  class="col-xs-10 col-sm-5" style="width:450px"></span></li>
  
  
  <li class="clearfix"><label class="label_name col-xs-2">客户类型：&nbsp;&nbsp;</label><span class="cont_style col-xs-9">
     <select name="cId" id="form-field-1"  class="col-xs-10 col-sm-5" style="width:450px">
     	<option value="0">全部</option>
     	<c:forEach var="cc" items="${lists}">
     		<option value="cc.id" 
     			<c:if test="${cc.id eq customer.cId}">
     				selected
     			</c:if>
     		>${cc.name }</option>
     	</c:forEach>
     </select>  
  </span></li>
  
   <li class="clearfix"><label class="label_name col-xs-2">备注信息：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><textarea name="comments" id="comments" value="${customer.comments }" class="form-control col-xs-12 col-sm-5" id="form_textarea" placeholder="" onkeyup="checkLength(this);" style="width:200px" ></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">50</span>字</span></span></li>
   
     <!-- <li class="clearfix">
     <label class="label_name col-xs-2">设置时间：&nbsp;&nbsp;</label> 
    <div class="Add_content col-xs-9">
    <label class="l_f checkbox_time"><input type="checkbox" name="checkbox" class="ace" id="checkbox"><span class="lbl">是</span></label>
    <div class="Date_selection" style="display:none">
      <span class="label_name">开始日：</span><p class="laydate-icon" id="start" style="width:160px; margin-right:10px; height:30px; line-height:30px; float:left"></p>
      <span class="label_name">结束日：</span><p class="laydate-icon" id="end" style="width:160px;height:30px; line-height:30px; float:left"></p>
    </div>
    </div>   
    </li> -->
     <!-- <li class="clearfix"><label class="label_name col-xs-2">图&nbsp;&nbsp;片：&nbsp;&nbsp;</label>
     <span class="cont_style col-xs-9">        
       <div id="preview" class="preview_img"><img id="imghead" border="0" src="images/image.png" /></div>
       <div class="fileInput ">
        <input type="file" onchange="previewImage(this)" name="upfile" id="upfile" class="upfile"/>
        <input class="upFileBtn" type="button" value="上传图片" onclick="document.getElementById('upfile').click()" />
        </div>
      </span>
  </li> -->
 </ul>
 </div>
</div>
</body>
</html>