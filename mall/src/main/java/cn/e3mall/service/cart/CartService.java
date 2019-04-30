package cn.e3mall.service.cart;

import java.util.List;

import cn.e3mall.common.utils.E3Result;
import cn.e3mall.pojo.TbItem;

public interface CartService {

	//添加商品进购物车
	public E3Result addCart(Long uId,Long proId,Integer num);
	
	//查购物车列表
	public List<TbItem> selectCartList(Long uId);
	
	//合并登陆前的购物车
	public E3Result megerCart(Long uId,List<TbItem> cartList);
	
	//删除
	public E3Result deleteCart(Long uId,Long proId);
	
	//更新
	public E3Result updateCart(Long uId,Long proId,Integer num);
	
	//获取购物车商品
	List<TbItem> getCartList(long userId);
	
	E3Result clearCartItem(long userId);

	//从购物车中获取要购买商品的信息（通过复选框勾选的）
	public List<TbItem> getCartListByIds(Long id, Integer[] ids);
}
