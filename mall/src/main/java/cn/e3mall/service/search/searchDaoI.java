package cn.e3mall.service.search;

import org.apache.solr.client.solrj.SolrQuery;

import cn.e3mall.common.pojo.SearchPageItemList;

public interface searchDaoI {

	public SearchPageItemList getItemList(SolrQuery query);
	
}
