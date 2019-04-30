package cn.e3mall.common.pojo;

import java.io.Serializable;
import java.util.List;

/*
 * 获取分页数据
 */

public class EasyUIGetDataFY implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -8432020547346998386L;
	private Long total;
	private List rows;
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	
}
