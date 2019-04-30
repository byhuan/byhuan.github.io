package cn.e3mall.service.cart.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.e3mall.common.redis.JedisClient;
import cn.e3mall.common.utils.E3Result;
import cn.e3mall.common.utils.JsonUtils;
import cn.e3mall.mapper.TbItemMapper;
import cn.e3mall.pojo.TbItem;
import cn.e3mall.service.cart.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private JedisClient jedisClient;
	@Autowired
	private TbItemMapper itemMapper;

	// 添加购物车
	@Override
	public E3Result addCart(Long uId, Long proId, Integer num) {
		
		Boolean exists = jedisClient.hexists("CART:" + uId, proId + "");
		//在缓存中不存在该商品
		if (!exists) {
			//查询出该商品具体信息
			TbItem item = itemMapper.selectByPrimaryKey(proId);
			//把数量加入
			item.setNum(num);
			jedisClient.hset("CART:" + uId, proId + "", JsonUtils.objectToJson(item));
			return E3Result.ok();
		}

		String hget = jedisClient.hget("CART:" + uId, proId + "");
		TbItem item = JsonUtils.jsonToPojo(hget, TbItem.class);
		item.setNum(item.getNum() + num);

		jedisClient.hset("CART:" + uId, proId + "", JsonUtils.objectToJson(item));
		return E3Result.ok();
	}

	// 登录后合并购物车
	public E3Result megerCart(Long uId, List<TbItem> cartList) {
		for (TbItem tbItem : cartList) {
			addCart(uId, tbItem.getId(), tbItem.getNum());
		}

		return E3Result.ok();
	}

	// 查列表
	@Override
	public List<TbItem> selectCartList(Long uId) {
		List<TbItem> list = new ArrayList<>();
		List<String> hvals = jedisClient.hvals("CART:" + uId);
		for (String string : hvals) {
			TbItem item = JsonUtils.jsonToPojo(string, TbItem.class);
			list.add(item);
		}
		return list;
	}

	// 更新购物车
	public E3Result updateCart(Long uId, Long proId, Integer num) {

		String hget = jedisClient.hget("CART:" + uId, proId + "");
		TbItem item = JsonUtils.jsonToPojo(hget, TbItem.class);
		item.setNum(num);

		jedisClient.hset("CART:" + uId, proId + "", JsonUtils.objectToJson(item));
		return E3Result.ok();
	}

	// 删除商品
	public E3Result deleteCart(Long uId, Long proId) {

		jedisClient.hdel("CART:" + uId, proId + "");
		return E3Result.ok();
	}

	@Override
	public List<TbItem> getCartList(long userId) {
		// 根据用户id查询购车列表
		List<String> jsonList = jedisClient.hvals("CART" + ":" + userId);
		List<TbItem> itemList = new ArrayList<>();
		for (String string : jsonList) {
			// 创建一个TbItem对象
			TbItem item = JsonUtils.jsonToPojo(string, TbItem.class);
			// 添加到列表
			itemList.add(item);
		}
		return itemList;
	}

	@Override
	public E3Result clearCartItem(long userId) {
		// 删除购物车信息
		jedisClient.del("CART" + ":" + userId);
		return E3Result.ok();
	}

	@Override
	public List<TbItem> getCartListByIds(Long id, Integer[] ids) {
		// 根据用户id查询购车列表
		List<String> jsonList = jedisClient.hvals("CART" + ":" + id);
		List<TbItem> itemList = new ArrayList<>();
		for (String string : jsonList) {
			// 创建一个TbItem对象
			TbItem item = JsonUtils.jsonToPojo(string, TbItem.class);
			for (Integer i : ids) {
				if(item.getId() == i.longValue()){
					// 添加到列表
					itemList.add(item);
					break;
				}
			}
		}
		
		return itemList;
	}

}
