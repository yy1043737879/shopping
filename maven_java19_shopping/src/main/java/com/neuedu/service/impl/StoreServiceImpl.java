package com.neuedu.service.impl;

import java.util.List;
import java.util.Map;

import com.neuedu.domain.Collectioninfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.neuedu.domain.Store;
import com.neuedu.mapper.StoreMapper;
import com.neuedu.service.StoreService;
@Service
public class StoreServiceImpl implements StoreService{
	@Autowired
	StoreMapper sm;
	@Override
	@Transactional
	public int storeReg(Store store) {
		return sm.storeReg(store);
	}
	@Override
	public List<Store> getPersonalStore(int userid) {
		return sm.getPersonalStore(userid);
	}

    @Override
    public Store getStoreInfoById(int storeid) {
        return sm.getStoreInfoById(storeid);
    }

	@Override

	public List<Map<String, Object>> getProductList(int storeid) {
		return sm.getProductList(storeid);
	}

	@Override
	@Transactional
	public int shopGrounding(String proid) {
		return sm.shopGrounding(proid);
	}

	@Override
	public int getKeeperById(int storeid) {
		return sm.getKeeperById(storeid);
	}

	@Override
	public List<Map<String, Object>> storehotShop(int storeid) {
		return sm.storehotShop(storeid);
	}

	@Override
	@Transactional
	public int collStoreinfo(Collectioninfo store) {
		return sm.collStoreinfo(store);
	}

	@Override
	public int checkStoreColl(String storeid) {
		return sm.checkStoreColl(storeid);
	}

	@Override
	public List<Map<String, Object>> getCollStoreInfo(int id) {
		return sm.getCollStoreInfo(id);
	}
}
