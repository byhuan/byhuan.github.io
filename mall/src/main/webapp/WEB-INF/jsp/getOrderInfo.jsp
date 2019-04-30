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
	<title>结算页</title>

    <link rel="stylesheet" type="text/css" href="/css/webbase.css" />
    <link rel="stylesheet" type="text/css" href="/css/pages-getOrderInfo.css" />
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
		<!--主内容-->
		<div class="checkout py-container">
			<div class="checkout-tit">
				<h4 class="tit-txt">填写并核对订单信息</h4>
			</div>
			<div class="checkout-steps">
				<!--收件人信息-->
				<div class="step-tit">
					<h5>收件人信息<span><a data-toggle="modal" data-target=".edit" data-keyboard="false" class="newadd" onclick="addGetAddress()">新增收货地址</a></span></h5>
				</div>
				<div class="step-cont">
					<div class="addressInfo">
						<ul class="addr-detail">
							<li class="addr-item">
								<c:if test="${addressList!=null }">
									<c:forEach items="${addressList }" var="add">
										<div>
											<div class="con name" id="add_${add.id}"><a href="javascript:;" onclick="dian(${add.id})">${add.contact }<span title="点击取消选择"/>&nbsp;</a></div>
											<div class="con address">${add.contact } &nbsp; ${add.address } &nbsp;<span>${add.mobile }</span>
												<input type="hidden" id="sAddr_${add.id}" value="${add.contact } &nbsp; ${add.address } &nbsp;${add.mobile }"/>
												<input type="hidden" id="sAddid_${add.id}" value="${add.id }"/>
												<c:if test="${add.isDefault ==1 }">
													<span class="base">默认地址</span>
												</c:if>
												<span class="edittext"><a data-toggle="modal" data-target=".edit" data-keyboard="false" >编辑</a>&nbsp;&nbsp;<a href="javascript:;">删除</a></span>
											</div>
											<div class="clearfix"></div>
										  </div>
									</c:forEach>
								</c:if>
							</li>
						</ul>
						
						<!-- 存选中的地址id -->
						<input type="hidden" id="addid" value=""/>
						<script type="text/javascript">
						
							//点击姓名
							function dian(obj){
								 //$(this).toggleClass("selected").siblings().removeClass("selected");
								 if($("#add_"+obj).hasClass("selected")){
									$("#add_"+obj).removeClass("selected");
									$("#sendAddress").html("");
									//清除保存的id
									$("#addid").val("");
								 }else{
									$(".name").removeClass("selected");
									$("#add_"+obj).addClass("selected");
									$("#sendAddress").html($("#sAddr_"+obj).val());
									//选中的地址id保存
									$("#addid").val($("#sAddid_"+obj).val());
								 }
							};
						
							function addGetAddress() {
								//当点击添加新地址或编辑地址时，通过ajax获取省市区地址
								$.ajax({ 
					     		       type:"POST", 
					     		       url:"http://localhost:8888/order/orderAddress?flag=1", 
					     		       dataType:"json",
					     		       contentType:"application/json",               
					     		       success : function(data){
					     		    	   if(data.data != null){
					     		    		  for (var i = 0; i < data.data.length; i++) {
					                              $("#province").append("<option value="+data.data[i].provinceid+">" + data.data[i].province + "</option>");
					     		    		  }
					     		    	   }else{
					     		    		   alert("出错了");
					     		    	   }
					     		       } 
					     		   }); 
							}
							//绑定省被选中的事件，动态获取省下面的市的列表
							function proChange() {
								var id = $("#province").val();
								if(id != null){
									$.ajax({ 
						     		       type:"POST", 
						     		       url:"http://localhost:8888/order/orderAddress?flag=2&id="+id, 
						     		       dataType:"json",
						     		       contentType:"application/json",               
						     		       success : function(data){
						     		    	   if(data.data != null){
						     		    		  for (var i = 0; i < data.data.length; i++) {
						                              $("#city").append("<option value="+data.data[i].cityid+">" + data.data[i].city + "</option>");
						     		    		  }
						     		    	   }else{
						     		    		   alert("出错了");
						     		    	   }
						     		       } 
						     		   }); 
								}
							}
							//绑定市被选中的事件，动态获取市下面的区、县的列表
							//且要更新form表单中的数据
							function cityChange() {
								var id = $("#city").val();
								if(id != null){
									$.ajax({ 
						     		       type:"POST", 
						     		       url:"http://localhost:8888/order/orderAddress?flag=3&id="+id, 
						     		       dataType:"json",
						     		       contentType:"application/json",               
						     		       success : function(data){
						     		    	   if(data.data != null){
						     		    		  for (var i = 0; i < data.data.length; i++) {
						                              $("#district").append("<option value="+data.data[i].areaid+">" + data.data[i].area + "</option>");
						     		    		  }
						     		    		  //更新form表单中的数据
						     		    		  $("#pro").val($("#province").val());
						     		    		  $("#ci").val($("#city").val());
						     		    		  $("#dis").val($("#district").val());
						     		    	   }else{
						     		    		   alert("出错了");
						     		    	   }
						     		       } 
						     		   }); 
								}
							}
							
							//递交添加或修改的地址的表单数据
							function submitAddress() {
								$.ajax({ 
					     		       type:"POST", 
					     		       url:"http://localhost:8888/order/orderAddressChange", 
					     		       dataType:"json",
					     		       contentType:"application/x-www-form-urlencoded",
					     		       data: $("#form1").serialize(),
					     		       success : function(data){
					     		       	   if(data.status == 200){
					     		       			window.location.href = "http://localhost:8888/order/getOrderInfo?oid="+$("#orderid").val();
					     		       	   }
					     		       	   else{
					     		       		   alert("失败");
					     		       	   }
					     		       } 
					     		   }); 
							}
							
							//递交订单，并跳转到支付页面
							function sendOrderToPay(price) {
								var orderid = $("#orderid").val();
								var addid = $("#addid").val();
								if(addid == ""||addid==null){
									alert("地址不能为空，请选择地址");
									return;
								}
								
								window.location.href = "http://localhost:8888/order/sendOrderToPay?oid="+orderid+"&addid="+addid+"&price="+price;
							}
						</script>
						
						<!--添加地址-->
                          <div  tabindex="-1" role="dialog" data-hasfoot="false" class="sui-modal hide fade edit">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" data-dismiss="modal" aria-hidden="true" class="sui-close">×</button>
						        <h4 id="myModalLabel" class="modal-title">添加收货地址</h4>
						      </div>
						      <div class="modal-body">
						      	<form action="" class="sui-form form-horizontal" id="form1">
						      		 <div class="control-group">
									    <label class="control-label">收货人：</label>
									    <div class="controls">
									      <input type="text" class="input-medium" name="contact" id="contact"/>
									    </div>
									  </div>
									    <div class="control-group">
                                            <label class="control-label">所在地区：</label>
                                            <div class="controls">
                                                <div data-toggle="distpicker">
                                                <div class="form-group area">
                                                    <select class="form-control" id="province" onchange="proChange()"></select>
                                                    <input type="hidden" id="pro" name="provinceId"/>
                                                </div>
                                                <div class="form-group area">
                                                    <select class="form-control" id="city" onchange="cityChange()"></select>
                                                    <input type="hidden" id="ci" name="cityId"/>
                                                </div>
                                                <div class="form-group area">
                                                    <select class="form-control" id="district"></select>
                                                    <input type="hidden" id="dis" name="townId"/>
                                                </div>
                                            </div>
                                            </div>									 
                                        </div>
									   <div class="control-group">
									    <label class="control-label">详细地址：</label>
									    <div class="controls">
									      <input type="text" class="input-large" name="address"/>
									    </div>
									  </div>
									   <div class="control-group">
									    <label class="control-label">联系电话：</label>
									    <div class="controls">
									      <input type="text" class="input-medium" name="mobile"/>
									    </div>
									  </div>
									   <div class="control-group">
									    <label class="control-label">邮编：</label>
									    <div class="controls">
									      <input type="text" class="input-medium" name="alias"/>
									    </div>
									  </div>
						      	</form>
						      </div>
						      <div class="modal-footer">
						        <button type="button" data-ok="modal" class="sui-btn btn-primary btn-large" onclick="submitAddress()">确定</button>
						        <button type="button" data-dismiss="modal" class="sui-btn btn-default btn-large">取消</button>
						      </div>
						    </div>
						  </div>
						</div>
						 <!--确认地址-->
					</div>
					<div class="hr"></div>
					
				</div>
				<div class="hr"></div>
				<!--支付和送货-->
				<div class="payshipInfo">
					<div class="step-tit">
						<h5>支付方式</h5>
					</div>
					<div class="step-cont">
						<ul class="payType">
							<li class="selected">支付宝付款<span title="点击取消选择"></span></li>
							<li>货到付款<span title="点击取消选择"></span></li>
						</ul>
					</div>
					<div class="hr"></div>
					<div class="step-tit">
						<h5>送货清单</h5>
					</div>
					<div class="step-cont">
						<ul class="send-detail">
							<li>
								<div class="sendGoods">
									<c:if test="${itemList !=null }">
										<c:forEach items="${itemList }" var="item">
											<input type="hidden" value="${item.orderId }" id="orderid"/>
											<ul class="yui3-g">
												<li class="yui3-u-1-6">
													<span><img src="${item.picPath }"/></span>
												</li>
												<li class="yui3-u-7-12">
													<div class="desc">${item.title }</div>
													<div class="seven">7天无理由退货</div>
												</li>
												<li class="yui3-u-1-12">
													<div class="price">￥ ${item.price }</div>
												</li>
												<li class="yui3-u-1-12">
													<div class="num">${item.num }</div>
												</li>
												<li class="yui3-u-1-12">
													<div class="exit">有货</div>
												</li>
											</ul>
										</c:forEach>
									</c:if>
								</div>
							</li>
							<li></li>
							<li></li>
						</ul>
					</div>
					<div class="hr"></div>
				</div>
				<div class="linkInfo">
					<div class="step-tit">
						<h5>发票信息</h5>
					</div>
					<div class="step-cont">
						<span>普通发票（电子）</span>
						<span>个人</span>
						<span>明细</span>
					</div>
				</div>
				<div class="cardInfo">
					<div class="step-tit">
						<h5>使用优惠/抵用</h5>
					</div>
				</div>
			</div>
		</div>
		<div class="order-summary">
			<div class="static fr">
				<div class="list">
					<span><i class="number">${con.num }</i>件商品，总商品金额</span>
					<em class="allprice">¥ ${con.price }</em>
				</div>
				<div class="list">
					<span>返现：</span>
					<em class="money">0.00</em>
				</div>
				<div class="list">
					<span>运费：</span>
					<em class="transport">0.00</em>
				</div>
			</div>
		</div>
		<div class="clearfix trade">
			<div class="fc-price">应付金额:　<span class="price">¥ ${con.price }</span></div>
			<div class="fc-receiverInfo">寄送至: <span id="sendAddress"></span></div>
		</div>
		<div class="submit">
			<a class="sui-btn btn-danger btn-xlarge" onclick="sendOrderToPay(${con.price })" href="#">提交订单</a>
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
<script type="text/javascript" src="/js/pages/getOrderInfo.js"></script>
</body>

</html>