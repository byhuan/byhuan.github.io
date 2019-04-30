package cn.e3mall.service.content;

import java.util.List;

import cn.e3mall.common.pojo.MainMenuResult;
import cn.e3mall.pojo.TbContent;
import cn.e3mall.pojo.TbItemCat;

/*
 * 为首页的商品信息和各分类的显示
 * 提供数据
 */

public interface IndexContentService {
	
	//为首页的焦点轮播广告图提供内容
	List<TbContent> getContentListForAd1(Long cateId);
	//获取首页分类列表数据
	List<MainMenuResult> getMainMenuByCid(long cid);
}
