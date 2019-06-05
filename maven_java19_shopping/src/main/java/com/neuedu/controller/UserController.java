package com.neuedu.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neuedu.domain.Userinfo;
import com.neuedu.service.UserinfoService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserinfoService us;
	@RequestMapping("/login")
	public String doLogin(Userinfo userinfo,HttpSession session) {
		// 用户登录--调service
		Userinfo user = us.userLogin(userinfo);
		if(user != null) {
			session.setAttribute("login_user", user);
		}
		return "redirect:/go/index";
	}
	@RequestMapping("/reg")
	public String doReg(Userinfo userinfo) {
		// 用户注册--调service
		userinfo.setRegtime(new Date());
		int count = us.userReg(userinfo);
		return "redirect:/go/index";
	}
}
