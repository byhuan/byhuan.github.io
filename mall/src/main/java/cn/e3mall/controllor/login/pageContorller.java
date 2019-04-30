package cn.e3mall.controllor.login;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class pageContorller {
	@RequestMapping("/page/{text}")
	public String Page(@PathVariable String text){
		
		return text;
	}
	
}
