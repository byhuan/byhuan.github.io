<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="pragma" content="no-cache"/>
    <meta http-equiv="Cache-Control" content="no-cache,must-revalidate"/>
    <title>注册-个人用户</title>
    <link rel="stylesheet" type="text/css" href="/css/headerfooter.css" />
<link rel="stylesheet" type="text/css" href="/css/jquery.alerts.css" />
<link rel="stylesheet" type="text/css" href="/css/headerfooterindex.css" />
<script type="text/javascript" src="/js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/js/passport.common.js?v20140531"></script>
<script type="text/javascript" src="/js/jquery.alerts.js"></script>
<script type="text/javascript" src="/js/png.js?v20140521"></script>
<link rel="stylesheet" type="text/css" href="/css/login.css" />
<link rel="stylesheet" type="text/css" href="/css/reg.css" />
<script type="text/javascript" src="/js/allMail.js"></script>
<script type="text/javascript" src="/js/reg.js"></script>
</head>
<body>
		<!-- header -->
		<div class="header">
			<a href="${pageContext.request.contextPath}/index"><img src="/images/logo.png" border="0" /><span>欢迎注册</span></a>
		</div>
<!-- reg_main -->
<div class="tabBox clear">
    <div class="login">已有账号，立即 <a href="/page/login">登录</a></div>
</div>
<!--个人用户-->
<div class="reg_main reg_border regTab" id="perDiv">
    <ul class="individualUserBg">
        <form id="regForm_mod" name="regForm_mod" method="post" >

            <li class="regMb30">
                <label><font>*</font> 账户名：</label>
            <span class="regM defaultBorder">
            	<input id="regName" name="username"  class="regInput" type="text" onkeyup="mail_div(event);" onfocus="showtip('regName','userMamErr',8);" onblur="$('#userMamErr').html('')" autocomplete="off" maxlength="80"/>
				<em></em>
            </span>
                <span class="regInput" id="userMamErr"></span>
            </li>
            <div node-type="layer" class="accountSearch" style="display:none;" id="person_mail"></div>
            <li>
                <label><font>*</font> 登录密码：</label>
            <span class="regM defaultBorder">
            	<input id="pwd" name="password" class="regInput" autocomplete="off" type="password" onfocus="showPwdtip('password','passwordErr',2);"  onkeyup="ckpwd(0,1);" onblur="ckpwd(0,0);"/>
            	<em ></em>
            </span>
                <span class="regInput" id="passwordErr"></span>
            </li>
            <li class="safetyLayer regPl191" id="pwdStrong">
                <font style="font-size:12px;">安全程度：</font><em class="default" id="low">弱</em><em class="default" id="middle">中</em><em class="default" id="strong">强</em>
            </li>

            <li class="regMb30">
                <label><font>*</font> 确认密码：</label>
            <span class="regM defaultBorder">
            	<input id="pwdRepeat" name="password2" autocomplete="off" class="regInput" type="password" onfocus="showtip('password2','password2Err',3);" onblur="ckpwd2();"/>
            	<em></em>
            </span>
                <span class="regInput" id="password2Err"></span>
            </li>
            <li class="regMb30">
                <label><font>*</font> 验证手机：</label>
            <span class="regM defaultBorder">
            	<input id="phone" name="phone" autocomplete="off" class="regInput" type="text" maxlength="11" onfocus="showtip('phone','phoneErr',1);" onblur="$('#phoneErr').html('')"/>
            	<em></em>
            </span>
                <span class="regInput" id="phoneErr"></span>
            </li>
            
            <li style="margin-left:329px">
                <a href="javascript:void(0)" onclick="sendcode()">发送验证码</a>
            </li>
 
            <li>
                <label><font>*</font> 验证码：</label>
                <span class="regM defaultBorder">
            		<input id="code" name="code" type="text" autocomplete="off" class="regInput" maxlength="11" onfocus="showtip('code','codeErr',4);"/>
           			<em></em>
           		</span>
           		<span class="regInput" id="codeErr"></span>
            </li>


            <li class="regPl88">
			<span  class="regM" style="margin-left:29px">
				<input id="AgreeId" name="AgreeId" type="checkbox" checked="" onclick="ckAgree();">
				<a href="#" target="_blank"  class="checkTitle">我已阅读并同意<font style="font-size:12px;">《自营商城用户注册协议》</font></a>
			</span>
                <span  id="AgreeIdErr" ></span>
            </li>
            <li class="register regPl88 regMt10" id="sub_per" style="margin-left:29px">
                <input type="hidden" id="tjuid" name="tjuid" value="">
                <a href="javascript:void(0);" class="registerNow" id="reg_per_data" onclick="REGISTER.reg()">立即注册</a>
            </li>
            <br /><br />
        </form>
    </ul>
    <div class="ui-reg-tip"><a href="#" target="_blank">了解更多>></a></div>
</div>

<!--mainOver-->

		<!--footerStart-->
		<div class="footer">
			<span>
				<a href="http://www.e3mall.cn/www/379/5109.html" rel="nofollow" class="footerlink1">关于我们</a> | 
				<a href="http://www.e3mall.cn/www/380/5116.html" rel="nofollow" class="footerlink1">联系我们</a> | 
				<a href="http://www.e3mall.cn/www/381/5117.html" rel="nofollow" class="footerlink1">招聘人才</a> | 
				<a href="http://www.e3mall.cn/www/330/2705.html" rel="nofollow" class="footerlink1">友情链接</a> | 
			</span>
			<p>
			河南理工大学<br> <a href="http://www.hpu.cn" target="_blank" rel="nofollow" class="footerlink1">京ICP备12011349号</a>|<a href="http://www.e3mall.cn/www/174/461.html" target="_blank" rel="nofollow" class="footerlink1"></a><br> Copyright© 理工大商城
			 liu版权所有<br>
			</p>
		</div>
		<!-- /footer -->
		
<script type="text/javascript">
		//发送验证码
		function sendcode(){
			
			var phone = $("#phone").val();
			if(phone == null || phone == ""){
				return;
			}
			//检查手机号符不符规则
			var preg= /^0[1-9][0-9]{1,2}-[0-9]{7,8}$/;
			var string = $.trim(phone);
			if(preg.test(string)){
				//不符合就结束
				return;
			}
			
			//检查手机号是否已经存在
			$.ajax({
				url : REGISTER.param.surl + "/user/check/"+$("#phone").val()+"/2?r=" + Math.random(),
            	success : function(data) {
            		if (data.data) {
            			//如果手机号没有被占用，发送验证码
            			$.ajax({
							url : REGISTER.param.surl + "/user/sendcode/"+$("#phone").val(),
            				success : function(data) {
		            		if (data.status == 200) {
		            			alert(data.msg);
		            		} else {
		            			showError("code","codeErr",defaultArr[7]);
		            		}
		            	}
					});
            		} else {
            			showError("phone","phoneErr",defaultArr[9]);
            		}
            	}
			});
		}
		//判断密码强度
		$("#pwd").blur(function(){	
			  var str = $("#pwd").val();
	        	if(str.length < 8){
	        		if(str.length == 0){
	        			$("#low").css("color","white");
		        		$("#middle").css("color","white");
		        		$("#strong").css("color","white");
	        		}
	        		$("#low").css("color","red");
	        		$("#middle").css("color","white");
	        		$("#strong").css("color","white");
	        	}else if(str.length < 14){
	        		$("#low").css("color","white");
	        		$("#middle").css("color","red");
	        		$("#strong").css("color","white");
	        	}else{
	        		$("#low").css("color","white");
	        		$("#middle").css("color","white");
	        		$("#strong").css("color","red");
	        	}
			});
</script>
<script type="text/javascript">
	var REGISTER={
		param:{
			surl:""
		},
		inputcheck:function(){
			var flag = true;
			//不能为空检查
			if ($("#regName").val() == "") {
				showError("regName","userMamErr",defaultArr[8]);
				flag = false;
			}
			if ($("#pwd").val() == "") {
				showError("pwd","passwordErr",pwdArr[0]);
				flag = false;
			}
			if ($("#phone").val() == "") {
				showError("phone","phoneErr",memArr[0]);
				flag = false;
			}
			if($("#code").val() == ""){
				showError("code","codeErr",codeArr[1]);
			}
			
			//密码检查
			if ($("#pwd").val() != $("#pwdRepeat").val()) {
				showError("pwdRepeat","password2Err",pwd2Arr[1]);
				flag = false;
			}
			return flag;
		},
		beforeSubmit:function() {
				//检查用户是否已经被占用
				$.ajax({
	            	url : REGISTER.param.surl + "/user/check/"+escape($("#regName").val())+"/1?r=" + Math.random(),
	            	success : function(data) {
	            		if (data.data) {
	            			//发送验证码时已经检查过手机号是否存在
	            			//这里需要的是比对验证码是否正确
	            			$.ajax({
	            				url : REGISTER.param.surl + "/user/checkcode/"+$("#code").val()+"/"+$("#phone").val(),
				            	success : function(data) {
				            		if (data.status == 200) {
					            		REGISTER.doSubmit();
				            		} else if(data.status == 500){
				            			showError("code","codeErr",mcodeArr[1]);
				            		}else if(data.status == 400){
				            			showError("code","codeErr",dmArr[0]);
				            		}
				            	}
	            			});
	            		} else {
	            			showError("regName","userMamErr",defaultArr[10]);
	            		}	
	            	}
				});
	            	
		},
		doSubmit:function() {
			$.post("/user/register",$("#regForm_mod").serialize(), function(data){
				if(data.status == 200){
					jAlert('用户注册成功，请登录！',"提示", function(){
						REGISTER.login();
					});
				} else {
					jAlert("注册失败！","提示");
				}
			});
		},
		login:function() {
			 location.href = "/page/login";
			 return false;
		},
		reg:function() {
			if (this.inputcheck()) {
				this.beforeSubmit();
			}
		}
	};
</script>
	</body>
</html>
