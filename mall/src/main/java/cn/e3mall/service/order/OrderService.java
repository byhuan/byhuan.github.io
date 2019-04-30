package cn.e3mall.service.order;

import java.util.List;
import java.util.Map;

import cn.e3mall.common.utils.E3Result;
import cn.e3mall.common.utils.ResultOrderDetail;
import cn.e3mall.common.utils.ResultOrderPageInfo;
import cn.e3mall.pojo.OrderInfo;
import cn.e3mall.pojo.TbAddress;
import cn.e3mall.pojo.TbAreas;
import cn.e3mall.pojo.TbCities;
import cn.e3mall.pojo.TbItem;
import cn.e3mall.pojo.TbOrderItem;
import cn.e3mall.pojo.TbProvinces;
import cn.e3mall.pojo.TbUser;

public interface OrderService {

	//创建订单
	E3Result createOrder(TbUser user, List<TbItem> cartList);
	////查该用户所存的地址信息
	List<TbAddress> selectAddressList(Long id);
	//查订单的商品信息
	List<TbOrderItem> selectOrderItemList(String oid);
	//查省
	List<TbProvinces> selectProList();
	//查市
	List<TbCities> selectCityList(String id);
	//查区
	List<TbAreas> selectAreaList(String id);
	//保存地址
	E3Result saveOrderAddress(TbAddress address);
	//递交订单，跳转到支付页
	E3Result sendOrderToPay(String oid,  String price);
	//补全订单地址
	E3Result changeOrderAdd(String addid,String pid);
	//检测支付状态（微信支付）
	//Map queryPayStatus(String oid);
	//支付成功，更新订单表状态
	E3Result orderSuccess(String oid, String price, String trade_no);
	//查找未付款订单数据
	List<ResultOrderPageInfo> selectNoPayOrder(Long id);
	//取消订单
	E3Result delOrder(String oid);
	//订单详情页
	ResultOrderDetail orderDetail(String oid);
	//查找已付款未发货订单数据
	List<ResultOrderPageInfo> selectWhitSendOrder(Long id);
	//查找已付款等待收货订单数据
	List<ResultOrderPageInfo> selectWhitGetOrder(Long id);
	//确认收货
	void sureGet(String oid);
}
