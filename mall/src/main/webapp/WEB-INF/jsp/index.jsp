<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="Cache-Control" content="no-transform">
	<meta http-equiv="Cache-Control" content="no-siteapp">
    <title>自营商城--食品、营养保健品、粮油、酒水饮料、休闲食品-自营网上商城</title>
    <meta name="Keywords" content="进口食品,网上超市,网上购物,粮油,酒水,休闲食品">
    <meta name="Description" content="自营商城，精选来食品，正品行货，支持货到付款。销售包括营养保健品、生鲜食品、粮油、酒水、休闲食品等近万种商品。">
    <meta property="wb:webmaster" content="3a008ad947166307">
    <link rel="stylesheet" type="text/css" href="/css/base_w1200.css">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
	<script type="text/javascript" src="/js/jquery-1.5.1.min.js"></script>
	<script type="text/javascript" src="/js/global_index.js"></script>
<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
.en-markup-crop-options {
    top: 18px !important;
    left: 50% !important;
    margin-left: -100px !important;
    width: 200px !important;
    border: 2px rgba(255,255,255,.38) solid !important;
    border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
    margin-left: 0px !important;
}
</style></head>
<body>
<!-- header start -->
<jsp:include page="commons/header.jsp" />
<!--  -->
<jsp:include page="commons/mainmenu.jsp" />

<!-- header end -->
<!----row1------->
<div class="slide_show" id="slide_show">
	<div class="indexW">
      <div id="index_slide" class="slide_wrap">
		<ol>
		 
			<c:forEach items="${ad1List}" var="node" varStatus="status">
			<li>
			  <a name="sfbest_hp_hp_focus_${status.index }" class="fore_pic trackref" href="${node.url }" target="_blank"> 
				<img id="lunbo_1" alt="${node.title }"	src="${node.pic }">
			  </a>
			</li>
			</c:forEach>
		</ol>
	</div>      
 	</div>
      <ul class="none" id="lunboNum">
      			<c:forEach items="${ad1List }" varStatus="status">
      			<li class="<c:if test="${status.index==0 }">cur</c:if>">${status.index+1 }</li>
      			</c:forEach>
		      </ul>
    </div>
<!----row1 end------->
<!-- 口碑甄选 start -->
<div class="indexW mt1">
	<div class="bestbuy">
	<div class="b_left">
	<h2>优选必买<span></span></h2>
				<ul class="bbig" id="bigPerfect">
				<c:forEach items="${itemList }" var="item">
					<li class="price_list0" goods="215383" eid="b_215383_0"
						id="cx_b_215383_0"><a
						href="http://localhost:8888/item/${item.id }"
						title="${item.title }" target="_blank"><img class="lazy"
							src="${item.image }"
							style="display: inline;padding:16px"></a>
					<div class="gBtn p-btn bbtn" style="top: 260px;">
							<a pid="215383"
								data_url="http://p02.e3mall.cn/2016/1800215383/middle_1800215383_1_1/160x160.jpg"
								href="${pageContext.request.contextPath }/cart/add/${item.id}" indexflag="1">加入购物车</a>
						</div>
						<div class="bprice" id="priceK_b_215383_0">
							<span><sup>￥</sup></span>${item.price }
						</div></li>
				</c:forEach>
				</ul>
			</div>   
	<!-- 口碑甄选 end --> 
	<div class="rSide1">
			
    	<div class="rImg2">
      	<a name="sfbest_hp_hp_news_right-ad" class="trackref" href="/html/activity/1472464260.html" target="_blank"><img salt="9.2-9.5" src="/images/goods/751d2091c008c2a49c1934545730f041.jpg"></a>
   		</div>
		 
        <div class="sfNews">
          <div class="rTitle"><h2>最新动态</h2></div>
          <ul>
		              <li><a name="sfbest_hp_hp_news_1" href="/www/173/8531.html" target="_blank" class=" red trackref" title="受杭州G20峰会影响的配送问题公告">受杭州G20峰会影响的配送问题公告</a></li>
		              <li><a name="sfbest_hp_hp_news_2" href="/www/173/8449.html" target="_blank" class=" trackref" title="购买燕麦片满49元抽奖活动中奖公告">购买燕麦片满49元抽奖活动中奖公告</a></li>
		              <li><a name="sfbest_hp_hp_news_3" href="/www/173/8447.html" target="_blank" class=" trackref" title="满299抽iPhone6s活动中奖公告">满299抽iPhone6s活动中奖公告</a></li>
		              <li><a name="sfbest_hp_hp_news_4" href="/www/173/8445.html" target="_blank" class=" trackref" title="《珍膳米，带你冲上云霄》活动中奖名单公布">《珍膳米，带你冲上云霄》活动中奖名单公布</a></li>
		            </ul>
        </div>
    </div>
	</div>
	<div class="clr"></div>
</div>
<!--楼层 start-->
<div class="indexW mt2 full_ad" style="width:1190px;padding-left:10px;"><a name="sfbest_hp_hp_banner_1" class="trackref" href="/html/activity/1472461333.html" target="_blank"><img alt="8.30-9.5" class="lazy" 
 src="/images/goods/8f42d6d2deead3da7d50c8a702a3c939.jpg" style="display: inline;"></a>
 </div>
<div class="indexW mt2 ie6 fresh" style="text-align: center;margin-left:120px;">
<c:forEach items="${hotItemList }" var="hot">
    <div class="category">
    		<ul class="mTitle">
				<li>
					<div class="cir"></div>
					<h2>
						<em></em>
						<c:if test="${hot.cid ==560 }">
							<a name="sfbest_hp_hp_floor1_floor-category1" class="trackref" href="/fresh/52-0-0-0-0-2-0-0-0-0-0.html" target="_blank">水果</a>&nbsp;&nbsp;<a name="sfbest_hp_hp_floor1_floor-category2" class="trackref" href="/fresh/55-0-0-0-0-2-0-0-0-0-0.html" target="_blank">蔬菜</a>
						</c:if>
					</h2>
				</li>
			</ul>
			<div class="lCont">
				<a name="sfbest_hp_hp_floor1_left-ad" class="trackref" href="/html/activity/1472459562.html" target="_blank">
					<img alt="8.30-9.5" class="lazy" src="${hot.image }" style="display: inline;">
				</a>
			</div>
	 </div>
	 </c:forEach>
</div>
<!--楼层 end -->

<!-- footer start -->
<jsp:include page="commons/footer.jsp" />
<!-- footer end -->
</body>
</html>