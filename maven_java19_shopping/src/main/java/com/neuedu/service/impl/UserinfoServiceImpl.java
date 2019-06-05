package com.neuedu.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.domain.Userinfo;
import com.neuedu.mapper.UserinfoMapper;
import com.neuedu.service.UserinfoService;
@Service
public class UserinfoServiceImpl implements UserinfoService{
	@Autowired
	UserinfoMapper um;
	@Override
	@Transactional
	public int userReg(Userinfo userinfo) {
		return um.userReg(userinfo);
	}
	@Override
	public Userinfo userLogin(Userinfo userinfo) {
		return um.userLogin(userinfo);
	}

}
