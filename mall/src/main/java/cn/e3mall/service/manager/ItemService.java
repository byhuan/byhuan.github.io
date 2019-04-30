package cn.e3mall.service.manager;

import java.util.List;

import cn.e3mall.common.pojo.EasyUIGetDataFY;
import cn.e3mall.common.utils.E3Result;
import cn.e3mall.pojo.TbImages;
import cn.e3mall.pojo.TbItem;
import cn.e3mall.pojo.TbItemDesc;

/*
 * 对于商品信息的获取
 * 添加
 * 编辑
 * 删除
 * 更新
 * 
 * 服务提供给后台管理使用
 * 服务还提供给item查询商品信息使用
 */

public interface ItemService {
	
	// 获取商品详情
	TbItemDesc selectItemDesc(Long id);
	
	TbItem getItemById(long itemId);
	
	/*
	 * 主页面使用
	 */
	//随机获取优选商品
	List<TbItem> selectItemList();
	//随机获取热门商品
	List<TbItem> selectHotItemList();
	/*
	 * 商品详情页显示
	 */
	//推荐浏览本商品的人还浏览过
	List<TbItem> selectBuyItemList(Long itemId);
	
	/*
	 * 订单页面使用
	 */
	//获取4个热卖商品
	List<TbItem> selectHotMaiItemList();
	//查照片信息
	List<TbImages> selectImages(Long id);
}
