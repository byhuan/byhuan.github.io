<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=9; IE=8; IE=7; IE=EDGE"/>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <title>待付款</title>

    <link rel="stylesheet" type="text/css" href="/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="/css/pages-seckillOrder.css" />
	<script type="text/javascript" src="/js/plugins/jquery.easing/jquery.easing.min.js"></script>
	<script type="text/javascript" src="/js/plugins/sui/sui.min.js"></script>
	<script type="text/javascript" src="/js/plugins/jquery-placeholder/jquery.placeholder.min.js"></script>
	<script type="text/javascript" src="/js/widget/nav.js"></script>
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
    <!-- 头部栏位 -->
    <!--页面顶部-->
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
                            <span class="name">${user.username }</span>
                            <span class="safe">账户安全</span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                     <div class="list-items">
                        <dl>
							<dt><i>·</i> 订单中心</dt>
							<dd><a href="http://localhost:8888/order/home-index">我的订单</a></dd>
							<dd><a href="http://localhost:8888/order/home-order-pay" class="list-active">待付款</a></dd>
							<dd><a href="http://localhost:8888/order/home-order-send" >待发货</a></dd>
							<dd><a href="http://localhost:8888/order/home-order-receive" >待收货</a></dd>
						</dl>
                    </div>
                </div>
                <!--右侧主内容-->
                <div class="yui3-u-5-6 order-pay">
                    <div class="body">
                        <div class="table-title">
                            <table class="sui-table  order-table">
                                <tr>
                                    <thead>
                                        <th width="35%">宝贝</th>
                                        <th width="5%">单价</th>
                                        <th width="5%">数量</th>
                                        <th width="8%">商品操作</th>
                                        <th width="10%">实付款</th>
                                        <th width="10%">交易状态</th>
                                        <th width="10%">交易操作</th>
                                    </thead>
                                </tr>
                            </table>
                        </div>

                        <div class="order-detail">
                            <div class="orders">
                                <div class="choose-title">
                                    <label >
                                           <span id="nowTime"></span>
                                     </label>
                                </div>
                                    	<c:forEach items="${orderPageInfo }" var="order">
                                    		 <table>
                                   			 <tbody>
                                   			 <c:forEach items="${order.itemList }" var="item" varStatus="status">
                                    		<tr>
	                                            <td width="35%">
	                                                <div class="typographic"><img src="${item.picPath }" />
	                                                    <a href="#" class="block-text">${item.title }</a>
	                                                </div>
	                                            </td>
	                                            <td width="5%" class="center">
	                                                <ul class="unstyled">
	                                                    <li class="o-price">${item.price }</li>
	                                                    <li>${item.price }</li>
	                                                </ul>
	                                            </td>
	                                            <td width="5%" class="center">${item.num }</td>
	                                            <td width="8%" class="center"></td>
	                                            <c:if test="${status.index == 0 }">
	                                            	<td width="10%" class="center" rowspan="${fn:length(order.itemList)}">
		                                                <ul class="unstyled">
		                                                    <li>${order.totlePrice }</li>
		                                                    <li>（含运费：￥0.00）</li>
		                                                </ul>
		                                            </td>
		                                            <td width="10%" class="center" rowspan="${fn:length(order.itemList)}">
		                                                <ul class="unstyled">
		                                                    <li>等待买家付款</li>
		                                                    <li><a href="http://localhost:8888/order/detail/${item.orderId }" class="btn">订单详情 </a></li>
		                                                </ul>
		                                            </td>
		                                            <td width="10%" class="center" rowspan="${fn:length(order.itemList)}">
		                                                <ul class="unstyled">
		                                                    <li><a onclick="pay(${item.orderId },${order.totlePrice })" class="sui-btn btn-info">立即付款</a></li>
		                                                    <li><a href="http://localhost:8888/order/delOrder/${item.orderId }">取消订单</a></li>
		                                                </ul>
		                                            </td>
	                                            </c:if>
	                                        </tr>
	                                        </c:forEach>
	                                        </tbody>
                                		</table>
                                    	</c:forEach>
                            </div>

                            <div class="choose-order">
                                <label data-toggle="checkbox" class="checkbox-pretty checked">
                                        <input type="checkbox" checked="checked"><span>全选</span>
                                    </label>
                                 <a href="" class="sui-btn btn-info btn-bordered hepay-btn">合并付款</a>
                            </div>

                            <div class="clearfix"></div>
                        </div>

                        <div class="like-title">
                            <div class="mt">
                                <span class="fl"><strong>热卖单品</strong></span>
                            </div>
                        </div>
                        <div class="like-list">
                            <ul class="yui3-g">
                            	<c:forEach items="${itemList }" var="mai">
                            		 <li class="yui3-u-1-4">
	                                    <div class="list-wrap">
	                                        <div class="p-img">
	                                        	<a href="http://localhost:8888/item/${mai.id }.html">
	                                            	<img src="${mai.image }" />
	                                            </a>
	                                        </div>
	                                        <div class="attr">
	                                            <a href="http://localhost:8888/item/${mai.id }.html"><em>${mai.title }</em></a>
	                                        </div>
	                                        <div class="price">
	                                            <strong>
												<em>¥</em>
												<i>${mai.price }</i>
											</strong>
	                                        </div>
	                                        <div class="commit">
	                                            <i class="command">已有6人评价</i>
	                                        </div>
	                                    </div>
                                	</li>
                            	</c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 底部栏位 -->
    <!--页面底部-->
<!-- footer start -->
<jsp:include page="commons/footer.jsp" />
<!-- footer end -->

<script type="text/javascript">
	//显示当前时间
	setInterval("document.getElementById('nowTime').innerHTML=new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);

	function pay(oid,price) {
		window.location.href ="http://localhost:8888/order/sendOrderToPay?oid="+oid+"&price="+price;
	}
</script>

</body>
</html>