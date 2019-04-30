package cn.e3mall.service.search;

import cn.e3mall.common.pojo.SearchPageItemList;
import cn.e3mall.common.utils.E3Result;

/*
 * 实现搜索功能
 * 并且用于实现后台中的把数据库信息一键同步到索引库
 * 给e3-manager-web提供服务
 * 给e3-search-web提供搜索服务
 */

public interface SearchItemService {
	//把数据递交到索引库
	E3Result setItemListToIndex();
	
	//实现搜索功能(搜索框搜索)
	SearchPageItemList SearchItemByKeyword(String keyword,Integer page,Integer rows);

	//清空索引库
	E3Result delItemListToIndex();
	//根据分类搜索
	SearchPageItemList SearchItemByCid(long cid, Integer page, int i);
}
