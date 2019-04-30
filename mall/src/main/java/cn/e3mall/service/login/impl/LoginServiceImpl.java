package cn.e3mall.service.login.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;


import cn.e3mall.common.utils.E3Result;
import cn.e3mall.mapper.TbUserMapper;
import cn.e3mall.pojo.*;
import cn.e3mall.pojo.TbUserExample.Criteria;
import cn.e3mall.service.login.LoginService;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private TbUserMapper userMapper;
	
	@Override
	public E3Result login(String username, String password) {

		TbUserExample example = new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<TbUser> list = userMapper.selectByExample(example);
		//判断用户是否存在
		if(list==null||list.size()==0){
			return E3Result.build(405, "用户名或密码错误");
		}
		//先给密码加密再与从数据库获得的加密密码进行比较
		String string = DigestUtils.md5DigestAsHex(password.getBytes());
		
		//判断密码是否正确
		if(!list.get(0).getPassword().equals(string)){
			return E3Result.build(400, "密码错误");
		}
		
		//把对象返回，保存到session中
		return E3Result.ok(list.get(0));
	}

	//更新密码
	@Override
	public TbUser updateMi(String pwd,String phone) {
		// 对密码进行加密
		String string = DigestUtils.md5DigestAsHex(pwd.getBytes());
		TbUserExample example = new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andPhoneEqualTo(phone);
		List<TbUser> list = userMapper.selectByExample(example);
		
		TbUser user = list.get(0);
		//更新密码
		user.setPassword(string);
		
		//更新数据库
		userMapper.updateByPrimaryKeySelective(user);
		
		user.setPassword("");
		return user;
	}

	//获取用户信息，通过手机号
	@Override
	public TbUser getUserByPhone(String phone) {

		TbUserExample example = new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andPhoneEqualTo(phone);
		List<TbUser> list = userMapper.selectByExample(example);
	
		if(list.isEmpty()){
			return null;
		}
		return list.get(0);
	}

}
