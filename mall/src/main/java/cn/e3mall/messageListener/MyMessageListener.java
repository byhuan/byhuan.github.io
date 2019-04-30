package cn.e3mall.messageListener;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;

public class MyMessageListener implements MessageListener{

	@Override
	public void onMessage(Message msg) {
		TextMessage textMessage = (TextMessage) msg;
		try {
			String text = textMessage.getText();
			System.out.println(text);

		} catch (JMSException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}

}
