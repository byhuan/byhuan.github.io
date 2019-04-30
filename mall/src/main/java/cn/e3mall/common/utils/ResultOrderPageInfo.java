package cn.e3mall.common.utils;

import java.util.List;

import cn.e3mall.pojo.TbOrderItem;

public class ResultOrderPageInfo {

	private List<TbOrderItem> itemList;
	//订单总金额
    private Long totlePrice;
	public List<TbOrderItem> getItemList() {
		return itemList;
	}

	public void setItemList(List<TbOrderItem> itemList) {
		this.itemList = itemList;
	}

	public Long getTotlePrice() {
		return totlePrice;
	}

	public void setTotlePrice(Long totlePrice) {
		this.totlePrice = totlePrice;
	}
	
}
