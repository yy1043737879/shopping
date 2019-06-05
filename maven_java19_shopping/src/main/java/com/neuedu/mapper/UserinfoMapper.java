package com.neuedu.mapper;

import com.neuedu.domain.Userinfo;

public interface UserinfoMapper {
	// 用户注册
	int userReg(Userinfo userinfo);
	// 用户登录
	Userinfo userLogin(Userinfo userinfo);
}
