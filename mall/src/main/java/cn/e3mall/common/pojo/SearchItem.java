package cn.e3mall.common.pojo;

import java.io.Serializable;

/*
 * 对搜索到的单个信息进行封装的pojo
 */

public class SearchItem implements Serializable{
	private String id;
	private String title;
	private String sell_point;
	private Long price;
	private String image;
	private String categroy_name;
	
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSell_point() {
		return sell_point;
	}
	public void setSell_point(String sell_point) {
		this.sell_point = sell_point;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getCategroy_name() {
		return categroy_name;
	}
	public void setCategroy_name(String categroy_name) {
		this.categroy_name = categroy_name;
	}
	
	
}
