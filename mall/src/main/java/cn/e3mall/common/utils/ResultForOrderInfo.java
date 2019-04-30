package cn.e3mall.common.utils;

import java.io.Serializable;

public class ResultForOrderInfo implements Serializable{

	//商品总的个数
	private Integer num;
	//商品的总金额
	private Integer price;
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	
}
