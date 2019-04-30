package cn.e3mall.service.content.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.e3mall.common.pojo.MainMenuResult;
import cn.e3mall.common.redis.JedisClient;
import cn.e3mall.common.utils.JsonUtils;
import cn.e3mall.mapper.TbContentMapper;
import cn.e3mall.mapper.TbItemCatMapper;
import cn.e3mall.pojo.TbContent;
import cn.e3mall.pojo.TbContentExample;
import cn.e3mall.pojo.TbContentExample.Criteria;
import cn.e3mall.pojo.TbItemCat;
import cn.e3mall.pojo.TbItemCatExample;
import cn.e3mall.service.content.IndexContentService;

@Service
public class IndexContentServiceImpl implements IndexContentService {

	@Autowired
	private TbContentMapper tbContentMapper;
	@Autowired
	private TbItemCatMapper catMapper;
	@Autowired
	private JedisClient jedisClient;

	@Override
	public List<TbContent> getContentListForAd1(Long cateId) {

		// 查redis缓存 不存在查数据库 存在直接返回
		try {
			// 查看缓存是否存在
			String json = jedisClient.hget("contentList", cateId + "");
			if (StringUtils.isNotBlank(json)) {
				List<TbContent> list = JsonUtils.jsonToList(json, TbContent.class);
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		TbContentExample example = new TbContentExample();
		Criteria criteria = example.createCriteria();
		criteria.andCategoryIdEqualTo(cateId);
		List<TbContent> list = tbContentMapper.selectByExample(example);
		String string = JsonUtils.objectToJson(list);
		// 添加缓存
		try {
			jedisClient.hset("contentList", cateId + "", string);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<MainMenuResult> getMainMenuByCid(long cid) {

		// 查redis缓存 不存在查数据库 存在直接返回
		try {
			// 查看缓存是否存在
			String json = jedisClient.hget("itemCatList", cid + "");
			if (StringUtils.isNotBlank(json)) {
				List<MainMenuResult> list = JsonUtils.jsonToList(json, MainMenuResult.class);
				return list;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		//从数据库查父数据数据
		TbItemCatExample example = new TbItemCatExample();
		cn.e3mall.pojo.TbItemCatExample.Criteria criteria = example.createCriteria();
		criteria.andParentIdEqualTo(cid);
		List<TbItemCat> list = catMapper.selectByExample(example);
		
		//返回对象
		List<MainMenuResult> result = new ArrayList<>();
		//查每个父分类的子分类
		for(int i = 0;i<list.size();i++){
			example.clear();
			cn.e3mall.pojo.TbItemCatExample.Criteria criteria1 = example.createCriteria();
			criteria1.andParentIdEqualTo(list.get(i).getId());
			List<TbItemCat> list2 = catMapper.selectByExample(example);
			MainMenuResult menu = new MainMenuResult();
			menu.setItemCat(list.get(i));
			menu.setItemCats(list2);
			result.add(menu);
		}
		
		String string = JsonUtils.objectToJson(result);
		// 添加缓存
		try {
			jedisClient.hset("itemCatList", cid + "", string);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
