package com.neuedu.mapper;

import com.neuedu.domain.*;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/1/30.
 */
public interface CategoryMapper {
    // 查询所有类别信息
    List<Category> getCategoryInfo();
    // 加载二级分类
    List<Category> getCategorySonInfo(int mainid);
    //加载产品参数
    List<Property> getPropertySonInfo(int mainid);
    //获取产品参数
    List<Map<String,Object>> getPropertyInfo(int mainid);
    //插入商品信息Prostandard
    int addProductInfo(Prostandard shop);
    //插入参数信息
    int addValueInfo(Propertyvalue value);
    //查询产品id
    Integer getProductId();
    //插入商品信息product
    int addProductIndex(Product product);
    //通过id查询一级类名
    String getNameById(int id);
    //通过二级id查询推荐商品
    List<Map<String,Object>> getRecommendShop(int id);
    //加载二级默认推荐商品
    List<Map<String,Object>> getDefaultshop();
    //通过id查询商品信息
    Map<String,Object> getShopList(String proid);
    //加载首页热门商品
    List<Map<String,Object>> getHotShop();
    //加载首页最新商品
    List<Map<String,Object>> getNewShop();
    //收藏商品
    int addcollShop(Collectioninfo coll);
    //查找商品是否收藏
    int ckeckcollShop(String proid);
    //加入购物车
    int addOrderinfo(Orderitem item);
    //查找是否已加入订单
    int checkOrederShop(String proid);
    //移出购物车
    int moveShopcate(Orderitem item);
    //加载付款商品信息
    List<Map<String,Object>> getPayShop(int userid);
    //下单
    int submitOrder(Orderinfo order);
    //查询地址信息
    List<Map<String,Object>> getAddress(int userid);
    //查询默认地址
    Addressinfo defaultAddress();
    //修改订单状态
    int updateOrderitems(String proid);
    //修改默认地址
    int updateAdress(int id);
    //通过id查询地址信息
    Map<String,Object> getAdressById(int id);
    //修改地址信息
    int updateAddinfo(Addressinfo info);
    //新增地址
    int addressinfo(Addressinfo info);
    //新增默认地址
    int addFaultressinfo(Addressinfo info);
    //清除默认地址
    int clearFaultadd();
    //删除地址
    int deleteadress(int id);
    //重新添加默认地址
    int againAddDeaultadd();
    //更新商品数量
    int updateShopNum(String proid);
    //获取付款商品信息
    List<Map<String,Object>> getPaidShopInfo(int id);
    //获取收货商品信息
    List<Map<String,Object>> getDoneShopInfo(int id);
    //查询付款表id
    Integer getOrderinfoId();
    //相同的商品更新数量
    int addShopNums(Orderitem item);
    //通过id查询商品订单号
    String getShopOrderById(String proid);
    //收货
    int receiveshop(String orderid);
    //获取收藏商品信息
    List<Map<String,Object>> getCollShopInfo(int id);
    //模糊查询是否是一级分类或二级分类
    List<Map<String,Object>> namelist(String content);
    //模糊查询是否是店铺
    List<Map<String,Object>> storelist(String content);
    //模糊查询是否是商品
    List<Map<String,Object>> mohuShoplist(String content);
    //模糊查询是否有二级分类
    List<Map<String,Object>> secondnamelist(String content);
    //模糊查询通过二级分类id查商品
    List<Map<String,Object>> secondShopById(int id);
    //模糊查询获取二级分类id集合
    List<Integer> secondIdlist(String content);
    //模糊查询获取一级分类id集合
    List<Integer> firstIdlist(String content);
}
