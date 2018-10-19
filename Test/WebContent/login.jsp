<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<link href="${pageContext.request.contextPath}/statics/css/shop.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/statics/skin/default/skin.css"
	rel="stylesheet" type="text/css" id="skin" />
<link
	href="${pageContext.request.contextPath}/statics/css/Sellerber.css"
	type="text/css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/statics/css/bkg_ui.css"
	type="text/css" rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/statics/font/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="${pageContext.request.contextPath}/statics/js/jquery-1.9.1.min.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/layer/layer.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath}/statics/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/statics/js/Sellerber.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/statics/js/shopFrame.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/statics/js/jquery.cookie.js"></script>
<title>用户登录</title>
</head>
<body class="login-layout Reg_log_style">
	<div class="logintop">
		<span>欢迎后台管理界面平台</span>
		<ul>
			<li><a href="#">返回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>
	<div class="loginbody">
		<div class="login-container">
			<div class="center">
				<img src="statics/images/logo.png" />
			</div>
			<div class="space-6"></div>
			<div class="position-relative">
				<div id="login-box" class="login-box widget-box no-border visible">
					<div class="login-main">
						<div class="clearfix">
							<div class="login_icon">
								<img
									src="${pageContext.request.contextPath}/statics/images/login_img.png" />
							</div>
							<form class=""
								style="width: 300px; float: right; margin-right: 50px;" id="form">
								<h4 class="title_name">
									<img src="statics/images/login_title.png" />
								</h4>
								<fieldset>
									<ul>
										<li class="frame_style form_error"><label
											class="user_icon"></label><input name="" type="text"
											data-name="用户名" id="username" /><i>用户名</i></li>
										<li class="frame_style form_error"><label
											class="password_icon"></label><input name="" type="password"
											data-name="密码" id="userpwd" /><i>密码</i></li>
										<li class="frame_style form_error"><label
											class="Codes_icon"></label><input name="" type="text"
											data-name="验证码" id="Codes_text" /><i>验证码</i>
											<div class="Codes_region">
												<img id="imgObj" onclick="changeImg()"
													src="${pageContext.request.contextPath}/getCode"
													width="100%" height="38px">
											</div></li>
									</ul>
									<div class="space"></div>
									<div class="clearfix">
										<label class="inline"> <input type="checkbox"
											id="remberme" class="ace"> <span class="lbl">保存密码</span></label>

										<button type="button" class="login_btn" id="login_btn"
											onclick="login()">登&nbsp;陆</button>
									</div>

									<div class="space-4"></div>
								</fieldset>
							</form>
						</div>
						<div class="social-or-login center">
							<span class="bigger-110">通知</span>
						</div>

						<div class="social-login ">
							为了更好的体验性，本网站系统不再对IE8（含IE8）以下浏览器支持，请见谅。</div>
					</div>
					<!-- /login-main -->


					<!-- /widget-body -->
				</div>
				<!-- /login-box -->
			</div>
			<!-- /position-relative -->
		</div>
	</div>
	<div class="loginbm">
		版权所有 2018 <a href=""></a>
	</div>
	<strong></strong>
</body>
</html>
<script type="text/javascript">
	//回车触发登陆
	document.getElementById("form").onkeyup = function (e) {//按键信息对象以函数参数的形式传递进来了，就是那个e
    var code =e.keyCode;  //取出按键信息中的按键代码(大部分浏览器通过keyCode属性获取按键代码，但少部分浏览器使用的却是charCode)
    if (code == 13) {
       login();
    }
}
	//图片验证码
	function changeImg() {
		var imgSrc = $("#imgObj");
		var src = imgSrc.attr("src");
		imgSrc.attr("src", chgUrl(src));
	}

	// 时间戳
	// 为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳
	function chgUrl(url) {
		var timestamp = (new Date()).valueOf();
		url = url.substring(0, 20);
		if ((url.indexOf("&") >= 0)) {
			url = url + "×tamp=" + timestamp;
		} else {
			url = url + "?timestamp=" + timestamp;
		}
		return url;
	}
	//登陆
	function login() {
		var num = 0;
		var str = "";
		$("input[type$='text'],input[type$='password']").each(function(n) {
			if ($(this).val() == "") {
				layer.alert(str += "" + $(this).attr("data-name") + "不能为空！", {
					title : '提示框',
					icon : 0,
				});
				num++;
				return false;
			}
		});
		if (num > 0) {
			return false;
		} else {
			var name = $("#username").val();
			var password = $("#userpwd").val();
			var code = $("#Codes_text").val();
			var remberme = $("#remberme").prop('checked');
			$.post(
			"${pageContext.request.contextPath}/getUserState",
			{
				"uname":name
			},function(data){
				if(data=="1"){
					$.post("${pageContext.request.contextPath}/loginUrl",
							{
								'name' : name,
								'password' : password,
								'code' : code,
								'remberme' : remberme
							},
							function(data) {
								changeImg();
								if (data == "list") {
									location.href = "${pageContext.request.contextPath}/toshops_index.html";
								} else if (data == "login") {
									location.href = "${pageContext.request.contextPath}/login.html";
								} else {
									layer.alert(data, {
										title : '提示框',
										icon : 0,
									});
								}
							});
				}else if(data=="-1"){
					layer.msg("账号错误！",{time:2000,icon:2},function(){
						window.location.reload();
					});
				}else{
					layer.msg("账号已被禁用，请联系管理员！",{time:2000,icon:2},function(){
						window.location.reload();
					});
				}
			}
			);
		}
	}
	$(document).ready(
			function() {
				$("input[type='text'],input[type='password']").blur(
						function() {
							var $el = $(this);
							var $parent = $el.parent();
							$parent.attr('class', 'frame_style').removeClass(
									' form_error');
							if ($el.val() == '') {
								$parent.attr('class', 'frame_style').addClass(
										' form_error');
							}
						});
				$("input[type='text'],input[type='password']").focus(
						function() {
							var $el = $(this);
							var $parent = $el.parent();
							$parent.attr('class', 'frame_style').removeClass(
									' form_errors');
							if ($el.val() == '') {
								$parent.attr('class', 'frame_style').addClass(
										' form_errors');
							} else {
								$parent.attr('class', 'frame_style')
										.removeClass(' form_errors');
							}
						});
			})
</script>