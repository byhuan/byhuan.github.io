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
                            <input type="hidden" id="phone" value="${user.phone }"/>
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
                                        <label><span class="round"><i class="sui-icon icon-pc-right"></i></span><span>第一步 验证身份</span></label><i class="triangle-right-bg"></i><i class="triangle-right"></i>
                                        </div>
                                    </div>
                                    <div class="wrap">
                                        <div class="current">
                                        <label><span class="round">2</span><span>第二步 绑定新手机号</span></label><i class="triangle-right-bg"></i><i class="triangle-right"></i>
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
                                        <label for="inputPassword" class="control-label">设置新密码：</label>
                                        <div class="controls fixed">请设置您的新密码</div>                            
                                    </div>
                                     <div class="control-group">
                                        <label for="inputcode" class="control-label">密码：</label>
                                        <div class="controls">
                                            <input name="pwd" type="password" id="pwd"/>
                                        </div>
                                        <div class="controls">
                                        </div>
                                    </div>
                                    <div class="control-group">
                                        <label for="inputRepassword" class="control-label">重复新密码：</label>
                                        <div class="controls">
                                            <input name="agpwd" type="password" id="agpwd"/>
                                        </div>
                                        <div class="controls">
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
    	//下一步
    	function nextStep() {
			//先验证input框是否为空
    		var pwd = $("#pwd").val();
			if(pwd == null || pwd == ""){
				return;
			}
			var agpwd = $("#agpwd").val();
			if(agpwd == null || agpwd == ""){
				return;
			}
			
			//验证两次输入密码是否一致
			if(pwd != agpwd){
				return;
			}
			
			//手机号
			var phone = $("#phone").val();
			
			//递交修改
		    window.location.href ="http://localhost:8888/login/changemi/"+pwd+"/"+phone;
		}
	</script>
    <!-- 底部栏位 -->
    <!-- footer start -->
<jsp:include page="commons/footer.jsp" />
<!-- footer end -->
</body>
</html>