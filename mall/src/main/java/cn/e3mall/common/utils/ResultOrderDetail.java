package cn.e3mall.common.utils;

import java.util.List;

import cn.e3mall.pojo.TbOrder;
import cn.e3mall.pojo.TbOrderItem;
import cn.e3mall.pojo.TbOrderShipping;

//返回订单详情页数据的封装
public class ResultOrderDetail {

	private List<TbOrderItem> tbOrderItemList;
	private TbOrder order;
	private TbOrderShipping ship;
	public List<TbOrderItem> getTbOrderItemList() {
		return tbOrderItemList;
	}
	public void setTbOrderItemList(List<TbOrderItem> tbOrderItemList) {
		this.tbOrderItemList = tbOrderItemList;
	}
	public TbOrder getOrder() {
		return order;
	}
	public void setOrder(TbOrder order) {
		this.order = order;
	}
	public TbOrderShipping getShip() {
		return ship;
	}
	public void setShip(TbOrderShipping ship) {
		this.ship = ship;
	}
	
}
