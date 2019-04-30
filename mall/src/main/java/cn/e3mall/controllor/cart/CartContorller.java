package cn.e3mall.controllor.cart;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.e3mall.common.utils.CookieUtils;
import cn.e3mall.common.utils.E3Result;
import cn.e3mall.common.utils.JsonUtils;
import cn.e3mall.pojo.TbItem;
import cn.e3mall.pojo.TbUser;
import cn.e3mall.service.cart.CartService;
import cn.e3mall.service.manager.ItemService;

@Controller
public class CartContorller {

	@Autowired
	private ItemService itemService;
	@Autowired
	private CartService cartService;

	// 添加购物车
	@RequestMapping("/cart/add/{proId}")
	public String addCart(@PathVariable Long proId, @RequestParam(defaultValue = "1") Integer num,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");
		if (user != null) {
			System.out.println("denglu");
			cartService.addCart(user.getId(), proId, num);
			return "cartSuccess";
		}
		System.out.println("weidenglu");
		// 未登录状态，把购物车存入cookie
		List<TbItem> list = getCartListFromCookie(request);
		// 如果购物车存在，先判断要加入的商品是否在购物车中存在
		// 加个flag作为商品是否存在的判断
		Boolean flag = false;
		
		for (TbItem tbItem : list) {
			if (tbItem.getId() == proId.longValue()) {
				flag = true;
				tbItem.setNum(tbItem.getNum() + num);
				break;
			}
		}
		//
		if (!flag) {
			// 查商品数据
			TbItem item = itemService.getItemById(proId);
			// 封装数量
			item.setNum(num);
			list.add(item);
		}
		// 写回cookie
		CookieUtils.setCookie(request, response, "cart", JsonUtils.objectToJson(list), 216000, true);
		return "cartSuccess";
	}

	/**
	 * 从cookie中取购物车列表的处理
	 */
	private List<TbItem> getCartListFromCookie(HttpServletRequest request) {
		String json = CookieUtils.getCookieValue(request, "cart", true);
		// 判断json是否为空
		if (StringUtils.isBlank(json)) {
			return new ArrayList<>();
		}
		// 把json转换成商品列表
		List<TbItem> list = JsonUtils.jsonToList(json, TbItem.class);
		return list;
	}

	// 显示购物车列表
	@RequestMapping("cart/cart")
	public String cartList(Model mosel, HttpServletRequest request, HttpServletResponse response) {
		List<TbItem> jsonToList;
		// 从cookie中取数据
		jsonToList = getCartListFromCookie(request);
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");
		if (user != null) {
			// 从cookie中取购物车列表
			// 如果不为空，把cookie中的购物车商品和服务端的购物车商品合并。
			cartService.megerCart(user.getId(), jsonToList);
			// 把cookie中的购物车删除
			CookieUtils.deleteCookie(request, response, "cart");
			jsonToList = cartService.selectCartList(user.getId());
		}
		mosel.addAttribute("cartList", jsonToList);
		return "cart";
	}

	// 更新购物车中的商品数量
	@RequestMapping("/cart/update/num/{proId}/{num}")
	@ResponseBody
	public E3Result update(@PathVariable Long proId, @PathVariable Integer num, HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");
		if (user != null) {
			cartService.updateCart(user.getId(), proId, num);
			return E3Result.ok();
		}

		// 从cookie中取数据
		List<TbItem> list = getCartListFromCookie(request);
		for (TbItem tbItem : list) {
			if (tbItem.getId() == proId.longValue()) {
				tbItem.setNum(num);
				break;
			}
		}
		// 回写cookie
		CookieUtils.setCookie(request, response, "cart", JsonUtils.objectToJson(list), 216000, true);
		return E3Result.ok();
	}

	// 删除购物车中数据
	@RequestMapping("/cart/delete/{proId}")
	public String deleteItem(@PathVariable Long proId, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");
		if (user != null) {
			cartService.deleteCart(user.getId(), proId);
			return "redirect:/cart/cart.html";
		}

		// 取数据
		List<TbItem> list = getCartListFromCookie(request);
		for (TbItem tbItem : list) {
			if (tbItem.getId() == proId.longValue()) {
				list.remove(tbItem);
				break;
			}
		}
		// 写回cookie
		CookieUtils.setCookie(request, response, "cart", JsonUtils.objectToJson(list), 216000, true);
		return "redirect:/cart/cart.html";
	}

	// 删除选中的数据
	@RequestMapping("/cart/delete/select")
	@ResponseBody
	public E3Result delSelect(@RequestBody Integer[] ids, HttpServletRequest request, HttpServletResponse response) {

		// 登录状态
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");
		if (user != null) {
			for (Integer id : ids) {
				cartService.deleteCart(user.getId(), id.longValue());
			}
			return E3Result.build(200, "成功");
		}

		// 未登录状态
		// 取数据
		List<TbItem> list = getCartListFromCookie(request);
		for (Integer id : ids) {
			for (TbItem tbItem : list) {
				if (tbItem.getId() == id.longValue()) {
					list.remove(tbItem);
					break;
				}
			}
		}
		
		// 写回cookie
		CookieUtils.setCookie(request, response, "cart", JsonUtils.objectToJson(list), 216000, true);
		
		return E3Result.build(200, "成功");
	}

	// 清空购物车
	@RequestMapping("/cart/clear-all")
	public String clearAll(HttpServletRequest request, HttpServletResponse response) {

		// 登录状态
		HttpSession session = request.getSession();
		TbUser user = (TbUser) session.getAttribute("user");
		if (user != null) {
			cartService.clearCartItem(user.getId());
			return "redirect:/cart/cart.html";
		}
		// 未登录状态
		// 清除cookie
		CookieUtils.setCookie(request, response, "cart", null, 216000, true);
		return "redirect:/cart/cart.html";
	}
}
