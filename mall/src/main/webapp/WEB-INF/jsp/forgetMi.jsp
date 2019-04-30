<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>设置-忘记密码</title>

    <link rel="stylesheet" type="text/css" href="/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="/css/pages-seckillOrder.css" />
	<link rel="stylesheet" type="text/css" href="/css/jquery.alerts.css" />
	<link rel="stylesheet" type="text/css" href="/css/head.css" />
	<link rel="stylesheet" type="text/css" href="/css/common.css" />
	<script type="text/javascript" src="/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="/js/jquery.price_format.2.0.min.js"></script>
	<script type="text/javascript" src="/js/jquery.alerts.js"></script>
	<script type="text/javascript" src="/js/cookie.js"></script>
	<script type="text/javascript" src="/js/shadow.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
</head>

<body>

<script type="text/javascript" src="/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#service").hover(function(){
		$(".service").show();
	},function(){
		$(".service").hide();
	});
	$("#shopcar").hover(function(){
		$("#shopcarlist").show();
	},function(){
		$("#shopcarlist").hide();
	});

})
</script>
<script type="text/javascript" src="/js/plugins/jquery.easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="/js/plugins/sui/sui.min.js"></script>
<script type="text/javascript" src="/js/widget/nav.js"></script>
<jsp:include page="commons/header.jsp" />
    <!--header-->
    <div id="account">
        <div class="py-container">
            <div class="yui3-g home">
                <!--左侧列表-->
                <div class="yui3-u-1-6 list">

                    <div class="person-info">
                        <div class="person-photo"><img src="/images/img/_/photo.png" alt=""/></div>
                        <div class="person-account">
                            <span class="safe">账户安全</span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="list-items">
						<dl>
							<dt><i>·</i> 设置</dt>
							<dd><a href="home-setting-safe.html" class="list-active" >忘记密码</a></dd>
						</dl>
                    </div>
                </div>
                <!--右侧主内容-->
                <div class="yui3-u-5-6">
                    <div class="body userSafe">
                        <ul class="sui-nav nav-tabs nav-large nav-primary ">
                            <li><a href="#two" data-toggle="tab">验证手机</a></li>
                        </ul>
                        <div class="tab-content ">
                            <div id="two" class="tab-pane active">
                                <!--步骤条-->
                                <div class="sui-steps steps-auto">
                                    <div class="wrap">
                                        <div class="finished">
                                        <label><span class="round"><i class="sui-icon icon-pc-right"></i></span><span>第一步 验证手机号</span></label><i class="triangle-right-bg"></i><i class="triangle-right"></i>
                                        </div>
                                    </div>
                                    <div class="wrap">
                                        <div class="todo">
                                        <label><span class="round">2</span><span>第二步 更新新的密码</span></label><i class="triangle-right-bg"></i><i class="triangle-right"></i>
                                        </div>
                                    </div>
                                    <div class="wrap">
                                        <div class="todo">
                                        <label><span class="round">3</span><span>第三步 完成</span></label>
                                        </div>
                                    </div>
                                </div>

                                <!--表单-->

                                <form class="sui-form form-horizontal sui-validate" data-toggle='validate' id="bind-form">

                                    <div class="control-group">
                                        <label for="inputPassword" class="control-label">验证方式：</label>
                                        <div class="controls fixed">手机验证</div>                            
                                    </div>
                                     <div class="control-group">
                                        <label for="inputcode" class="control-label">手机号：</label>
                                        <div class="controls">
                                            <input name="phone" type="text" id="phone"/>
                                        </div>
                                        <div class="controls">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="inputRepassword" class="control-label">短信验证码：</label>
                                        <div class="controls">
                                            <input name="msgcode" type="text" id="msgcode"/>
                                        </div>
                                        <div class="controls">
                                            <a class="sui-btn btn-info" onclick="sendCode()">发送</a>
                                        </div>
                                    </div>
                                    <div class="control-group next-btn">
                                        <a class="sui-btn btn-primary" onclick="nextStep()">下一步</a>
                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	//发送验证码
    	function sendCode() {
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
			alert(phone);
			//发送验证码
            $.ajax({
				url : "http://localhost:8888/user/sendcode/"+phone,
            	success : function(data) {
		            if (data.status == 200) {
		            	alert(data.msg);
		            } else {
		            	showError("code","codeErr",defaultArr[7]);
		            }
		          }
			});
		}
    	//下一步
    	function nextStep() {
			//先验证input框是否为空
    		var phone = $("#phone").val();
			if(phone == null || phone == ""){
				alert("手机号不能为空");
				return;
			}
			var msg = $("#msgcode").val();
			if(msg == null || msg == ""){
				alert("验证码不能为空");
				return;
			}
			
			//再验证验证码是否正确
			$.ajax({
				url : "http://localhost:8888/user/checkcode/"+msg+"/"+phone,
            	success : function(data) {
		            if (data.status == 200) {
		           		//正确，跳转到下一步
		            	window.location.href ="http://localhost:8888/login/forgetNext/"+phone;
		            } else {
		            	showError("code","codeErr",defaultArr[7]);
		            }
		          }
			});
		}
	</script>
    <!-- 底部栏位 -->
    <!-- footer start -->
<jsp:include page="commons/footer.jsp" />
<!-- footer end -->
</body>
</html>