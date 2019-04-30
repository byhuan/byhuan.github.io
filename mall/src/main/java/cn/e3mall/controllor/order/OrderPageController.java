package cn.e3mall.controllor.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.e3mall.common.utils.E3Result;
import cn.e3mall.common.utils.ResultOrderDetail;
import cn.e3mall.common.utils.ResultOrderPageInfo;
import cn.e3mall.pojo.TbItem;
import cn.e3mall.pojo.TbUser;
import cn.e3mall.service.manager.ItemService;
import cn.e3mall.service.order.OrderService;

@Controller
public class OrderPageController {

	@Autowired
	private OrderService orderService;
	@Autowired
	private ItemService itemService;
	
	//我的订单主页面
	@RequestMapping("/order/home-index")
	public String OrderIndex(Model model,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");
		
		//List<TbItem> itemList = itemService.selectHotMaiItemList();
		model.addAttribute("user", user);
		//model.addAttribute("itemList", itemList);
		return "home-order-index";
	}
	
	//我的订单，未付款界面
	@RequestMapping("/order/home-order-pay")
	public String HomeOrderPay(Model model,HttpServletRequest request){
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");
		//推荐热卖商品
		List<TbItem> itemList = itemService.selectHotMaiItemList();
		
		//未付款商品信息
		List<ResultOrderPageInfo> r = orderService.selectNoPayOrder(user.getId());
		model.addAttribute("user", user);
		model.addAttribute("itemList", itemList);
		model.addAttribute("orderPageInfo", r);
		
		return "home-order-pay";
	}
	
	//取消订单
	@RequestMapping("/order/delOrder/{oid}")
	public String delOrder(@PathVariable String oid){
		
		E3Result r = orderService.delOrder(oid);
		
		return "redirect:/order/home-order-pay";
	}
	
	//订单详情
	@RequestMapping("/order/detail/{oid}")
	public String orderDetail(@PathVariable String oid,Model model
			,HttpServletRequest request){
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");
		//封装的订单详情页数据
		ResultOrderDetail r = orderService.orderDetail(oid);
		
		//推荐热卖商品
		List<TbItem> itemList = itemService.selectHotMaiItemList();
		
		model.addAttribute("orderDetail", r);
		model.addAttribute("user", user);
		model.addAttribute("itemList", itemList);
		return "home-orderDetail";
	}
	
	//我的订单，待发货页面（已付款）
	@RequestMapping("/order/home-order-send")
	public String homeOrderSend(Model model,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");
		//推荐热卖商品
		List<TbItem> itemList = itemService.selectHotMaiItemList();
		model.addAttribute("user", user);
		model.addAttribute("itemList", itemList);
		
		List<ResultOrderPageInfo> r = orderService.selectWhitSendOrder(user.getId());
		model.addAttribute("orderPageSend", r);
		return "home-order-send";
	}
	
	//我的订单待收货订单数据
	@RequestMapping("/order/home-order-receive")
	public String homeOrderReceive(Model model,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");
		//推荐热卖商品
		List<TbItem> itemList = itemService.selectHotMaiItemList();
		model.addAttribute("user", user);
		model.addAttribute("itemList", itemList);
		
		List<ResultOrderPageInfo> r = orderService.selectWhitGetOrder(user.getId());
		model.addAttribute("orderPageGet", r);
		return "home-order-receive";
	}
	
	//确认收货，修改订单状态
	@RequestMapping("/order/sureGet/{oid}")
	public String sureGet(@PathVariable String oid){
		
		orderService.sureGet(oid);
		
		return "redirect:/order/home-order-receive";
	}
}
