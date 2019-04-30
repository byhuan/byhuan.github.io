package cn.e3mall.service.content.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.e3mall.common.pojo.EasyUICateDate;
import cn.e3mall.common.utils.E3Result;
import cn.e3mall.mapper.TbContentCategoryMapper;
import cn.e3mall.pojo.TbContentCategory;
import cn.e3mall.pojo.TbContentCategoryExample;
import cn.e3mall.pojo.TbContentCategoryExample.Criteria;
import cn.e3mall.service.content.ContentCateService;

@Service
public class ContentCateServiceImpl implements ContentCateService{

	@Autowired
	private TbContentCategoryMapper tbContentCategoryMapper;
	
	@Override
	public List<EasyUICateDate> getCateList(Long parentId) {

		List<EasyUICateDate> easyUiCateDateList = new ArrayList<>();
		TbContentCategoryExample example = new TbContentCategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(parentId);
		List<TbContentCategory> cateList = tbContentCategoryMapper.selectByExample(example);
		
		for (TbContentCategory tbContentCategory : cateList) {
			EasyUICateDate cateDate = new EasyUICateDate();
			cateDate.setId(tbContentCategory.getId());
			cateDate.setText(tbContentCategory.getName());
			cateDate.setState(tbContentCategory.getIsParent()?"closed":"open");
			
			easyUiCateDateList.add(cateDate);
		}
		return easyUiCateDateList;
	}

	@Override
	public E3Result AddCateNode(Long parentId, String name) {

		TbContentCategory category = new TbContentCategory();
		category.setCreated(new Date());
		category.setIsParent(false);
		category.setParentId(parentId);
		category.setSortOrder(1);
		category.setName(name);
		category.setUpdated(new Date());
		category.setStatus(1);
		
		TbContentCategory category2 = tbContentCategoryMapper.selectByPrimaryKey(parentId);
		if(!category2.getIsParent()){
			category2.setIsParent(true);
		}
		tbContentCategoryMapper.updateByPrimaryKey(category2);
		tbContentCategoryMapper.insertSelective(category);
		
		E3Result e = new E3Result();
		e.setStatus(200);
		e.setData(category);
		return e;
	}

	@Override
	public void UpdateCateName(Long id, String name) {
		TbContentCategory category = new TbContentCategory();
		category.setId(id);
		category.setName(name);
		
		tbContentCategoryMapper.updateByPrimaryKeySelective(category);
	}

	@Override
	public E3Result DeleteCateNode(Long id) {
		E3Result result = new E3Result();
		TbContentCategory category = tbContentCategoryMapper.selectByPrimaryKey(id);
		if(category.getIsParent()){
			result.setStatus(0);
			return result;
		}
		tbContentCategoryMapper.deleteByPrimaryKey(id);
		result.setStatus(200);
		return result;
	}

}
