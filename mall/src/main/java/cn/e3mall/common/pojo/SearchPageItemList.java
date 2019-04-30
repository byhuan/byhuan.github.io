package cn.e3mall.common.pojo;

import java.io.Serializable;
import java.util.List;

/*
 * 对要展示在搜索页面的信息的封装
 */

public class SearchPageItemList implements Serializable{
	
	private Integer totalPages;
	private Long recourdCount;
	private Integer page;
	private List<SearchItem> itemList;
	
	
	public Integer getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}
	public Long getRecourdCount() {
		return recourdCount;
	}
	public void setRecourdCount(Long recourdCount) {
		this.recourdCount = recourdCount;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public List<SearchItem> getItemList() {
		return itemList;
	}
	public void setItemList(List<SearchItem> itemList) {
		this.itemList = itemList;
	}
	
}
