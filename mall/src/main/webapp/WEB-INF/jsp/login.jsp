<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>登录</title>
       <link rel="stylesheet" type="text/css" href="/css/jquery.alerts.css" />
<link rel="stylesheet" type="text/css" href="/css/headerfooterindex.css" />
<link rel="stylesheet" type="text/css" href="/css/login.css" />
<script type="text/javascript" src="/js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/jquery.alerts.js"></script>
<script type="text/javascript" src="/js/png.js"></script>
<script type="text/javascript" src="/js/cas.login.js"></script>
<script type="text/javascript" src="/js/capsLock.js"></script>
</head>
<body>
	<!-- header -->
	<div class="header">
		<a href="http://www.e3mall.cn"><img src="/images/logo.png" border="0"><span>欢迎登录</span></a>
	</div>
	<!-- login_main -->
	<div class="login_main clear">
		<div class="pic">
			<a href="http://www.e3mall.cn/html/activity/1472720729.html" target="_blank"><img src="/images/06f42c372620f92b40da77a8b23cdf7f.png"></a>
		</div>
		<!-- login -->
		<div class="login">
			<div class="login_header">
    	<span>您还未登录</span>
    	<a href="/page/register">免费注册</a>
    </div>

			<div class="login_box clear">
				<ul class="loginnav">
					<li class="curr" mark="sfbest"><em></em>优选账号</li>
				</ul>

				<div class="logincon">
					<ul>
					<form id="formlogin" method="post" >
						<div style="display:none;">
              					 
       						 </div>
						<li style="display:none;"><span class="title">BGCode</span>
						    <span class="border">
						     <input type="hidden" name="bgcode" id="bgcode" value="sfbest" class="loginText">
						        <em class="icon1" id="bgcode_em"></em>
							
							</span>
						    <span id="uNameErr"></span>
						</li>
						<li><span class="title">手机/验证邮箱/用户名<font style="padding-left:20px" class="error_line" color="#ff0000"></font></span>
						    <span class="border" style="position:relative">
						<input id="username" name="username" type="hidden" accesskey="n" value="" size="25" autocomplete="off">
						<input class="new-input1 new-color" tabindex="1" data-clear-btn="true" id="loginname" size="25" autocomplete="off" htmlescape="true" title="请输入用户名">
		
						
						     <em class="icon1" id="usernamelogo"></em>
						<span style="position: absolute; font-size: 14px; left: 5px; top: 9px;display:none;" class="sfbest_username_place">请输入手机号/邮箱/用户名</span>
							</span>
						    <span id="sfbestNameErr"></span>
							
							
						</li>
						
						<li class="m-t12">
							<span class="title">登录密码</span> 
							<span class="border" style="position:relative">
								<input id="password" name="password" class="required" tabindex="2" type="password" value="" autocomplete="off">
							    <em class="icon2" id="passwordlogo"></em>
						<span style="position: absolute; font-size: 14px; left: 5px; top: 9px;display:none;" class="sfbest_password_place">密码</span>
							</span> 
							<span id="sfbestPwdErr"></span>
						</li>
						<div class="clear"></div>
						<li>
							<div style="width: 65px; margin-left: 260px;">
								<a href="http://localhost:8888/login/forget" class="forget-passWord">忘记密码?</a>
							</div>
						</li>
						<li class="m-t5" id="btn_sub">
							
							<a href="javascript:void(0)" id="login_sub" class="login_btn">登录</a>
						</li>
					<div>
</div></form>
					</ul>
				</div>


				<ul class="blink">
					<li class="p-f10">
					</li>
				</ul>
			</div>
		</div>
		<!-- /login -->
	</div>
	<!-- /login_main -->
	<div class="footer">
		<span> <a href="http://www.e3mall.cn/www/379/5109.html" rel="nofollow" class="footerlink1">关于我们</a> | <a href="http://www.e3mall.cn/www/380/5116.html" rel="nofollow" class="footerlink1">联系我们</a> | <a href="http://www.e3mall.cn/www/381/5117.html" rel="nofollow" class="footerlink1">招聘人才</a> | <a href="http://www.e3mall.cn/www/330/2705.html" rel="nofollow" class="footerlink1">友情链接</a> | <a href="http://supplier.e3mall.cn/supplierApply" rel="nofollow" class="footerlink1">供应商申请</a>
		</span>
		<p>
			河南理工大学<br> <a href="http://www.hpu.cn" target="_blank" rel="nofollow" class="footerlink1">京ICP备12011349号</a>|<a href="http://www.e3mall.cn/www/174/461.html" target="_blank" rel="nofollow" class="footerlink1"></a><br> Copyright© 理工大商城
			 liu版权所有<br>
		</p>
	</div>
	<!-- /footer -->
	<script type="text/javascript">
	var redirectUrl = "${redirect}";
	var LOGIN = {
			checkInput:function() {
				$("#sfbestNameErr").attr("class", "").html("").prev().attr("class", "border");
				$("#sfbestPwdErr").attr("class", "").html("").prev().attr("class", "border");
				
				if(!$("#formlogin #loginname").val()) {
					$("#sfbestNameErr").attr("class", "error").show().html("请输入用户名").prev().attr("class", "border-error");
					return false;
				}
				if(!$("#formlogin input[name='password']").val()) {
				    $("#sfbestPwdErr").attr("class", "error").show().html("请输入密码").prev().attr("class", "border-error");
			        return false;
				}
				$("#username").val($("#loginname").val());
				return true;
			},
			doLogin:function() {
				$.post("/user/login", $("#formlogin").serialize(),function(data){
					if (data.status == 200) {
						jAlert('登录成功！',"提示", function(){
							if (redirectUrl == "") {
								location.href = "http://localhost:8888/index";
							} else {
								location.href = redirectUrl;
							}
						});
						
					} else {
						jAlert("登录失败，原因是：" + data.msg,"失败");
					}
				});
			},
			login:function() {
				if (this.checkInput()) {
					this.doLogin();
				}
			}
		
	};
	$(function(){
		$("#login_sub").click(function(){
			LOGIN.login();
		});
	});
</script>

</html>