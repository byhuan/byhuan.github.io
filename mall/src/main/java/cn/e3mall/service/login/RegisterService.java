package cn.e3mall.service.login;

import cn.e3mall.common.utils.E3Result;
import cn.e3mall.pojo.TbUser;

/*
 * 注册服务
 */

public interface RegisterService {

	//type代表对那个字段验证
	//1 用户名  2手机号  3邮箱
	//验证注册信息
	E3Result checkData(String param,int type);
	//注册
	E3Result Register(TbUser tbuser);
	//发送验证码
	E3Result sendcode(String param);
	//验证验证码
	E3Result checkCode(String param, String phone);
}
