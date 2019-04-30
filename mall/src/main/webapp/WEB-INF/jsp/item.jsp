<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>${item.title } - 自营商城</title>
	<script>
        var _SF_CFG = {
            productId:${itemResult.item.id},
            number: 1600229585,
            minBuy: 1,
            maxBuy: 99,
            presell:false,
            presellId:0,
            parentId: 0,
            commentPage: 1,
            sdPage: 1,
            oneCategoryId: 6,
            twoCategoryId: 7321,
            threeCategoryId: 7331,
            sfprice: 0,
            price:0,
            warehouse: 0,
            businessModel: 3,
		commentType : 0
	};
	</script>
	
	<script src="/js/jquery-1.5.1.min.js" type="text/javascript"></script>
<script src="/js/jquery.alerts.js" type="text/javascript"></script>
<script src="/js/common.js" type="text/javascript"></script>
<script src="/js/cart.js" type="text/javascript"></script>
<script src="/js/cloud-zoom.1.0.2.min.js" type="text/javascript"></script>
<script src="/js/jquery.thickbox.js" type="text/javascript"></script>
<script src="/js/goods.js" type="text/javascript"></script>
<script src="/js/NewVersion.js" type="text/javascript"></script>
<script src="/js/png.js" type="text/javascript"></script>
<script src="/js/qiangGouPro.js" type="text/javascript"></script>
<script src="/js/jquery.cookie.js" type="text/javascript"></script>
<script src='/js/jquery.lazyload.js' type='text/javascript'></script>
<script type="text/javascript" src="/js/jquery.qrcode.js"></script> 
<script type="text/javascript" src="/js/qrcode.js"></script>
<script type="text/javascript" src="/js/cookie.js"></script>
<script type="text/javascript" src="/js/shadow.js"></script>
<script src="/js/product.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/css/base_w1200.css"/>

<link rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="/css/product.css"/>
<link rel="stylesheet" type="text/css" href="/css/jquery.alerts.css" />
<link rel="stylesheet" type="text/css" href="/css/common.css" />
</head>
<body >
<!-- header start -->
<jsp:include page="commons/header.jsp" />
<!-- header end -->

<div class="mainNav">
  <div class="navmenu">
  
    <!----menufloat------->
    <div class="menu1">
      <ul>
            <li><a name="sfbest_Uhead_Uhead_nav_nav1" class="trackref" href="${pageContext.request.contextPath}/index">首页</a></li>
            <li id="cat1"><a name="sfbest_Uhead_Uhead_nav_nav2" href="" class="trackref">优选水果</a></li>
			<li id="cat2"><a name="sfbest_Uhead_Uhead_nav_nav3" href="" class="trackref">酒水饮品</a></li>
			<li id="cat3"><a name="sfbest_Uhead_Uhead_nav_nav4" href="" class="trackref">洗护用品</a></li>
			<li id="cat4"><a name="sfbest_Uhead_Uhead_nav_nav5" href="" class="trackref">精美零食</a></li>
			<li id="cat5"><a name="sfbest_Uhead_Uhead_nav_nav6" href="" class="trackref">日用品</a></li>
			<li id="cat6"><a name="sfbest_Uhead_Uhead_nav_nav7" href="" class="trackref"></a></li>
      </ul>
    </div>
    <span class="clear"></span>
  </div>
</div>
<div class="pWrap">
    <div class="productIntro">
        <div class="pItems">
            <div class="pItemsMain">
                <div class="pItemsName">
                    <div class="cm">
                        <h1 id="base_name-sf">${itemResult.item.title }</h1><br></br>
						<strong id="adword-sf" title="" class="">${itemResult.item.sellPoint }</strong>
                    </div>
                </div>
                <div class="pItemsPrice" id="price-sf">
                	<div class="priceBox">
                		<span class="dt">优选价：</span><span class="rmb">￥</span>
                		<strong class="price">${itemResult.item.price }</strong>
                	</div>
                	<div class="boxWb"></div><div id="productStamp" class="productStamp_1"></div></div>
                <div class="clear"></div>
                <div id="presell-info-sf" class="pItemBook" style="display:none"></div>
                <div class="pItemsPromo" id="promotion-sf" style="display:none"></div>
                <div class="pItemsStock">
                    <div class="dt">送至：</div>
                    <div class="dd">
                        <div id="regionSf"><div class="" id="store-selector">
	    <div class="text"><div title="北京昌平区回龙观镇">北京昌平区回龙观镇</div><b></b></div>
	    
	    <div onclick="$('#store-selector').removeClass('hover')" class="close"></div>
	  </div>
	  </div>
                        <div class="pItemsPrompt" id="time-sf">原产地直供，发货后预计<strong>2-5天</strong>内为您送达</div>
                    </div>
                    <span class="clear"></span>
                </div>
                <div class="pItemsChoose">
                    <div class="chooseType">
                        <ul id="fatherson-sf"></ul>
                        <span class="clear"></span>
                    </div>
                    <div class="chooseBtns" id="buy-btn-sf">
                        <div class="pAmount">
                            <span>
                            	<input type="text" id="number_${itemResult.item.id }" class="text"/>
                            </span>
                            <span>
                                <a href="javascript:;" id="add-sell-num" class="p-add">+</a>
                                <a href="javascript:;" id="reduce-sell-num" class="p-reduce disable">-</a>
                            </span>
                        </div>
                        <div class="pBtn" id="cart-add-btn-sf"><a href="${pageContext.request.contextPath }/cart/add/${itemResult.item.id}"><b></b>加入购物车</a></div>
                        <div class="pBtn quickBuy" style="display: none;" id="quickBuy" title="快速下单，直达填写订单页面"><a onclick="oneKeyBuy(${itemResult.item.id}, 0, 1, 0, 1, this);">一键购买</a></div>
						<div class="yj_time" id="sendTime">预计发货时间：<br/>2014-02-28 08:59</div>
                        <span class="clear"></span>
                    </div>
                    <div class="chooseBtns" id="buy-nogood-sf" style="display:none">
                        <div class="pBtn"><span class="noShip">已售完</span></div>
                        <div class="pBtn preBtn" id="arrival_notice"><a href="javascript:void(0);" onclick="Goods.arrivalNotice(this);">到货通知</a></div>
                        <div class="pBtn quickBuy disable"><a href="javascript:void(0);">一键购买</a></div>
                        <span class="clear"></span>
                    </div>
                    <div class="chooseBtns" id="buy-canntsend-sf" style="display:none">
                         <div class="pBtn"><span class="noShip">无法送达</span></div>
                        <span class="clear"></span>
                    </div>
                    <div class="finalBuy" id="finalbuy-sf" style="display:none"></div>
                </div>
            </div>
		<div class="pView">
                                <div id="pView">
                <div id="zoom-jpg" class="jqzoom">
                <img alt="" width="330" height="330" src="${itemResult.item.image }"/>
                </div>
                <div id="pic-list">
                    <a href="javascript:void(0);" class="btn-control disabled" id="btn-forward"><b></b></a>
                    <a href="javascript:void(0);" class="btn-control disabled" id="btn-backward"><b></b></a>
        
                    <div class="pic-items" style="position: absolute; width: 50px; height: 300px; overflow: hidden;">
                        <ul style="position: absolute; left: 0px; top: 0px; height: 240px;">
                           <c:forEach items="${itemResult.images }" var="image">
	                           <li style="float: left;">
	                           		<img title="${itemResult.item.title }" alt="${itemResult.item.title }" src="${image }"/>
	                           	</li>
                           </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="pShare">
				<div class="bdShare"><!-- Baidu Button BEGIN -->
                  <div id="bdshare" class="bdshare_t bds_tools get-codes-bdshare">
                      <span class="bds_more">分享到：</span>
                      <a class="bds_qzone" title="分享到QQ空间" href="#"></a>
                      <a class="bds_tsina" title="分享到新浪微博" href="#"></a>
                      <a class="bds_tqq" title="分享到腾讯微博" href="#"></a>
                      <a class="bds_renren" title="分享到人人网" href="#"></a>
                      <!--a class="bds_t163"></a-->
                      <!--a class="shareCount"></a-->
                  </div>
                  <span class="clear"></span>
                </div><!-- Baidu Button END -->
				<div class="pCollect"><a href="javascript:void(0);" id="goodsAddFav" onclick="Goods.addFav(this);">收藏商品</a></div>
				<span class="clear"></span>
			</div>
        </div>
            
        </div>
        <div class="pItemsSide">
                <div class="sideWrap">
                    <div class="points">
						<ul id="points-sf">
							<li>
								<img title="${itemResult.item.title }" alt="${itemResult.item.title }" src="${itemResult.item.image }" width="120%" height="120%"/>
							</li>
							<li class="has_poptip attr3">
								<img title="${itemResult.item.title }" alt="${itemResult.item.title }" src="${itemResult.item.image }" width="120%" height="120%"/>
							</li>
							<li>
								<img title="${itemResult.item.title }" alt="${itemResult.item.title }" src="${itemResult.item.image }" width="120%" height="120%"/>
							</li>
						</ul>
					</div>
					     		                </div>
                <div class="pdetail">
                    <ul>
                                                <li>品牌：<span><a href="#" target="_blank">${itemResult.item.brand }</a></span></li>
                                                <li>产地：<span><a href="#" target="_blank">${itemResult.item.origin }</a></span></li>
					                            <c:if test="${itemResult.item.weight !=null }">
							                            <li>重量：${itemResult.item.weight }</li>
												</c:if>
                                                <li>商品编号：${itemResult.item.id }</li>
                        			<li class="card-pay">
			</li>
		                                                                          </ul>
                                        <div class="pDeclare">
                         
                        <div class="nosupport"><b></b>本品不支持无理由退换货</div>
                                            </div>
                                    </div>       
                <div class="pcommdetail">
                    <dl class="prate">
                        <dt>好评度：</dt>
                        <dd>
                            <div class="dd"><span id="positive-sf" style="100%"></span></div>
                            <strong><span id="positive-num-sf">100</span><span>%</span></strong>
                            <div style="display:none" id="score"></div>
                        </dd>
                    </dl>
                    <dl class="pcomment" id="bestComment-sf">
                    	<dd>
                    		<b></b>
                    	<div>
                    	<span>
                    	<p>还没人评论哦</p>
                    	<p><a href="javascript:Goods.gotoPl()" class="green">马上评价</a></p>
                    	</span>
                    	</div>
                    	</dd>
                    	</dl>
                </div>
            </div>
        <span class="clear"></span>
    </div>
</div><div class="pWrap">
    <div class="main-box">
        <div id="package"></div>
        <div class="pDetail">
            <ul class="pTab">
                <li class="curr" pcont-target="div-detail"><a title="商品详情" href="javascript:void(0);">商品介绍</a></li>
                                <li pcont-target="div-comment"><a title="用户评价" href="javascript:void(0);">评价<b>(<font class="comment-total-sf">0</font>)</b></a></li>
                            </ul>
            <div id="add-cart-r-btn-sf" class="p-btn"><a href="${pageContext.request.contextPath }/cart/add/${itemResult.item.id}" pid="${itemResult.item.id}">加入购物车</a></div>
        </div>
        <div class="clear" id="flow-layer-sf"></div>
		<div class="pCont cpjs_box" id="div-detail">
			<ul class="cpjs_list">
				<li><strong>保质期：</strong>${itemResult.item.quality }</li>
				<c:if test="${itemResult.item.weight !=null }">
					<li><strong>重量(含包装)：${itemResult.item.weight }</strong></li>
				</c:if>
				<c:if test="${itemResult.item.unit !=null }">
					<li><strong>销售单位：</strong>盒</li>
				</c:if>
				<li><strong>产地：</strong>${itemResult.item.origin }</li>
			</ul>
			<div
				style="background-color: #f5f5f5; padding: 4px 20px 4px 0; line-height: 20px; overflow: hidden; zoom: 1;">
				<span style="float: left; width: 100px; text-align: right; padding-right: 6px; margin-right: 6px;">温馨提示：</span>
				<span style="display: block; overflow: hidden; zoom: 1;">
					理工大大超商城所售商品均经过严格的供应商资质审查、商品审查、入库全检、出货全检流程。
					由于部分商品存在厂家更换包装、不同批次、不同生产日期、不同生产工厂等情况，
					导致商品实物与图片存在微小差异，因此请您以收到的商品实物为准，
					同时我们会尽量做到及时更新，由此给您带来不便敬请谅解，谢谢！
				</span>
			</div>
			<div class="pJiucuo">
				如果您发现商品信息存在问题，<a target="_blank"
					href="http://www.e3mall.cn/ProductCorrection/ProductCorrection/pId/${item.id}"
					rel="nofollow">欢迎纠错</a>
			</div>
			<div class="product_info">${itemDesc.itemDesc }</div>
		</div>
			<div class="pCont" id="div-comment">
            <div class="commentList" id="commandp">
                <div class="pt">
                    <h3 class="pTop">用户评价</h3>
                    <div class="commDetail">
                        <div class="pScore">好评度<strong><font id="user-comment-sf">100</font><span>%</span></strong></div>
                        <div class="pPercent" id="sorce-star-sf"><dl><dt>好评</dt><dd class="pBar"><div style="width:100px;"></div></dd><dd>100%</dd></dl><dl><dt>中评</dt><dd class="pBar"><div style="width:0px;"></div></dd><dd>0%</dd></dl><dl><dt>差评</dt><dd class="pBar"><div style="width:0px;"></div></dd><dd>0%</dd></dl></div>
                        <div class="pBtns">
                            <div>购买过商品，参与评价晒单，可获得积分哦~~</div>
                            <div>
                                <a class="pbtn2" href="javascript:Goods.gotoPl()" rel="nofollow">马上评价</a><span class="showMore"><a target="_blank" href="http://www.e3mall.cn/html/article/140/133.html" rel="nofollow">[如何获取积分]</a></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="commentAll" id="comment-filter-sf">
                  <h3 class="curr"><a href="javascript:;" data-type="0">全部评价<font>(0)</font></a></h3>
                  <h3><a href="javascript:;" data-type="1">好评<font>(0)</font></a></h3>
                  <h3><a href="javascript:;" data-type="2">中评<font>(0)</font></a></h3>
                  <h3><a href="javascript:;" data-type="3">差评<font>(0)</font></a></h3>
                  <h3><a href="javascript:;" data-type="4">有晒单<font>(0)</font></a></h3>
                </div>
                <div id="have-none-comments" style="padding-left:10px;">还木有评价额，快抢沙发吧！</div><ul class="pComment" id="comment-lists-sf"></ul>
                <div class="plpage">
                    <div class="showAll" style="display: none;"><a target="_blank" href="/reviewlist/0/${itemResult.item.id}">[查看全部评价]</a></div>
                    <div class="pages" id="comment-ajax-page-sf"><span class="prev disabled"><b class="prevarr"></b>上一页</span><span class="current">1</span><span class="next disabled">下一页<b class="nextarr"></b></span></div>
                </div>
            </div>
            <div class="clear2"></div>
        </div>
        <div class="clear2"></div>
        <div class="l-recommend proRomm" id="recommend-by-view-sf" style="display:none"></div>
    </div>
     <div class="left-box">
			<div id="brandCon" class="catlist" style="">
				<h2 class="t">相关品牌</h2>
				<ul class="pClass">
					<li><a target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-10949.html#sfbest_item_1600229585_brand_1"
						title="半岛月饼">半岛月饼</a><a target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-3342.html#sfbest_item_1600229585_brand_2"
						title="元朗荣华">元朗荣华</a><a target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-2241.html#sfbest_item_1600229585_brand_3"
						title="奇华">奇华</a><a target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-6626.html#sfbest_item_1600229585_brand_4"
						title="迪士尼">迪士尼</a><a target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-10805.html#sfbest_item_1600229585_brand_5"
						title="宜芝多">宜芝多</a><a target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-9347.html#sfbest_item_1600229585_brand_6"
						title="日田食品">日田食品</a><a target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-10765.html#sfbest_item_1600229585_brand_7"
						title="欧美香" style="display: none;">欧美香</a><a target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-10853.html#sfbest_item_1600229585_brand_8"
						title="零食多" style="display: none;">零食多</a><a target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-10863.html#sfbest_item_1600229585_brand_9"
						title="我是花吃" style="display: none;">我是花吃</a><a target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-2696.html#sfbest_item_1600229585_brand_10"
						title="史努比 Snoopy" style="display: none;">史努比 Snoopy</a><a
						target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-3662.html#sfbest_item_1600229585_brand_11"
						title="郭元益" style="display: none;">郭元益</a><a target="_blank"
						href="http://www.e3mall.cn/pinpai/7331-4986.html#sfbest_item_1600229585_brand_12"
						title="佳宁娜" style="display: none;">佳宁娜</a></li>
				</ul>
				<span class="clickShow"><b class="hide"></b></span>
			</div>
			<div class="l-recommend" id="saletop-sf" style="display:none"></div>
        <!-- 
        <div class="l-recommend" id="viewBuyDiv" style="display: none;">
        	<div class="ct"><h2>浏览此商品的顾客还买了</h2></div>
            <div class="cm">
                <ul class="l-buy" id="viewbuy-sf"></ul>
            </div>
        </div>
         
		<div class="l-recommend">
			<div class="ct"><h2>购买此商品的顾客还买了</h2></div>
            <div class="cm">
                <ul class="l-buy" id="buyrebuy-sf"><li><div class="p-img"><a target="_blank" href="#"><img src="/images/small_1800005691_1_1_1.jpg"></a></div><div class="title-a"><a target="_blank" href="http://www.e3mall.cn/html/products/5/1800005691.html#trackref=sfbest_item_1600229585_buy1_1">归原Green Yard 有机鲜牛奶 486ml</a></div><div class="title-b">【下单后3-5天发货】外包装更换中，请以实物为准</div><div class="p-price">￥20</div></li></ul>
            </div>
        </div>
        <div class="l-recommend">
            <div class="ct"><h2>浏览此商品的顾客还浏览了</h2></div>
            <div class="cm">
                <ul class="l-buy" id="browserbrowse-sf"><li><div class="p-img"><a target="_blank" href="#"><img src="/images/small_1800005691_1_1_1.jpg"></a></div><div class="title-a"><a target="_blank" href="http://www.e3mall.cn/html/products/5/1800005691.html#trackref=sfbest_item_1600229585_see_1">归原Green Yard 有机鲜牛奶 486ml</a></div><div class="title-b">【下单后3-5天发货】外包装更换中，请以实物为准</div><div class="p-price">￥20</div></li></ul>
            </div>
        </div>
        -->
        <c:forEach items="${buyItemList }" var="buy" varStatus="status">
			<c:if test="${status.index eq 0 }">
				<div class="l-recommend">
					<div class="ct"><h2>购买此商品的顾客还买了</h2></div>
		            <div class="cm">
	               		<ul class="l-buy" id="buyrebuy-sf">
	               			<li>
	               				<div class="p-img">
	               					<a target="_blank" href="http://localhost:8888/item/${buy.id }">
	               						<img src="${buy.image }" width="120px" height="120px"/>
	               					</a>
	               				</div>
	               				<div class="title-a">
	               					<a target="_blank" href="http://localhost:8888/item/${buy.id }">${buy.title }
	               					</a>
	               				</div>
	               				<div class="title-b">【下单后3-5天发货】外包装更换中，请以实物为准</div>
	               				<div class="p-price">￥ ${buy.price }</div>
	               				</li>
	               			</ul>
            		</div>
        		</div>
			</c:if>
			<c:if test="${status.index eq 1 }">
				<div class="l-recommend">
		            <div class="ct"><h2>浏览此商品的顾客还浏览了</h2></div>
		            <div class="cm">
		                <ul class="l-buy" id="browserbrowse-sf">
		                	<li>
		                		<div class="p-img">
		                			<a target="_blank" href="http://localhost:8888/item/${buy.id }">
		                				<img src="${buy.image }" width="120px" height="120px"/>
		                			</a>
		                		</div>
		                		<div class="title-a">
			                		<a target="_blank" href="http://localhost:8888/item/${buy.id }">${buy.title }
			                		</a></div>
		                		<div class="title-b">【下单后3-5天发货】外包装更换中，请以实物为准</div>
		                		<div class="p-price">￥ ${buy.price }</div>
		               		</li>
		                </ul>
		            </div>
		        </div>
			</c:if>
		</c:forEach>
    </div>
    <div class="clear"></div>  
    </div>  
<div class="clear1"></div>
<jsp:include page="commons/footer.jsp" />
</body>
</html>