package cn.e3mall.messageListener;

import java.io.IOException;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;

import cn.e3mall.common.pojo.SearchItem;
import cn.e3mall.mapper.SearchItemMapper;

public class ItemAddMessageListener implements MessageListener{

	@Autowired
	private SearchItemMapper searchItemMapper; 
	@Autowired
	private SolrServer solrServer;
	
	@Override
	public void onMessage(Message msg) {
		TextMessage textMessage = (TextMessage) msg;
		try {
			String id = textMessage.getText();
			Long itemId = new Long(id);
			
			System.out.println(itemId);
			
			Thread.sleep(1000);
			
			SearchItem searchItem = searchItemMapper.getItemById(itemId);
			
			System.out.println(searchItem.getTitle());
			
			SolrInputDocument doc = new SolrInputDocument();
			doc.addField("item_title", searchItem.getTitle());
			doc.addField("item_sell_point", searchItem.getSell_point());
			doc.addField("item_price", searchItem.getPrice());
			doc.addField("item_image", searchItem.getImage());
			doc.addField("item_category_name", searchItem.getCategroy_name());
			doc.addField("id", searchItem.getId());

			solrServer.add(doc);
			solrServer.commit();
		} catch (JMSException | SolrServerException | IOException | InterruptedException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

}
