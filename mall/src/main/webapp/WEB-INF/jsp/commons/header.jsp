<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--shortcut start-->
<jsp:include page="shortcut.jsp" />
<!--shortcut end-->
<div id="header">
  <div class="header_inner">
    <div class="logo1">
			<a name="logo" href="${pageContext.request.contextPath}/index" class="logoleft">
		</a>
			<div class="logo-text">
				<img src="/images/html/logo_word.jpg">
			</div>
		</div>
    <div class="index_promo"></div>
    <div class="search">
      <form action="${pageContext.request.contextPath}/search" id="searchForm" name="query" method="GET">
        <input type="text" class="text keyword ac_input" name="keyword" id="keyword" value="${query }" style="color: rgb(153, 153, 153);" onkeydown="javascript:if(event.keyCode==13) search_keys('searchForm');" autocomplete="off">
        <input type="button" value="" class="submit" onclick="search_keys('searchForm')">
      </form>
    </div>
    <div class="shopingcar" id="topCart">
      <s class="setCart"></s><a href="${pageContext.request.contextPath}/cart/cart" class="t" rel="nofollow">我的购物车</a><b id="cartNum"></b>
     
    </div>
  </div>
  <script type="text/javascript">
  	function search_keys(formName){
	   $('#'+formName).submit();
	}
  </script>
</div>