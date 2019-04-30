package cn.e3mall.service.search.impl;


import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cn.e3mall.common.pojo.SearchItem;
import cn.e3mall.common.pojo.SearchPageItemList;
import cn.e3mall.service.search.searchDaoI;
@Repository
public class SearchDao implements searchDaoI{

	@Autowired
	private SolrServer solrServer;
	
	public SearchPageItemList getItemList(SolrQuery query){
		SearchPageItemList list = new SearchPageItemList();
		List<SearchItem> itemList = new ArrayList<>();
		try {
			System.out.println(query.get("df"));
			QueryResponse response = solrServer.query(query);
			//取结果
			SolrDocumentList results = response.getResults();
			//无结果返回null
			if(results.isEmpty()){
				System.out.println("没结果");
				return null;
			}
			
			//查到的数量
			long numFound = results.getNumFound();
			System.out.println("查到数量"+numFound);
			list.setRecourdCount(numFound);
			System.out.println("结果集大小："+results.size());
			//遍历
			for (SolrDocument solrDocument : results) {
				SearchItem item = new SearchItem();
				//取高亮显示
				String itemtitle = "";
				Map<String, Map<String, List<String>>> highlighting = response.getHighlighting();
				List<String> listh = highlighting.get(solrDocument.get("id")).get("item_title");
				//判断是否有高亮内容
				if (null != listh) {
					itemtitle = listh.get(0);
				} else {
					itemtitle = (String) solrDocument.get("item_title");
				}
				
				System.out.println("查到的"+solrDocument.get("item_title"));
				
				item.setTitle(itemtitle);
				item.setSell_point((String) solrDocument.get("item_sell_point"));
				item.setCategroy_name((String) solrDocument.get("item_category_name"));
				item.setImage((String) solrDocument.get("item_image"));
				item.setPrice((Long) solrDocument.get("item_price"));
				item.setId((String) solrDocument.get("id"));
				
				itemList.add(item);
			}
		} catch (SolrServerException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		list.setItemList(itemList);
		return list;
	}
}
