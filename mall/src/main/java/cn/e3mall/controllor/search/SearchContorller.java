package cn.e3mall.controllor.search;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.e3mall.common.pojo.SearchPageItemList;
import cn.e3mall.service.search.SearchItemService;

/*
 * 搜索的表现层
 * 引用e3-search-service的服务实现搜索功能
 */

@Controller
public class SearchContorller {

	@Autowired
	private SearchItemService searchItemService;
	
	//通过搜索框搜索
	@RequestMapping("search")
	public String SearchByKeyWord(Model model
			,@RequestParam(defaultValue="0")Integer page,String keyword) throws Exception{
		
		keyword = new String(keyword.getBytes("iso8859-1"), "utf-8");
		
		SearchPageItemList itemList = searchItemService.SearchItemByKeyword(keyword, page, 16);
		if(itemList==null){
			return "searchnull";
		}
		itemList.setPage(page);
		
		model.addAttribute("totalPages", itemList.getTotalPages());
		model.addAttribute("recourdCount", itemList.getRecourdCount());
		model.addAttribute("page", itemList.getPage());
		model.addAttribute("itemList", itemList.getItemList());
		
		System.out.println(itemList.getTotalPages());
		System.out.println(itemList.getRecourdCount());
		System.out.println(itemList.getPage());
		System.out.println(itemList.getItemList().size());
		
		return "search";
	}
	
	//通过分类id
	@RequestMapping("/search/cate/{cid}")
	public String SearchByCid(Model model
			,@RequestParam(defaultValue="1")Integer page,
			@PathVariable long cid){
		
		SearchPageItemList itemList = searchItemService.SearchItemByCid(cid, page, 16);
		itemList.setPage(page);
		
		model.addAttribute("totalPages", itemList.getTotalPages());
		model.addAttribute("recourdCount", itemList.getRecourdCount());
		model.addAttribute("page", itemList.getPage());
		model.addAttribute("itemList", itemList.getItemList());
		
		System.out.println(itemList.getTotalPages());
		System.out.println(itemList.getRecourdCount());
		System.out.println(itemList.getPage());
		System.out.println(itemList.getItemList().size());
		
		return "search";
	}
	
	//通过总的分类id
}
