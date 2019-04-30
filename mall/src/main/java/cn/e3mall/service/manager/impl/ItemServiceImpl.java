package cn.e3mall.service.manager.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.annotation.Around;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;


import cn.e3mall.common.pojo.EasyUIGetDataFY;
import cn.e3mall.common.redis.JedisClient;
import cn.e3mall.common.utils.E3Result;
import cn.e3mall.common.utils.IDUtils;
import cn.e3mall.common.utils.JsonUtils;
import cn.e3mall.mapper.TbImagesMapper;
import cn.e3mall.mapper.TbItemDescMapper;
import cn.e3mall.mapper.TbItemMapper;
import cn.e3mall.pagehelper.PageHelper;
import cn.e3mall.pagehelper.PageInfo;
import cn.e3mall.pojo.TbImages;
import cn.e3mall.pojo.TbImagesExample;
import cn.e3mall.pojo.TbImagesExample.Criteria;
import cn.e3mall.pojo.TbItem;
import cn.e3mall.pojo.TbItemDesc;
import cn.e3mall.pojo.TbItemExample;
import cn.e3mall.service.manager.ItemService;

@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	private TbItemMapper mapper;
	@Autowired
	private TbImagesMapper imagesMapper;
	@Resource
	private Destination topicDestination;
	@Autowired
	private JedisClient jedisClient;
	@Autowired
	private TbItemDescMapper itemDescMapper;
	@Autowired
	private TbItemMapper itemMapper;

	//主页面使用，随机获取优选商品
	@Override
	public List<TbItem> selectItemList() {
		List<TbItem> itemList = mapper.selectItemList();
		
		if(itemList.size()==0){
			return null;
		}
		
		return itemList;
	}


	//主页面使用，随机获取热门商品
	@Override
	public List<TbItem> selectHotItemList() {
		List<TbItem> list = mapper.selectHotItemList();
		
		if(list.size()==0){
			return null;
		}
		
		return list;
	}

	
	//订单页面使用，随机获取（4个）热卖商品
		@Override
		public List<TbItem> selectHotMaiItemList() {
			List<TbItem> list = mapper.selectHotMaiItemList();
			
			if(list.size()==0){
				return null;
			}
			
			return list;
		}


	//商品详情页使用，推荐商品
	@Override
	public List<TbItem> selectBuyItemList(Long itemId) {
		//先查到该商品
		TbItem item = mapper.selectByPrimaryKey(itemId);
		//再从数据库中查找3个与之相似的商品（cid相同）
		List<TbItem> buyItemList = mapper.selectBuyItemList(item.getCid());
		
		if(buyItemList.size()==0){
			return null;
		}
		
		return buyItemList;
	}

	//查商品详细图片
	@Override
	public List<TbImages> selectImages(Long id) {
		
		TbImagesExample example = new TbImagesExample();
		Criteria criteria = example.createCriteria();
		criteria.andItemIdEqualTo(id.toString());
		List<TbImages> list = imagesMapper.selectByExample(example);
		
		return list;
	}
	
	@Override
	public TbItemDesc selectItemDesc(Long id) {
			// 检查有没有缓存，有从缓存中获取
			try {
				String string = jedisClient.get("ITEM:" + id + ":ITEM_DESC");
				if (StringUtils.isNotBlank(string)) {
					TbItemDesc desc = JsonUtils.jsonToPojo(string, TbItemDesc.class);
					return desc;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 没有缓存去数据库中查，再存入缓存
			TbItemDesc itemDesc = itemDescMapper.selectByPrimaryKey(id);
			// 加入缓存
			try {
				
				System.out.println("=======加入缓存前=======");
				
				String json = JsonUtils.objectToJson(itemDesc);
				jedisClient.set("ITEM:" + id + ":ITEM_DESC", json);
				// 设置缓存超时时间
				jedisClient.expire("ITEM:" + id + ":ITEM_DESC", 3600);
				
				System.out.println("=======加入缓存后=======");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return itemDesc;
	}

	@Override
	public TbItem getItemById(long itemId) {
		//根据主键查询
		TbItem tbItem = itemMapper.selectByPrimaryKey(itemId);
		return tbItem;
	}

	
}
