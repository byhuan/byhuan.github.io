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
		<title>支付页-失败</title>
		<link rel="icon" href="/assets/img/favicon.ico"/>
		
	
    <link rel="stylesheet" type="text/css" href="/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="/css/pages-payfail.css" />
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
		<!--head-->
		<!--页面顶部-->
		<jsp:include page="commons/header.jsp" />
		<div class="cart py-container">
			<!--logoArea-->
			<div class="logoArea">
				<div class="fl logo"><span class="title">支付页</span></div>
			</div>
			<!--主内容-->
			<div class="payfail">
				<div class="fail">
					<h3><img src="/images/img/_/fail.png" width="48" height="48"/>　支付失败，请稍后再试</h3>
					<div class="fail-text">
					<p>失败原因：未成功付款！</p>
					<p>您可以先去　<a href="http://localhost:8888/index" target="_blank">品优购首页</a>　逛逛</p>
				    </div>
				</div>
				
			</div>
		</div>
		<!-- 底部栏位 -->
		<!--页面底部-->
<!-- footer start -->
<jsp:include page="commons/footer.jsp" />
<!-- footer end -->
		
		
	
<script type="text/javascript" src="/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="/js/plugins/sui/sui.min.js"></script>
<script type="text/javascript" src="components/ui-modules/nav/nav-portal-top.js"></script>
</body>

</html>