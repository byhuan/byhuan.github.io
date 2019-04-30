package cn.e3mall.service.login.impl;

import java.util.Date;
import java.util.List;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;

import org.apache.activemq.ActiveMQConnectionFactory;
import org.apache.activemq.command.ActiveMQTextMessage;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import cn.e3mall.common.redis.JedisClient;
import cn.e3mall.common.utils.E3Result;
import cn.e3mall.common.utils.JsonUtils;
import cn.e3mall.mapper.TbUserMapper;
import cn.e3mall.pojo.Content;
import cn.e3mall.pojo.TbUser;
import cn.e3mall.pojo.TbUserExample;
import cn.e3mall.pojo.TbUserExample.Criteria;
import cn.e3mall.service.login.RegisterService;

@Service
public class RegisterServiceImpl implements RegisterService {

	@Autowired
	private TbUserMapper userMapper;
	@Autowired
	private JedisClient jedisClient;
	// @Autowired
	// private JmsTemplate jmsTemplate;
	// @Autowired
	// private Destination smsDestination;

	@Override
	public E3Result checkData(String param, int type) {

		TbUserExample example = new TbUserExample();
		Criteria criteria = example.createCriteria();

		// 验证 //1 用户名 2手机号
		if (1 == type) {
			// 用户名
			criteria.andUsernameEqualTo(param);
		} else if (2 == type) {
			// 手机号
			criteria.andPhoneEqualTo(param);
		} else {
			return E3Result.build(400, "非法输入");
		}
		List<TbUser> list = userMapper.selectByExample(example);
		if (list != null && list.size() > 0) {
			// 如果有数据返回false
			return E3Result.ok(false);
		}
		// 如果没有数据返回true
		return E3Result.ok(true);
	}

	@Override
	public E3Result Register(TbUser tbuser) {

		tbuser.setCreated(new Date());
		tbuser.setUpdated(new Date());
		String password = tbuser.getPassword();
		// 对密码进行加密
		String string = DigestUtils.md5DigestAsHex(password.getBytes());
		// 把加密后的数据再次替换到pojo
		tbuser.setPassword(string);
		int insert = userMapper.insert(tbuser);
		if (insert == 0) {
			return E3Result.build(500, "注册失败");
		}

		return E3Result.ok();
	}

	// 发送验证码
	@Override
	public E3Result sendcode(String param) {
		// 随机生成code
		int code = (int) (Math.random() * 1000000);
		// 把验证码保存到缓存 key为手机号
		jedisClient.set(param, code + "");
		// 加上失效时间
		jedisClient.expire(param, 300);
		System.out.println("service"+param);
		// 创建连接工厂
		ConnectionFactory connectionFactory = new ActiveMQConnectionFactory("tcp://47.95.192.59:61616");
		try {
			// 创建连接
			Connection connection = connectionFactory.createConnection();
			// 开启连接
			connection.start();
			// 创建一个回话
			Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
			// 创建一个Destination，queue或者Topic
			Topic topic = session.createTopic("publish.topic");
			// 创建一个生成者
			MessageProducer producer = session.createProducer(topic);
			// 创建一个消息
			Content content = new Content();
			content.setPhone(param);
			content.setCode(code+"");

			String json = JsonUtils.objectToJson(content);
			TextMessage textMessage = new ActiveMQTextMessage();
			textMessage.setText(json);
			// 发送消息
			producer.send(textMessage);
			System.out.println("service ===="+param);
			// 关闭
			producer.close();
			session.close();
			connection.close();
		} catch (JMSException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return E3Result.build(200, "发送成功");
	}

	// 验证验证码
	@Override
	public E3Result checkCode(String param, String phone) {

		String code = jedisClient.get(phone);
		// 验证是否超时
		if (!StringUtils.isNotBlank(code)) {
			// 超时
			return E3Result.build(400, "验证码超时");
		}
		if (param.equals(code)) {
			// 验证码正确
			return E3Result.build(200, "验证成功", phone);
		}

		return E3Result.build(500, "验证码错误");
	}

}
