package cn.e3mall.mapper;

import java.util.List;

import cn.e3mall.common.pojo.SearchItem;

public interface SearchItemMapper {
	public List<SearchItem> getItemList();
	
	public SearchItem getItemById(Long itemId);
}
