package cn.e3mall.controllor.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.e3mall.common.utils.CookieUtils;
import cn.e3mall.common.utils.E3Result;
import cn.e3mall.pojo.TbUser;
import cn.e3mall.service.login.LoginService;

@Controller
public class LoginContorller {

	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value="/user/login",method=RequestMethod.POST)
	@ResponseBody
	public E3Result login(String username,String password,HttpServletRequest request,
			HttpServletResponse response){
		E3Result result = loginService.login(username, password);
		//判断是否登录成功
		if(result.getStatus()==200){
			//登陆成功，把用户信息存入session
			HttpSession session = request.getSession();
			session.setAttribute("user", (TbUser)result.getData());
		}
		
		return result;
	}
	
	//忘记密码
	@RequestMapping("/login/forget")
	public String forget(){
		return "forgetMi";
	}
	
	//验证手机号后跳转到修改密码页面
	@RequestMapping("/login/forgetNext/{phone}")
	public String forgetNext(@PathVariable String phone,Model model){
		
		TbUser user = loginService.getUserByPhone(phone);
		model.addAttribute("user", user);
		return "forgetmitwo";
	}
	
	//忘记密码后的更新新密码
	@RequestMapping("/login/changemi/{pwd}/{phone}")
	public String changeMi(@PathVariable String pwd,
			@PathVariable String phone,Model model){
		
		TbUser user = loginService.updateMi(pwd,phone);
		model.addAttribute("user", user);
		return "forgetmilast";
	}
}
