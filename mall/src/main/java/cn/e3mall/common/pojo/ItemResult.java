package cn.e3mall.common.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import cn.e3mall.pojo.TbImages;
import cn.e3mall.pojo.TbItem;

public class ItemResult implements Serializable {

	/**
	* 
	*/
	private static final long serialVersionUID = 549434102833689979L;

	private TbItem item;

	private List<TbImages> images;

	public TbItem getItem() {
		return item;
	}

	public void setItem(TbItem item) {
		this.item = item;
	}

	public List<TbImages> getImages() {
		return images;
	}

	public void setImages(List<TbImages> images) {
		this.images = images;
	}

}
