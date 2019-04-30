package cn.e3mall.controllor.order;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;
import com.alipay.api.internal.util.AlipaySignature;

import cn.e3mall.common.utils.AlipayConfig;
import cn.e3mall.common.utils.E3Result;
import cn.e3mall.common.utils.ResultForOrderInfo;
import cn.e3mall.pojo.Address;
import cn.e3mall.pojo.TbAddress;
import cn.e3mall.pojo.TbAreas;
import cn.e3mall.pojo.TbCities;
import cn.e3mall.pojo.TbItem;
import cn.e3mall.pojo.TbOrderItem;
import cn.e3mall.pojo.TbProvinces;
import cn.e3mall.pojo.TbUser;
import cn.e3mall.service.cart.CartService;
import cn.e3mall.service.manager.ItemService;
import cn.e3mall.service.order.OrderService;

/**
 * 订单管理Controller
 */
@Controller
public class OrderController {

	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ItemService itemService;

	/*
	 * 直接跳到商品结算页
	 */
	@RequestMapping("/order/orderCart")
	public String showOrderCart(Integer[] ids, HttpServletRequest request, Model model) {
		// 取用户
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");

		//由于是ajax请求，所以在这里进行一个判断，用户是否登陆
//		if(user == null){
//			E3Result r = new E3Result();
//			r.setStatus(300);
//			return r;
//		}
		List<TbItem> cartList = null;

		//标记，用于判定是否勾选了复选框
		boolean flag = false;
		// 如果ids为空，证明没有勾选，代表购物车中所有商品都要购买，根据用户id取购物车列表
		if (ids.length == 0) {
			cartList = cartService.getCartList(user.getId());
			flag = true;
		} else {
			// 从购物车中取要购买商品的信息
			cartList = cartService.getCartListByIds(user.getId(), ids);
		}

		// 调用服务生成订单
		E3Result e3Result = orderService.createOrder(user, cartList);
		// 如果订单生成成功，需要删除购物车中选中的商品
		if (e3Result.getStatus() == 200) {
			if(flag ==true){
				//删除购物车所有商品
				cartService.clearCartItem(user.getId());
			}else{
				// 删除购物车选中商品
				for (Integer id : ids) {
					cartService.deleteCart(user.getId(), id.longValue());
				}
			}
		}

		// 把当前的订单id传到前台
		return "redirect:/order/getOrderInfo?oid="+e3Result.getData();
	}

	// 商品结算页
	@RequestMapping("/order/getOrderInfo")
	public String getOrderInfo(Model model, HttpServletRequest request, String oid) {
		// 取用户
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");

		// 查该用户所存的地址信息（可能为空）
		List<TbAddress> addrs = orderService.selectAddressList(user.getId());
		model.addAttribute("addressList", addrs);
		// 查订单的商品信息
		List<TbOrderItem> orderItemList = orderService.selectOrderItemList(oid);
		model.addAttribute("itemList", orderItemList);

		// 订单的商品数量，商品总金额
		ResultForOrderInfo result = new ResultForOrderInfo();
		int num = 0;
		int price = 0;
		for (TbOrderItem tbOrderItem : orderItemList) {
			num += tbOrderItem.getNum();
			price += tbOrderItem.getTotalFee();
		}
		result.setNum(num);
		result.setPrice(price);

		model.addAttribute("con", result);

		return "getOrderInfo";
	}

	// 地址省市区动态显示
	@RequestMapping("/order/orderAddress")
	@ResponseBody
	public E3Result orderAddress(Integer flag, String id) {

		System.out.println(flag);

		// 省
		if (flag == 1) {
			List<TbProvinces> proList = orderService.selectProList();
			return E3Result.ok(proList);
		}
		// 市
		if (flag == 2) {
			List<TbCities> cityList = orderService.selectCityList(id);
			return E3Result.ok(cityList);
		}
		// 区
		List<TbAreas> areaList = orderService.selectAreaList(id);
		return E3Result.ok(areaList);
	}

	// 保存地址信息
	@RequestMapping("/order/orderAddressChange")
	@ResponseBody
	public E3Result orderAddressChange(Address address, HttpServletRequest request) {
		// 取用户
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");

		System.out.println(address.getContact());

		// 补全address
		TbAddress add = new TbAddress();
		add.setUserId(user.getId().toString());
		add.setCreateDate(new Date());
		add.setAddress(address.getAddress());
		add.setAlias(address.getAlias());
		add.setCityId(address.getCityId());
		add.setContact(address.getContact());
		add.setMobile(address.getMobile());
		add.setProvinceId(address.getProvinceId());
		add.setTownId(address.getTownId());
		// 存入数据库
		E3Result result = orderService.saveOrderAddress(add);
		return result;
	}

	// 递交订单（跳转到支付页）(微信支付)
	// @RequestMapping("/order/sendOrderToPay")
	// public String sendOrderToPay(@RequestParam String oid,@RequestParam
	// String addid,
	// @RequestParam String price,Model model){
	// if(addid!=null){
	// //对于订单地址进行补充
	// E3Result r = orderService.changeOrderAdd(addid,oid);
	// }
	// //递交到微信的支付服务
	// E3Result result = orderService.sendOrderToPay(oid,"1");
	// Map data = (Map) result.getData();
	// System.out.println(data.get("code_url"));
	// model.addAttribute("map", result.getData());
	// return "pay";
	// }

	// 递交订单（支付宝支付）
	@RequestMapping("/order/sendOrderToPay")
	@ResponseBody
	public String sendOrderToPay(String oid, String addid, String price,
			Model model) {
		if (addid != null) {
			// 对于订单地址进行补充
			E3Result r = orderService.changeOrderAdd(addid, oid);
		}
		// 递交到微信的支付服务
		E3Result result = orderService.sendOrderToPay(oid, price);
		String str = (String) result.getData();
		return str;
	}

	// 检测支付状态 （微信支付）
	// @RequestMapping("/order/queryPayStatus")
	// @ResponseBody
	// public E3Result queryPayStatus(String oid){
	// E3Result result=null;
	// int x=0;
	// while(true){
	// //调用查询接口
	// Map<String,String> map = orderService.queryPayStatus(oid);
	// if(map==null){//出错
	// result=new E3Result(404, "支付出错", null);
	// break;
	// }
	// if(map.get("trade_state").equals("SUCCESS")){//如果成功
	// result=new E3Result(200, "支付成功", null);
	// break;
	// }
	//
	// x++;
	// if(x>=100){
	// result=new E3Result(303, "二维码超时", null);
	// break;
	// }
	// try {
	// Thread.sleep(3000);//间隔三秒
	// } catch (InterruptedException e) {
	// e.printStackTrace();
	// }
	// }
	// return result;
	// }

	// 支付同步通知(同步过来的通知先不更新订单表，只进行页面跳转)
	@RequestMapping("/order/return_url")
	public String returnUrl(HttpServletRequest request,Model model) {
		// 获取支付宝GET过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			try {
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			params.put(name, valueStr);
		}

		boolean signVerified = false;
		try {
			// 调用SDK验证签名
			signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
					AlipayConfig.sign_type);
		} catch (AlipayApiException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
		}
		String total_amount = null;
		// 验证过后逻辑
		if (signVerified) {
			try {
				// 商户订单号
				String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
				// 支付宝交易号
				String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");
				// 付款金额
				total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			//跳转到成功页面
			model.addAttribute("price", total_amount);
			return "paysuccess";
		} else {
			//跳转到失败页面
			return "payfail";
		}
	}
	
	//异步通知，在异步通知中更新订单状态
	@RequestMapping("/order/notify_url")
	public void notifyUrl(HttpServletRequest request){
		//获取支付宝POST过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			try {
				valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			params.put(name, valueStr);
		}
		
		boolean signVerified = false;
		try {
			signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
		} catch (AlipayApiException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} //调用SDK验证签名

		//——请在这里编写您的程序（以下代码仅作参考）——
		
		/* 实际验证过程建议商户务必添加以下校验：
		1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
		3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		4、验证app_id是否为该商户本身。
		*/
		if(signVerified) {//验证成功
			String trade_status = null;
			String out_trade_no = null;
			String trade_no = null;
			String receipt_amount = null;
			try {
				//商户订单号
				out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
				//支付宝交易号
				trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
				//交易状态
				trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
				//实收金额
				receipt_amount = new String(request.getParameter("receipt_amount").getBytes("ISO-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
			
			if(trade_status.equals("TRADE_FINISHED")){
				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
					
				//注意：
				//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
			}else if (trade_status.equals("TRADE_SUCCESS")){
				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
				// 支付成功，更新订单表
				E3Result result = orderService.orderSuccess(out_trade_no, receipt_amount,trade_no);
				//注意：
				//付款完成后，支付宝系统发送该交易状态通知
			}
			
			
		}else {//验证失败

		
			//调试用，写文本函数记录程序运行情况是否正常
			//String sWord = AlipaySignature.getSignCheckContentV1(params);
			//AlipayConfig.logResult(sWord);
		}
	}

	// 支付成功（微信支付）
//	@RequestMapping("/order/sendOrderSuccess")
//	@ResponseBody
//	public E3Result sendOrderSuccess(@RequestParam String oid, @RequestParam String price, Model model) {
//
//		// 支付成功，更新订单表
//		E3Result result = orderService.orderSuccess(oid, price);
//
//		return null;
//	}

	// 支付失败（微信支付）
//	@RequestMapping("/order/sendOrderFail")
//	public String orderFail() {
//		return "payfail";
//	}
}
