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
    <title>订单详情</title>

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
<script type="text/javascript" src="/js/plugins/jquery-placeholder/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="/js/widget/nav.js"></script>

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
							<dd ><a href="http://localhost:8888/order/home-index">我的订单</a></dd>
							<dd><a href="http://localhost:8888/order/home-order-pay" >待付款</a></dd>
							<dd><a href="http://localhost:8888/order/home-order-send"  >待发货</a></dd>
							<dd><a href="http://localhost:8888/order/home-order-receive" >待收货</a></dd>
						</dl>
                    </div>
                </div>
                <!--右侧主内容-->
                <div class="yui3-u-5-6">
                    <div class="body">
                        <div class="order-detail">
                            <h4>订单详情</h4>
                            <div class="order-bar">
                                <div class="sui-steps-round steps-round-auto steps-4">
                                    <div class="finished">
                                        <div class="wrap">
                                        <div class="round">1</div>
                                        <div class="bar"></div>
                                        </div>
                                        <label>
                                            <span>提交订单</span>
                                            <span>${orderDetail.order.createTime }</span>
                                        </label>
                                    </div>
                                    <c:if test="${orderDetail.order.status !=2 }">
										<div class="todo">
	                                        <div class="wrap">
	                                        <div class="round">2</div>
	                                        <div class="bar"></div>
	                                        </div>
	                                        <label>
	                                            <span>付款成功</span>
	                                        </label>
	                                    </div>
                                    </c:if>
                                    <c:if test="${orderDetail.order.status ==2 }">
										<div class="current">
	                                        <div class="wrap">
	                                        <div class="round">2</div>
	                                        <div class="bar"></div>
	                                        </div>
	                                        <label>
	                                            <span>付款成功</span>
	                                            <span>${orderDetail.order.paymentTime }</span>
	                                        </label>
	                                    </div>
                                    </c:if>
                                    <c:if test="${orderDetail.order.status !=4 }">
                                   		<div class="todo">
	                                        <div class="wrap">
	                                        <div class="round">3</div>
	                                        <div class="bar"></div>
	                                        </div>
	                                        <label>
	                                            <span>发货</span>
	                                        </label>
	                                    </div>
                                    </c:if>
                                     <c:if test="${orderDetail.order.status ==4 }">
                                   		<div class="current">
	                                        <div class="wrap">
	                                        <div class="round">3</div>
	                                        <div class="bar"></div>
	                                        </div>
	                                        <label>
	                                            <span>发货</span>
	                                            <span>${orderDetail.order.consignTime }</span>
	                                        </label>
	                                    </div>
                                    </c:if>
                                    <c:if test="${orderDetail.order.status !=5 }">
                                    	 <div class="todo">
	                                        <div class="wrap">
	                                        <div class="round">4</div>
	                                        <div class="bar"></div>
	                                        </div>
	                                        <label>
	                                            <span>确认收货</span>
	                                        </label>
	                                    </div>
                                    </c:if>
                                    <c:if test="${orderDetail.order.status ==5 }">
                                    	 <div class="current">
	                                        <div class="wrap">
	                                        <div class="round">4</div>
	                                        <div class="bar"></div>
	                                        </div>
	                                        <label>
	                                            <span>确认收货</span>
	                                            <span>${orderDetail.order.endTime }</span>
	                                        </label>
	                                    </div>
                                    </c:if>
                                    <div class="todo last">
                                        <div class="wrap">
                                        <div class="round">5</div>
                                        </div>
                                        <label>
                                            <span>评价晒单</span>
                                           <c:if test="${orderDetail.order.status ==6 }">
                                            	<span>${orderDetail.order.closeTime }</span>
                                            </c:if>
                                        </label>
                                    </div>
                                    </div>
                            </div>
                            <div class="order-state">
                                <c:if test="${orderDetail.order.status ==1 }">
                                	<p>当前订单状态：<span class="red">未付款</span></p>
                                </c:if>
                                <c:if test="${orderDetail.order.status ==2 }">
                                	<p>当前订单状态：<span class="red">已付款</span></p>
                                	<p>还剩06天00小时 自动确认收货</p>
                                </c:if>
                                <c:if test="${orderDetail.order.status ==4 }">
                                	<p>当前订单状态：<span class="red">已发货</span></p>
                                </c:if>
                            </div>
                        </div>
                        <div class="order-info">
                            <h5>订单信息</h5>
                            <p>收货地址：${orderDetail.ship.receiverAddress }  </p>
                            <p>订单单号：${orderDetail.order.orderId }</p>
                            <p>下单时间：${orderDetail.order.createTime }</p>
                            <c:if test="${orderDetail.order.status !=1 }">
                            	<p>支付时间：${orderDetail.order.paymentTime }</p>
                           		<p>支付方式：支付宝</p>
                            </c:if>
                            <c:if test="${orderDetail.order.status ==4 }">
                            	<p>发货时间：${orderDetail.order.consignTime }</p>
                            </c:if>
                        </div>
                        <div class="order-goods">
                            <table class="sui-table">
                                    <thead>
                                        <th class="center" >商品</th>
                                        <th class="center" >价格</th>
                                        <th class="center" >数量</th>
                                        <th class="center" >优惠</th>
                                        <th class="center" >状态</th>
                                    </thead>                                   
                             
                                <tbody>                               
                                    <tr>
                                        <td colspan="5">订单编号：${orderDetail.order.orderId }</td>
                                    </tr>
                                    <c:forEach items="${orderDetail.tbOrderItemList }" var="item">
                                    	<tr>
	                                        <td>
	                                            <div class="typographic"><img src="${item.picPath }" />
	                                                    <span>${item.title }</span>
	                                            </div>
	                                        </td>
	                                        <td>
	                                            <ul class="unstyled">
	                                                    <li class="o-price">¥ ${item.price+100 }</li>	
	                                                    <li>¥ ${item.price }</li>											
	                                                </ul>
	                                        </td>
	                                        <td>${item.num }</td>
	                                        <td>无优惠</td>
	                                        <c:if test="${orderDetail.order.status ==1 }">
	                                        	<td>未付款</td>
	                                        </c:if>
	                                        <c:if test="${orderDetail.order.status ==2 }">
	                                        	<td>已付款</td>
	                                        </c:if>
	                                        <c:if test="${orderDetail.order.status ==4 }">
	                                        	<td>已发货</td>
	                                        </c:if>
	                                        <c:if test="${orderDetail.order.status ==5 }">
	                                        	<td>已收货</td>
	                                        </c:if>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="order-price">
                                <p>商品总金额：￥ ${orderDetail.order.totlePrice }</p>
                                <p>运费金额：￥  ${orderDetail.order.postFee }</p>
                                <p>使用优惠券：无</p>
                                <c:if test="${orderDetail.order.status !=1 }">
                                	<h4 class="red">实际支付：￥  ${orderDetail.order.payment }</h4>
                                </c:if>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                        <!--猜你喜欢-->
                        <div class="like-title">
                            <div class="mt">
                                <span class="fl"><strong>热卖单品</strong></span>
                            </div>
                        </div>
                        <div class="like-list">
                            <ul class="yui3-g">
                            	<c:forEach items="${itemList }" var="i">
                            		 <li class="yui3-u-1-4">
	                                    <div class="list-wrap">
	                                        <div class="p-img">
	                                            <a href="http://localhost:8888/item/${i.id }.html">
	                                            	<img src="${i.image }" />
	                                            </a>
	                                        </div>
	                                        <div class="attr">
	                                            <a href="http://localhost:8888/item/${i.id }.html">
	                                            	<em>${i.title }</em>
	                                            </a>
	                                        </div>
	                                        <div class="price">
	                                            <strong>
												<em>¥</em>
												<i>${i.price }</i>
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
</body>

</html>