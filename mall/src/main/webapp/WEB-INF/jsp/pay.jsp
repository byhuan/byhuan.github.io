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
		<title>微信支付页</title>
	
    <link rel="stylesheet" type="text/css" href="/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="/css/pages-weixinpay.css" />
	<link rel="stylesheet" type="text/css" href="/css/jquery.alerts.css" />
	<link rel="stylesheet" type="text/css" href="/css/head.css" />
	<link rel="stylesheet" type="text/css" href="/css/common.css" />
	<script type="text/javascript" src="/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="/js/jquery.price_format.2.0.min.js"></script>
	<script type="text/javascript" src="/js/jquery.alerts.js"></script>
	<script type="text/javascript" src="/js/cookie.js"></script>
	<script type="text/javascript" src="/js/shadow.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/qrious.min.js"></script>
</head>

	<body>
		<!--页面顶部-->
		<jsp:include page="commons/header.jsp" />
		<div class="cart py-container">
			<!--logoArea-->
			<div class="logoArea">
				<div class="fl logo"><span class="title">收银台</span></div>

			</div>
			<!--主内容-->
			<div class="checkout py-container  pay">
				<div class="checkout-tit">
					<h4 class="fl tit-txt"><span class="success-icon"></span><span  class="success-info">订单提交成功，请您及时付款！订单号：${map.oid }</span></h4>
                    <span class="fr"><em class="sui-lead">应付金额：</em><em  class="orange money">￥ ${map.price }</em>元</span>
					<div class="clearfix"></div>
				</div>	
				<input type="hidden" id="url" value="${map.code_url }"/>
				<input type="hidden" id="oid" value="${map.oid }"/>	
				<input type="hidden" id="price" value="${map.price }"/>			
				<div class="checkout-steps">
					<div class="fl weixin">微信支付</div>
                    <div class="fl sao"> 
                        <p class="red"></p>                      
                        <div class="fl code">
                            <img id="qr"/>
                            <div class="saosao">
                                <p>请使用微信扫一扫</p>
                                <p>扫描二维码支付</p>
                            </div>
                        </div>
                        <div class="fl phone">
                            
                        </div>
                        
                    </div>
                    <div class="clearfix"></div>
				    <p><a href="pay.html" target="_blank">> 其他支付方式</a></p>
				</div>
			</div>

		</div>
		<!-- 底部栏位 -->
		<!--页面底部-->
<!-- footer start -->
<jsp:include page="commons/footer.jsp" />
<!-- footer end -->
<!--页面底部END-->
		
	
<script type="text/javascript" src="/js/plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="/js/plugins/jquery.easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="/js/plugins/sui/sui.min.js"></script>
<script type="text/javascript" src="/js/widget/nav.js"></script>
<script type="text/javascript">
			$(function(){
				//二维码
				var qr = new QRious({
					element:document.getElementById("qr"),
					size:280,
					value:$("#url").val()
				});
				
				//支付状态
				$.ajax({ 
					type:"POST", 
					url:"http://localhost:8888//order/queryPayStatusflag?oid="+$("#oid").val(), 
					dataType:"json",
					contentType:"application/json",               
					success : function(data){
					if(data.status == 200){
						var price = $("#price").val();						
						//支付成功
						window.location.href = "http://localhost:8888/order/sendOrderSuccess?oid="+$("#oid").val()+"&price="+price;
				   	}else if(data.status == 404){
				   		//支付失败
				   		window.location.href = "http://localhost:8888/order/sendOrderFail";
				   	}else if(data.status == 303){
				   		//超时，重新刷新二维码
				   		window.location.href = "http://localhost:8888/order/sendOrderToPay?oid="+$("#oid").val()+"&addid="+null+"&price="+price;
				   	}
					}
			}); 
				
				$("ul.payType li").click(function(){
					$(this).css("border","2px solid #E4393C").siblings().css("border-color","#ddd");
				})
			})
		</script>
</body>

</html>