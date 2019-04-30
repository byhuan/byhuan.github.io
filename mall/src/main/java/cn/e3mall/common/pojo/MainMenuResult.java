package cn.e3mall.common.pojo;

import java.util.List;

import cn.e3mall.pojo.TbItemCat;

public class MainMenuResult {

	//用于存储父分类
	private TbItemCat itemCat;
	//用于存储子分类
	private List<TbItemCat> itemCats;
	public TbItemCat getItemCat() {
		return itemCat;
	}
	public void setItemCat(TbItemCat itemCat) {
		this.itemCat = itemCat;
	}
	public List<TbItemCat> getItemCats() {
		return itemCats;
	}
	public void setItemCats(List<TbItemCat> itemCats) {
		this.itemCats = itemCats;
	}
	
}
