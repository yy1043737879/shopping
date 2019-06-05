package com.neuedu.service;

import com.neuedu.domain.Userinfo;

public interface UserinfoService {
	// 用户注册
	int userReg(Userinfo userinfo);
	// 用户登录
	Userinfo userLogin(Userinfo userinfo);
}
