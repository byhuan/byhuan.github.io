package cn.e3mall.service.search.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.e3mall.common.pojo.SearchItem;
import cn.e3mall.common.pojo.SearchPageItemList;
import cn.e3mall.common.utils.E3Result;
import cn.e3mall.mapper.SearchItemMapper;
import cn.e3mall.mapper.TbItemCatMapper;
import cn.e3mall.pojo.TbItemCat;
import cn.e3mall.service.search.SearchItemService;

@Service
public class SearchItemServiceImpl implements SearchItemService{

	@Autowired
	private SolrServer solrServer;
	@Autowired
	private SearchDao searchDao;
	@Autowired
	private SearchItemMapper itemMapper;
	@Autowired
	private TbItemCatMapper itemCatMapper;
	
	@Override
	public E3Result setItemListToIndex(){

		List<SearchItem> list = itemMapper.getItemList();
		Collection<SolrInputDocument> docs = new  ArrayList<SolrInputDocument>();
		
		for (SearchItem searchItem : list) {
			SolrInputDocument doc = new SolrInputDocument();
			doc.addField("item_title", searchItem.getTitle());
			doc.addField("item_sell_point", searchItem.getSell_point());
			doc.addField("item_price", searchItem.getPrice());
			doc.addField("item_image", searchItem.getImage());
			doc.addField("item_category_name", searchItem.getCategroy_name());
			doc.addField("id", searchItem.getId());
			try {
				docs.add(doc);
				solrServer.add(docs);
			} catch (SolrServerException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
				return E3Result.ok(100);
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
				return E3Result.ok(100);
			}
			
		}
		try {
			solrServer.commit();
		} catch (SolrServerException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
			return E3Result.ok(100);
		} catch (IOException e1) {
			// TODO 自动生成的 catch 块
			e1.printStackTrace();
			return E3Result.ok(100);
		}
		E3Result e = new E3Result();
		e.setStatus(200);
		return e;
	}

	//搜索框搜索
	@Override
	public SearchPageItemList SearchItemByKeyword(String keyword, Integer page, Integer rows) {

		SolrQuery query = new SolrQuery();
		query.setQuery(keyword);
		System.out.println("搜索框"+keyword);
		//分页
		query.setStart(page);
		query.setRows(rows);
		
		//设置默认搜索域
		query.set("df", "item_title");
		
		//排序
//		query.setSort("product_price", ORDER.desc);
		//高亮
		//打开高亮开关
		query.setHighlight(true);
		//高亮显示的域
		query.addHighlightField("item_title");
		//前缀
		//query.setHighlightSimplePre("<span style='color=red'>");
//		后缀
		//query.setHighlightSimplePost("</span>");
		
		SearchPageItemList itemList = searchDao.getItemList(query);
		if(itemList==null){
			return null;
		}
		//计算总页数
		int i = (int) (itemList.getRecourdCount()/rows);
		if(itemList.getRecourdCount()%rows>0){
			i++;
		}
		itemList.setTotalPages(i);
		
		return itemList;
	}

	@Override
	public E3Result delItemListToIndex() {

		try {
			solrServer.deleteByQuery("*:*");
			solrServer.commit();
		} catch (SolrServerException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return E3Result.ok(100);
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
			return E3Result.ok(100);
		}
		
		return E3Result.ok(200);
	}

	//分类搜索
	@Override
	public SearchPageItemList SearchItemByCid(long cid, Integer page, int i) {
		
		//根据id查分类名称
		TbItemCat itemCat = itemCatMapper.selectByPrimaryKey(cid);
		String keyword = itemCat.getName();
		
		SolrQuery query = new SolrQuery();
		query.setQuery(keyword);
		//分页
		query.setStart(page);
		query.setRows(i);
		
		//设置默认搜索域
		query.set("df", "item_category_name");
		
		//排序
//		query.setSort("product_price", ORDER.desc);
		//高亮
		//打开高亮开关
		query.setHighlight(true);
		//高亮显示的域
		query.addHighlightField("item_title");
		//前缀
		query.setHighlightSimplePre("<span style='color=red'>");
//		后缀
		query.setHighlightSimplePost("</span>");
		
		SearchPageItemList itemList = searchDao.getItemList(query);
		if(itemList.getItemList().size()==0){
			return null;
		}
		//计算总页数
		int j = (int) (itemList.getRecourdCount()/i);
		if(itemList.getRecourdCount()%i>0){
			j++;
		}
		itemList.setTotalPages(j);
		
		return itemList;
	}
	
}
