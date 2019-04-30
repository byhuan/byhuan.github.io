<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="topMenu">
  <div class="pW">
    
    <ul class="fr topTh">
      <li class="login" id="login">
      	<span id="loginbar" style="margin-right: 15px;">
      		<c:if test="${user==null }">
      			<a href="${pageContext.request.contextPath}/page/login">请登录</a>
      		</c:if>
      		<c:if test="${user!=null }">
      			<em>${user.username }</em>
      		</c:if>
      	</span>
      	<a href="${pageContext.request.contextPath}/page/register">免费注册</a>
      	<a href="${pageContext.request.contextPath}/order/home-index">我的订单</a>
      </li>
      <!--  <li class="myOrder"><a name="sfbest_hp_hp_head_OrderList" class="trackref" href="http://home.e3mall.cn/myorder/index/" rel="nofollow">我的订单</a></li>
      -->
    </ul>
    <span class="clear"></span>
  </div>
  <script type="text/javascript" src="/js/e3mall.js"></script>
  <script type="text/javascript" src="/js/jquery.cookie.js"></script>
</div>