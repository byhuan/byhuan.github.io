package cn.e3mall.service.content;

import java.util.List;

import cn.e3mall.common.pojo.EasyUICateDate;
import cn.e3mall.common.utils.E3Result;

/*
 * cms系统分类管理
 * 服务提供给e3-manager-web
 */
public interface ContentCateService {
	//分类列表
	List<EasyUICateDate> getCateList(Long parentId);
	
	//新增分类项
	E3Result AddCateNode(Long parentId,String name);
	//分类项重命名
	void UpdateCateName(Long id,String name);
	//删除分类项
	E3Result DeleteCateNode(Long id);
}
