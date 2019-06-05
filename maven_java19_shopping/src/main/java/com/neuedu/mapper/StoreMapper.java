package com.neuedu.mapper;

import java.util.List;
import java.util.Map;

import com.neuedu.domain.Collectioninfo;
import com.neuedu.domain.Store;

public interface StoreMapper {
	// 新增店铺
	int storeReg(Store store);
	// 查询个人店铺
	List<Store> getPersonalStore(int userid);
	// 根据id查询店铺
	Store getStoreInfoById(int storeid);
	//根据id查询店铺商品列表
	List<Map<String,Object>> getProductList(int storeid);
	//商品上架
	int shopGrounding(String proid);
	//通过店铺id查询店主
	int getKeeperById(int storeid);
	//店铺热销商品
	List<Map<String,Object>> storehotShop(int storeid);
	//收藏店铺
	int collStoreinfo(Collectioninfo store);
	//查询店铺是否已收藏
	int checkStoreColl(String storeid);
	//获取收藏店铺信息
	List<Map<String,Object>> getCollStoreInfo(int id);
}
