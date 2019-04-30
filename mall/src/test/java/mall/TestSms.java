package mall;

import java.util.HashMap;
import java.util.Map;

import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.MapMessage;
import javax.jms.Message;
import javax.jms.Session;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;

import cn.e3mall.common.utils.JsonUtils;

public class TestSms {
	
	@Autowired
	private JmsTemplate jmsTemplate;
	@Autowired
	private Destination smsDestination;
	
	@Test
	public void test(){
		jmsTemplate.send(smsDestination, new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				MapMessage mapMessage = session.createMapMessage();
				mapMessage.setString("mobile", "18839139567");// 手机号
				mapMessage.setString("template_code", "SMS_139470113");// 模板编号
				mapMessage.setString("sign_name", "刘欢");// 签名
				Map m = new HashMap<>();
				m.put("number", "123455");
				mapMessage.setString("param", JsonUtils.objectToJson(m));// 参数
				return mapMessage;
			}
		});
	}
}
