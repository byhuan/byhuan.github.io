package cn.e3mall.service.login;

import cn.e3mall.common.utils.E3Result;
import cn.e3mall.pojo.TbUser;

/*
 * 登陆服务
 */

public interface LoginService {
	
	E3Result login(String username,String password);

	//更新密码
	TbUser updateMi(String pwd, String phone);
	//通过手机号得到用户信息
	TbUser getUserByPhone(String phone);
}
