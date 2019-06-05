package com.neuedu.service.impl;

import com.neuedu.domain.*;
import com.neuedu.mapper.CategoryMapper;
import com.neuedu.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/1/30.
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryMapper cm;
    @Override
    public List<Category> getCategoryInfo() {
        return cm.getCategoryInfo();
    }

    @Override
    public List<Category> getCategorySonInfo(int mainid) {
        return cm.getCategorySonInfo(mainid);
    }

    @Override
    public List<Property> getPropertySonInfo(int mainid) {
        return cm.getPropertySonInfo(mainid);
    }

    @Override
    public List<Map<String, Object>> getPropertyInfo(int mainid) {
        return cm.getPropertyInfo(mainid);
    }

    @Override
    @Transactional
    public int addProductInfo(Prostandard shop) {
        return cm.addProductInfo(shop);
    }

    @Override
    @Transactional
    public int addValueInfo(Propertyvalue value) {
        return cm.addValueInfo(value);
    }

    @Override
    public Integer getProductId() {
        return cm.getProductId();
    }

    @Override
    @Transactional
    public int addProductIndex(Product product) {
        return cm.addProductIndex(product);
    }

    @Override
    public String getNameById(int id) {
        return cm.getNameById(id);
    }

    @Override
    public List<Map<String, Object>> getRecommendShop(int id) {
        return cm.getRecommendShop(id);
    }

    @Override
    public List<Map<String, Object>> getDefaultshop() {
        return cm.getDefaultshop();
    }

    @Override
    public Map<String, Object> getShopList(String proid) {
        return cm.getShopList(proid);
    }

    @Override
    public List<Map<String, Object>> getHotShop() {
        return cm.getHotShop();
    }

    @Override
    public List<Map<String, Object>> getNewShop() {
        return cm.getNewShop();
    }

    @Override
    @Transactional
    public int addcollShop(Collectioninfo coll) {
        return cm.addcollShop(coll);
    }

    @Override
    @Transactional
    public int ckeckcollShop(String proid) {
        return cm.ckeckcollShop(proid);
    }

    @Override
    public int addOrderinfo(Orderitem item) {
        return cm.addOrderinfo(item);
    }

    @Override
    public int checkOrederShop(String proid) {
        return cm.checkOrederShop(proid);
    }

    @Override
    @Transactional
    public int moveShopcate(Orderitem item) {
        return cm.moveShopcate(item);
    }

    @Override
    public List<Map<String, Object>> getPayShop(int userid) {
        return cm.getPayShop(userid);
    }

    @Override
    public int submitOrder(Orderinfo order) {
        return cm.submitOrder(order);
    }

    @Override
    public List<Map<String, Object>> getAddress(int userid) {
        return cm.getAddress(userid);
    }

    @Override
    @Transactional
    public int updateAdress(int id) {
        return cm.updateAdress(id);
    }

    @Override
    @Transactional
    public int updateOrderitems(String proid) {
        return cm.updateOrderitems(proid);
    }

    @Override
    public Addressinfo defaultAddress() {
        return cm.defaultAddress();
    }

    @Override
    public Map<String, Object> getAdressById(int id) {
        return cm.getAdressById(id);
    }

    @Override
    @Transactional
    public int updateAddinfo(Addressinfo info) {
        return cm.updateAddinfo(info);
    }

    @Override
    @Transactional
    public int addressinfo(Addressinfo info) {
        return cm.addressinfo(info);
    }

    @Override
    @Transactional
    public int addFaultressinfo(Addressinfo info) {
        cm.clearFaultadd();
        return cm.addFaultressinfo(info);
    }

    @Override
    @Transactional
    public int deleteadress(int id) {
        return cm.deleteadress(id);
    }

    @Override
    @Transactional
    public int againAddDeaultadd() {
        return cm.againAddDeaultadd();
    }

    @Override
    @Transactional
    public int updateShopNum(String proid) {
        return cm.updateShopNum(proid);
    }

    @Override
    public List<Map<String, Object>> getPaidShopInfo(int id) {
        return cm.getPaidShopInfo(id);
    }

    @Override
    public Integer getOrderinfoId() {
        return cm.getOrderinfoId();
    }

    @Override
    @Transactional
    public int addShopNums(Orderitem item) {
        return cm.addShopNums(item);
    }

    @Override
    public String getShopOrderById(String proid) {
        return cm.getShopOrderById(proid);
    }

    @Override
    @Transactional
    public int receiveshop(String orderid) {
        return cm.receiveshop(orderid);
    }

    @Override
    public List<Map<String, Object>> getDoneShopInfo(int id) {
        return cm.getDoneShopInfo(id);
    }

    @Override
    public List<Map<String, Object>> getCollShopInfo(int id) {
        return cm.getCollShopInfo(id);
    }

    @Override
    public List<Map<String,Object>> namelist(String content) {
        return cm.namelist(content);
    }

    @Override
    public List<Map<String,Object>> storelist(String content) {
        return cm.storelist(content);
    }

    @Override
    public List<Map<String, Object>> mohuShoplist(String content) {
        return cm.mohuShoplist(content);
    }

    @Override
    public List<Map<String,Object>> secondnamelist(String content) {
        return cm.secondnamelist(content);
    }

    @Override
    public List<Map<String, Object>> secondShopById(int id) {
        return cm.secondShopById(id);
    }

    @Override
    public List<Integer> secondIdlist(String content) {
        return cm.secondIdlist(content);
    }

    @Override
    public List<Integer> firstIdlist(String content) {
        return firstIdlist(content);
    }
}
