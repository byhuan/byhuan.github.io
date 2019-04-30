<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="pragma" content="no-cache"/>
<meta http-equiv="cache-control" content="no-cache"/>
<meta http-equiv="expires" content="0"/> 
<meta name="format-detection" content="telephone=no"/>  
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/> 
<meta name="format-detection" content="telephone=no"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="stylesheet" type="text/css" href="/css/jquery.alerts.css" />
<link rel="stylesheet" type="text/css" href="/css/head.css" />
<link rel="stylesheet" type="text/css" href="/css/cart.css"/>
<link rel="stylesheet" type="text/css" href="/css/common.css" />
<script type="text/javascript" src="/js/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="/js/jquery.price_format.2.0.min.js"></script>
<script type="text/javascript" src="/js/jquery.alerts.js"></script>
<script type="text/javascript" src="/js/cookie.js"></script>
<script type="text/javascript" src="/js/shadow.js"></script>
<script type="text/javascript" src="/js/cart.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<title>我的购物车 - 自营商城</title>
</head>
<body> 
<jsp:include page="commons/header.jsp" />
<div class="cartMain">
	<div class="cartHead">
		<h3 class="cartMy">我的购物车</h3>
		<div class="clear"></div>
	</div>
	<div class="cartMain">
      <div class="cartThead">
        <div class="tCol tCheckbox">
        <input name="acart_list_check" id="Zall" type="checkbox" onclick="Zall(this)"/> 全选</div>
        <div class="tCol tGoods">商品</div>
        <div class="tCol tPrice">单价</div>
        <div class="tCol tPromotion">优惠</div>
        <div class="tCol tQuantity">数量</div>
        <div class="tCol tWeight">重量(含包装)</div>
        <div class="tCol tSubtotal">小计</div>
        <div class="tCol tInventory">库存状态</div>
        <div class="tCol tOperator">操作</div>
      </div>
      <div class="cartTbody">

		<div class="cartColumnhd">
			<div class="cartCheckbox">
				<input name="cart_list_yx" id="Zpu" type="checkbox"
					onclick="PutongAll(this)"/>优选商品 
			</div>
		</div>
		<div class="cartList youxuan" id="all_putong">
		<div style="margin: 20px; text-align: center; display: none;" id="danjianload"></div>
		<div id="danjian">
			<div class="cartItem">
				<c:forEach items="${cartList}" var="cart">
				<c:set var="totalPrice"  value="${totalPrice + (cart.price * cart.num) }"/>
				<div class="cartPInfo" id="danjian-0-229363">
					<div class="clearit">
						<div class="pItem pCheckbox">
							<input name="cart_list" class="putong"	value="${cart.id }" type="checkbox"/>
						</div>
						<div class="pItem pGoods">
							<div class="cart_pimg">
								<a target="_blank" title="${cart.title }" href="http://localhost:8888/item/${cart.id }.html">
								<img src="${cart.image }" style="width: 60px;height: 60px;"/>
								</a>
							</div>
							<div class="cart_pname">
								<div>
								<a target="_blank" href="http://localhost:8888/item/${cart.id }.html">${cart.title }</a>
								</div>
								<div class="cdzg">产地直供</div>
							</div>
						</div>
						<div class="pItem pPrice">
							<div style="position: relative;">
								<strong>¥<fmt:formatNumber groupingUsed="false" value="${cart.price}" maxFractionDigits="2" minFractionDigits="2"/></strong>
							</div>
						</div>
						<div class="pItem pPromotion">&nbsp;</div>
						<div class="pItem pQuantity">
							<div class="cartAmount">
								<a href="javascript:void(0);" class="cartCountBtn decrement">-</a> 
								<input type="text" value="${cart.num }" class="amount itemnum" itemPrice="${cart.price}" itemId="${cart.id}" id="amountdanjian-0-229363" name="amount"/>
								<a href="javascript:void(0);" class="cartCountBtn increment">+</a> 
							</div>
						</div>
						<c:if test="${cart.weight != null }">
							<div class="pItem pWeight">${cart.weight }<br/></div>
						</c:if>
						<div class="pItem pSubtotal">
							<span id="total_price" class="totalprice">¥<fmt:formatNumber groupingUsed="false" value="${cart.price * cart.num}" maxFractionDigits="2" minFractionDigits="2"/></span>
						</div>
						<div class="pItem pInventory">现货</div>
						<div class="pItem pOperator">
							<a id="cartDel" href="/cart/delete/${cart.id}.html">删除</a>
						</div>
					</div>
		</div>
		</c:forEach>
		</div>
	</div>
	</div>
	
	</div>
      <div class="cartOrderCount" id="orderCount">
        <div class="cartButtons">
        	<input type="button" value="删除选中商品" onclick="deleteSelect()" class="cartclear"/>
          	<input type="button" value="清空购物车" onclick="javascript:document.location.href='http://localhost:8888/cart/clear-all'" class="cartclear"/>
        </div>
        
        <script type="text/javascript">
        	//删除选中
        	function deleteSelect() {
        		obj = document.getElementsByName("cart_list");
        		check_val = [];
        		for(k in obj){
        		     if(obj[k].checked)
        		         check_val.push(obj[k].value);
        		}
        		
        		 $.ajax({ 
        		       type:"POST", 
        		       url:"http://localhost:8888/cart/delete/select", 
        		       dataType:"json",      
        		       contentType:"application/json",               
        		       data:JSON.stringify(check_val), 
        		       success : function(data){
        		    	   if(data.status == 200){
        		    		   window.location.href = "http://localhost:8888/cart/cart";
        		    	   }else{
        		    		   alert("出错了");
        		    	   }
        		       } 
        		   }); 
			}
        	
        	//结算
        	function orderSelect() {
        		obj = document.getElementsByName("cart_list");
        		check_val = [];
        		for(k in obj){
        		     if(obj[k].checked)
        		         check_val.push(obj[k].value);
        		}
        		
        		//跳转
		    	window.location.href = "http://localhost:8888/order/orderCart?ids="+check_val;
        		
        		/*
        		 $.ajax({ 
  	  		       type:"POST", 
  	  		       url:"http://localhost:8888/order/orderCart", 
  	  		       dataType:"json",      
  	  		       contentType:"application/json",  
  	  		   	   data:JSON.stringify(check_val), 
  	  		       success : function(data){
  	  		    	   if(data.status == 300){
  	  		    		//跳转到登录页面
  	  		    		window.location.href = "http://localhost:8888/page/login";
  	  		    	   }else{
  	  		    		   alert("出错了");
  	  		    	   }
  	  		       } 
  	  		   }); 
        		*/
			}
        </script>
        
        <div class="cartTotalItem">
          <span id="all_shopePrice">（不含运费）</span>&nbsp;&nbsp;&nbsp;&nbsp;商品总计：
          <span class="cartPrice" id="allMoney2">¥<fmt:formatNumber value="${totalPrice }" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/>
          </span>
        </div>
      </div>
      <div class="cartJsuan">
         <input onclick="javascript:document.location.href='http://localhost:8888/index'" class="goshop" value="继续购物" type="button"/>
         <input onclick="orderSelect()" class="jiesuan youxuan" value="去结算" type="button"/>
      </div>
    </div>
</div>
<!-- footer start -->
<jsp:include page="commons/footer.jsp" />
<!-- footer end -->
</body>
</html>