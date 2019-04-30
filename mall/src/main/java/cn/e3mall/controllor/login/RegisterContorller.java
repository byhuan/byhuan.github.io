package cn.e3mall.controllor.login;

import java.util.logging.Logger;

import org.apache.commons.logging.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.e3mall.common.utils.E3Result;
import cn.e3mall.pojo.TbUser;
import cn.e3mall.service.login.RegisterService;

@Controller
public class RegisterContorller {

	@Autowired
	private RegisterService registerService;
	
	@RequestMapping("/user/check/{param}/{type}")
	@ResponseBody
	public E3Result CheckData(@PathVariable String param,
			@PathVariable int type){
		
		E3Result result = registerService.checkData(param, type);
		return result;
	}
	
	@RequestMapping("/user/checkcode/{param}/{phone}")
	@ResponseBody
	public E3Result CheckCode(@PathVariable String param,
			@PathVariable String phone){
		
		System.out.println(param + " -- "+phone);  
		
		E3Result result = registerService.checkCode(param, phone);
		return result;
	}
	
	@RequestMapping("/user/sendcode/{param}")
	@ResponseBody
	public E3Result SendCode(@PathVariable String param){ 
		System.out.println(param);
		E3Result result = registerService.sendcode(param);
		return result;
	}
	
	@RequestMapping("/user/register")
	@ResponseBody
	public E3Result Register(TbUser tbUser){
		
		E3Result result = registerService.checkData(tbUser.getUsername(), 1);
		if(result.getStatus()!=200){
			return E3Result.build(400, "非法信息");
		}
		E3Result result2 = registerService.checkData(tbUser.getPhone(), 2);
		if(result2.getStatus()!=200){
			return E3Result.build(400, "非法信息");
		}
		
		E3Result result3 = registerService.Register(tbUser);
		return result3;
	}
}
