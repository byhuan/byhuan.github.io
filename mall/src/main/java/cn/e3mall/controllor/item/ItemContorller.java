package cn.e3mall.controllor.item;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.e3mall.common.pojo.ItemResult;
import cn.e3mall.pojo.TbImages;
import cn.e3mall.pojo.TbItem;
import cn.e3mall.pojo.TbItemDesc;
import cn.e3mall.service.manager.ItemService;



/*
 * 商品详情的表现层
 * 引用manager的服务实现展示商品详情
 */

@Controller
public class ItemContorller {

	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/item/{itemId}")
	public String ItemDescData(Model model,@PathVariable Long itemId){
		
		TbItem item = itemService.getItemById(itemId);
		
		//对item进行封装
		ItemResult itemResult = new ItemResult(); 
		itemResult.setItem(item);
		//封装照片
		List<TbImages> images = itemService.selectImages(item.getId());
		itemResult.setImages(images);
		TbItemDesc itemDesc = itemService.selectItemDesc(itemId);
		
		//推荐购买
		List<TbItem> buyItemList = itemService.selectBuyItemList(itemId);
		
		model.addAttribute("itemResult", itemResult);
		model.addAttribute("itemDesc", itemDesc);
		model.addAttribute("buyItemList",buyItemList);
		return "item";
	}
}
