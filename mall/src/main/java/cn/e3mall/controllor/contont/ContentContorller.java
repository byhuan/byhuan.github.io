package cn.e3mall.controllor.contont;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.e3mall.common.pojo.ItemResult;
import cn.e3mall.common.pojo.MainMenuResult;
import cn.e3mall.common.utils.E3Result;
import cn.e3mall.pojo.TbContent;
import cn.e3mall.pojo.TbItem;
import cn.e3mall.pojo.TbItemCat;
import cn.e3mall.service.content.IndexContentService;
import cn.e3mall.service.manager.ItemService;



/*
 * 首页的表现层
 * 引用content的服务实现信息的展示
 */

@Controller
public class ContentContorller {

	@Autowired
	private IndexContentService indexContentService;
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/index")
	public String IndexContentInit(Model model){
		//轮播图
		List<TbContent> list = indexContentService.getContentListForAd1(100L);
		//优选商品信息
		List<TbItem> itemList = itemService.selectItemList();
		//热门商品信息
		List<TbItem> hotItemList = itemService.selectHotItemList();
		
		model.addAttribute("ad1List", list);
		model.addAttribute("itemList", itemList);
		model.addAttribute("hotItemList", hotItemList);
		return "index";
	}
	
	//首页分类表
	@RequestMapping("/index/mainmenu/{cid}")
	@ResponseBody
	public E3Result MainMenu(@PathVariable long cid){
		
		List<MainMenuResult> itemCatList = indexContentService.getMainMenuByCid(cid);
		System.out.println(itemCatList.size());
		return E3Result.build(200, "", itemCatList);
	}
	
}
