package cn.e3mall.service.order.impl;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;

import cn.e3mall.common.redis.JedisClient;
import cn.e3mall.common.utils.AlipayConfig;
import cn.e3mall.common.utils.E3Result;
import cn.e3mall.common.utils.ResultOrderDetail;
import cn.e3mall.common.utils.ResultOrderPageInfo;
import cn.e3mall.mapper.TbAddressMapper;
import cn.e3mall.mapper.TbAreasMapper;
import cn.e3mall.mapper.TbCitiesMapper;
import cn.e3mall.mapper.TbOrderItemMapper;
import cn.e3mall.mapper.TbOrderMapper;
import cn.e3mall.mapper.TbOrderShippingMapper;
import cn.e3mall.mapper.TbProvincesMapper;
import cn.e3mall.pojo.TbAddress;
import cn.e3mall.pojo.TbAddressExample;
import cn.e3mall.pojo.TbAddressExample.Criteria;
import cn.e3mall.pojo.TbAreas;
import cn.e3mall.pojo.TbAreasExample;
import cn.e3mall.pojo.TbCities;
import cn.e3mall.pojo.TbCitiesExample;
import cn.e3mall.pojo.TbItem;
import cn.e3mall.pojo.TbOrder;
import cn.e3mall.pojo.TbOrderExample;
import cn.e3mall.pojo.TbOrderItem;
import cn.e3mall.pojo.TbOrderItemExample;
import cn.e3mall.pojo.TbOrderShipping;
import cn.e3mall.pojo.TbProvinces;
import cn.e3mall.pojo.TbProvincesExample;
import cn.e3mall.pojo.TbUser;
import cn.e3mall.service.order.OrderService;

/**
 * 订单处理服务
 */
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private TbOrderMapper orderMapper;
	@Autowired
	private TbOrderItemMapper orderItemMapper;
	@Autowired
	private TbOrderShippingMapper orderShippingMapper;
	@Autowired
	private TbAddressMapper addressMapper;
	@Autowired
	private TbProvincesMapper provincesMapper;
	@Autowired
	private TbCitiesMapper citiesMapper;
	@Autowired
	private TbAreasMapper areasMapper;
	@Autowired
	private JedisClient jedisClient;

	@Value("${ORDER_ID_GEN_KEY}")
	private String ORDER_ID_GEN_KEY;
	@Value("${ORDER_ID_START}")
	private String ORDER_ID_START;
	@Value("${ORDER_DETAIL_ID_GEN_KEY}")
	private String ORDER_DETAIL_ID_GEN_KEY;

	@Override
	public E3Result createOrder(TbUser user, List<TbItem> cartList) {
		// 生成订单号。使用redis的incr生成。
		if (!jedisClient.exists(ORDER_ID_GEN_KEY)) {
			jedisClient.set(ORDER_ID_GEN_KEY, ORDER_ID_START);
		}
		String orderId = jedisClient.incr(ORDER_ID_GEN_KEY).toString();

		// 封装订单信息
		TbOrder tb_order = new TbOrder();
		tb_order.setOrderId(orderId);
		tb_order.setUserId(user.getId());
		tb_order.setBuyerNick(user.getUsername());
		// 1、未付款，2、已付款，3、未发货，4、已发货，5、交易成功，6、交易关闭
		tb_order.setStatus(1);
		tb_order.setCreateTime(new Date());
		tb_order.setUpdateTime(new Date());
		// 订单总金额
		long price = 0;
		for (TbItem tbItem : cartList) {
			price += tbItem.getPrice();
		}
		tb_order.setTotlePrice(price);
		// 导入数据库
		orderMapper.insertSelective(tb_order);

		// 封装订单明细表
		for (TbItem tbItem : cartList) {
			// 生成明细id
			String odId = jedisClient.incr(ORDER_DETAIL_ID_GEN_KEY).toString();
			// 补全
			TbOrderItem tb_order_item = new TbOrderItem();
			tb_order_item.setId(odId);
			tb_order_item.setItemId(tbItem.getId().toString());
			tb_order_item.setOrderId(orderId);
			tb_order_item.setNum(tbItem.getNum());
			tb_order_item.setPicPath(tbItem.getImage());
			tb_order_item.setTitle(tbItem.getTitle());
			tb_order_item.setPrice(tbItem.getPrice());
			tb_order_item.setTotalFee(tbItem.getPrice() * tbItem.getNum());

			orderItemMapper.insertSelective(tb_order_item);
		}

		// 封装订单物流表，先不把地址封装进去
		TbOrderShipping tb_order_ship = new TbOrderShipping();
		tb_order_ship.setOrderId(orderId);
		orderShippingMapper.insertSelective(tb_order_ship);

		// 把生成的订单id传到前台，用于确定按照当前id生成结算页
		return E3Result.build(200, "成功", orderId);
	}

	// 查该用户所存的地址信息
	@Override
	public List<TbAddress> selectAddressList(Long id) {

		TbAddressExample example = new TbAddressExample();
		Criteria criteria = example.createCriteria();
		// 根据用户id查询
		criteria.andUserIdEqualTo(id.toString());
		List<TbAddress> addressList = addressMapper.selectByExample(example);

		return addressList;
	}

	// 查订单的商品信息
	@Override
	public List<TbOrderItem> selectOrderItemList(String oid) {

		TbOrderItemExample example = new TbOrderItemExample();
		cn.e3mall.pojo.TbOrderItemExample.Criteria criteria = example.createCriteria();
		criteria.andOrderIdEqualTo(oid);
		List<TbOrderItem> orderItemList = orderItemMapper.selectByExample(example);

		return orderItemList;
	}

	// 查省
	@Override
	public List<TbProvinces> selectProList() {

		List<TbProvinces> proList = provincesMapper.selectProList();
		return proList;
	}

	// 市
	@Override
	public List<TbCities> selectCityList(String id) {

		TbCitiesExample example = new TbCitiesExample();
		cn.e3mall.pojo.TbCitiesExample.Criteria criteria = example.createCriteria();
		criteria.andProvinceidEqualTo(id);
		List<TbCities> cityList = citiesMapper.selectByExample(example);

		return cityList;
	}

	// 区
	@Override
	public List<TbAreas> selectAreaList(String id) {

		TbAreasExample example = new TbAreasExample();
		cn.e3mall.pojo.TbAreasExample.Criteria criteria = example.createCriteria();
		criteria.andCityidEqualTo(id);
		List<TbAreas> areaList = areasMapper.selectByExample(example);

		return areaList;
	}

	// 保存地址
	@Override
	public E3Result saveOrderAddress(TbAddress address) {

		addressMapper.insertSelective(address);
		return E3Result.build(200, "");
	}

	// 微信支付
	// @Override
	// public E3Result sendOrderToPay(String oid, String price) {
	// SignType signType = null;
	// // 封装要传递给微信api的数据
	// Map<String, String> param = new HashMap<>();
	// param.put("appid", PayConfig.appid);
	// param.put("mch_id", PayConfig.partner);
	// param.put("nonce_str", WXPayUtil.generateNonceStr());// 随机字符串
	// param.put("sign_type", signType.MD5.toString());
	// param.put("body", "ziying");// 商品描述
	// param.put("out_trade_no", oid);// 商户订单号
	// param.put("total_fee", price);// 总金额（分）
	// param.put("spbill_create_ip", "127.0.0.1");// IP
	// param.put("notify_url", "http://test.itcast.cn");// 回调地址(随便写)
	// param.put("trade_type", "NATIVE");// 交易类型
	// try {
	// // 2.生成要发送的xml
	// String xmlParam = WXPayUtil.generateSignedXml(param,
	// PayConfig.partnerkey, signType.MD5);
	// System.out.println(xmlParam);
	// HttpClient client = new
	// HttpClient("https://api.mch.weixin.qq.com/pay/unifiedorder");
	// client.setHttps(true);
	// client.setXmlParam(xmlParam);
	// client.post();
	// // 3.获得结果
	// String result = client.getContent();
	// System.out.println(result);
	// Map<String, String> resultMap = WXPayUtil.xmlToMap(result);
	// Map<String, String> map = new HashMap<>();
	// map.put("code_url", resultMap.get("code_url"));// 支付地址
	// map.put("price", price);// 总金额
	// map.put("oid", oid);// 订单号
	//
	// return E3Result.ok(map);
	// } catch (Exception e) {
	// e.printStackTrace();
	// return E3Result.ok();
	// }
	// }
	// 支付宝支付
	@Override
	public E3Result sendOrderToPay(String oid, String price) {

		// 获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
				AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
				AlipayConfig.sign_type);

		// 设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

		String body = null;
		String out_trade_no = null;
		String total_amount = null;
		String subject = null;
		try {
			// 商户订单号，商户网站订单系统中唯一订单号，必填
			out_trade_no = new String(oid.getBytes("ISO-8859-1"), "UTF-8");
			// 付款金额，必填
			total_amount = new String(price.getBytes("ISO-8859-1"), "UTF-8");
			// 订单名称，必填
			subject = new String("自营商城".getBytes("ISO-8859-1"), "UTF-8");
			// 商品描述，可空
			body = new String("".getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
				+ "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

		// 若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
		// alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no
		// +"\","
		// + "\"total_amount\":\""+ total_amount +"\","
		// + "\"subject\":\""+ subject +"\","
		// + "\"body\":\""+ body +"\","
		// + "\"timeout_express\":\"10m\","
		// + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		// 请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节

		// 请求
		String result = null;
		try {
			result = alipayClient.pageExecute(alipayRequest).getBody();
		} catch (AlipayApiException e) {
			e.printStackTrace();
		}

		return E3Result.ok(result);
	}

	@Override
	public E3Result changeOrderAdd(String addid, String pid) {

		TbAddress address = addressMapper.selectByPrimaryKey(Long.valueOf(addid));
		TbOrderShipping shipping = orderShippingMapper.selectByPrimaryKey(pid);

		// 获取省市区
		// 省
		TbProvincesExample example = new TbProvincesExample();
		cn.e3mall.pojo.TbProvincesExample.Criteria criteria2 = example.createCriteria();
		criteria2.andProvinceidEqualTo(address.getProvinceId());
		List<TbProvinces> pros = provincesMapper.selectByExample(example);
		shipping.setReceiverState(pros.get(0).getProvince());
		// 市
		TbCitiesExample example2 = new TbCitiesExample();
		cn.e3mall.pojo.TbCitiesExample.Criteria criteria3 = example2.createCriteria();
		criteria3.andCityidEqualTo(address.getCityId());
		List<TbCities> cities = citiesMapper.selectByExample(example2);
		shipping.setReceiverCity(cities.get(0).getCity());
		// 区
		TbAreasExample example1 = new TbAreasExample();
		cn.e3mall.pojo.TbAreasExample.Criteria criteria = example1.createCriteria();
		criteria.andAreaidEqualTo(address.getTownId());
		List<TbAreas> areas = areasMapper.selectByExample(example1);
		shipping.setReceiverDistrict(areas.get(0).getArea());
		// 封装shipping
		shipping.setReceiverName(address.getContact());
		shipping.setReceiverMobile(address.getMobile());
		shipping.setReceiverPhone(address.getMobile());
		shipping.setReceiverAddress(address.getAddress());
		shipping.setUpdated(new Date());
		shipping.setReceiverZip(address.getAlias());

		// 存入数据库
		orderShippingMapper.updateByPrimaryKeySelective(shipping);

		return E3Result.ok();
	}

	// 检测支付时状态(微信支付)
	// @Override
	// public Map queryPayStatus(String out_trade_no) {
	// Map param = new HashMap();
	// param.put("appid", PayConfig.appid);// 公众账号ID
	// param.put("mch_id", PayConfig.partner);// 商户号
	// param.put("out_trade_no", out_trade_no);// 订单号
	// param.put("nonce_str", WXPayUtil.generateNonceStr());// 随机字符串
	// String url = "https://api.mch.weixin.qq.com/pay/orderquery";
	// try {
	// String xmlParam = WXPayUtil.generateSignedXml(param,
	// PayConfig.partnerkey);
	// HttpClient client = new HttpClient(url);
	// client.setHttps(true);
	// client.setXmlParam(xmlParam);
	// client.post();
	// String result = client.getContent();
	// Map<String, String> map = WXPayUtil.xmlToMap(result);
	// System.out.println(map);
	// return map;
	// } catch (Exception e) {
	// e.printStackTrace();
	// return null;
	// }
	// }

	// 支付成功，更新订单表状态
	@Override
	public E3Result orderSuccess(String oid, String price, String zid) {

		System.out.println("异步：" + oid + "--" + price + "--" + zid);
		// 其中oid为订单id zid为支付宝返回的支付id
		TbOrder order = orderMapper.selectByPrimaryKey(oid);
		// 更新数据
		order.setPayment(price);
		order.setPaymentType(1);
		order.setPostFee("0");
		order.setStatus(2);
		order.setPaymentTime(new Date());
		// 把支付宝的支付id存在用户的留言里（该字段无用）
		order.setBuyerMessage(zid);

		orderMapper.updateByPrimaryKey(order);

		return E3Result.ok(order);
	}

	// 查找所有未付款订单
	@Override
	public List<ResultOrderPageInfo> selectNoPayOrder(Long id) {

		// 查找当前用户的所有未付款订单
		TbOrderExample example = new TbOrderExample();
		cn.e3mall.pojo.TbOrderExample.Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(id);
		criteria.andStatusEqualTo(1);
		List<TbOrder> orderList = orderMapper.selectByExample(example);

		// 根据订单查各个订单的商品信息
		List<ResultOrderPageInfo> orderPageInfo = new LinkedList<>();
		TbOrderItemExample example1 = new TbOrderItemExample();
		for (TbOrder tbOrder : orderList) {
			ResultOrderPageInfo result = new ResultOrderPageInfo();
			cn.e3mall.pojo.TbOrderItemExample.Criteria criteria2 = example1.createCriteria();
			criteria2.andOrderIdEqualTo(tbOrder.getOrderId());
			List<TbOrderItem> list = orderItemMapper.selectByExample(example1);
			result.setItemList(list);
			result.setTotlePrice(tbOrder.getTotlePrice());
			example1.clear();
			orderPageInfo.add(result);
		}
		return orderPageInfo;
	}

	@Override
	public E3Result delOrder(String oid) {
		// 删除订单表
		orderMapper.deleteByPrimaryKey(oid);
		// 删除订单地址详情表
		orderShippingMapper.deleteByPrimaryKey(oid);
		// 删除订单明细表
		TbOrderItemExample example = new TbOrderItemExample();
		cn.e3mall.pojo.TbOrderItemExample.Criteria criteria = example.createCriteria();
		criteria.andOrderIdEqualTo(oid);
		orderItemMapper.deleteByExample(example);
		return E3Result.ok();
	}

	// 相应订单的订单详情页数据获取
	@Override
	public ResultOrderDetail orderDetail(String oid) {

		// 订单
		TbOrder order = orderMapper.selectByPrimaryKey(oid);
		// 订单地址详情表
		TbOrderShipping ship = orderShippingMapper.selectByPrimaryKey(oid);
		// 订单明细表
		TbOrderItemExample example = new TbOrderItemExample();
		cn.e3mall.pojo.TbOrderItemExample.Criteria criteria = example.createCriteria();
		criteria.andOrderIdEqualTo(oid);
		List<TbOrderItem> itemList = orderItemMapper.selectByExample(example);

		// 封装数据
		ResultOrderDetail detail = new ResultOrderDetail();
		detail.setOrder(order);
		detail.setShip(ship);
		detail.setTbOrderItemList(itemList);
		return detail;
	}

	// 查找未发货订单数据
	@Override
	public List<ResultOrderPageInfo> selectWhitSendOrder(Long id) {

		// 查找当前用户的所有已付款订单
		TbOrderExample example = new TbOrderExample();
		cn.e3mall.pojo.TbOrderExample.Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(id);
		criteria.andStatusEqualTo(2);
		List<TbOrder> orderList = orderMapper.selectByExample(example);

		// 根据订单查各个订单的商品信息
		List<ResultOrderPageInfo> orderPageInfo = new LinkedList<>();
		TbOrderItemExample example1 = new TbOrderItemExample();
		for (TbOrder tbOrder : orderList) {
			ResultOrderPageInfo result = new ResultOrderPageInfo();
			cn.e3mall.pojo.TbOrderItemExample.Criteria criteria2 = example1.createCriteria();
			criteria2.andOrderIdEqualTo(tbOrder.getOrderId());
			List<TbOrderItem> list = orderItemMapper.selectByExample(example1);
			result.setItemList(list);
			result.setTotlePrice(tbOrder.getTotlePrice());
			example1.clear();
			orderPageInfo.add(result);
		}
		return orderPageInfo;
	}

	// 查找待收货订单数据
	@Override
	public List<ResultOrderPageInfo> selectWhitGetOrder(Long id) {
		// 查找当前用户的所有已付款订单
		TbOrderExample example = new TbOrderExample();
		cn.e3mall.pojo.TbOrderExample.Criteria criteria = example.createCriteria();
		criteria.andUserIdEqualTo(id);
		criteria.andStatusEqualTo(4);
		List<TbOrder> orderList = orderMapper.selectByExample(example);

		// 根据订单查各个订单的商品信息
		List<ResultOrderPageInfo> orderPageInfo = new LinkedList<>();
		TbOrderItemExample example1 = new TbOrderItemExample();
		for (TbOrder tbOrder : orderList) {
			ResultOrderPageInfo result = new ResultOrderPageInfo();
			cn.e3mall.pojo.TbOrderItemExample.Criteria criteria2 = example1.createCriteria();
			criteria2.andOrderIdEqualTo(tbOrder.getOrderId());
			List<TbOrderItem> list = orderItemMapper.selectByExample(example1);
			result.setItemList(list);
			result.setTotlePrice(tbOrder.getTotlePrice());
			example1.clear();
			orderPageInfo.add(result);
		}
		return orderPageInfo;
	}

	//确认收货
	@Override
	public void sureGet(String oid) {
		TbOrder order = orderMapper.selectByPrimaryKey(oid);
		//封装数据
		order.setStatus(5);
		order.setEndTime(new Date());
		
		orderMapper.updateByPrimaryKeySelective(order);
	}
}
