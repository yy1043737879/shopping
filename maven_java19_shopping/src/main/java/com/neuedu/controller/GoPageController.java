package com.neuedu.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.jms.Session;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neuedu.domain.Addressinfo;
import com.neuedu.domain.Category;
import com.neuedu.service.CategoryService;
import org.omg.CORBA.DynAnyPackage.Invalid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neuedu.domain.Store;
import com.neuedu.domain.Userinfo;
import com.neuedu.service.StoreService;

@Controller
@RequestMapping("/go")
public class GoPageController {
	@Autowired
	StoreService ss;
	@Autowired
	CategoryService cs;
	@RequestMapping("/index")
	public String goIndex() {
		// 加载类别信息+加载首页商品信息+轮播图图片
		return "index";
	}
	@RequestMapping("/logout")
	public String goLogout(HttpSession session) {
		//
		session.removeAttribute("login_user");
		return "index";
	}

	@RequestMapping("/addressmag")
	public String goAddressmag() {
		// 新增地址
		return "user/addressmag";
	}
	@RequestMapping("/updateressmag/{id}")
	public String goUpdateRessmag(@PathVariable String id,Model model) {
		//修改地址信息
		Map<String,Object> adressmap=cs.getAdressById(Integer.parseInt(id));
		model.addAttribute("adressmap",adressmap);
		return "user/addressmag";
	}
	@RequestMapping("/set/{num}")
	public String goSet(@PathVariable int num, HttpSession session,Model model) {
		// 加载订单信息+加载收藏信息+加载店铺信息
		Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
		// 店铺信息
		List<Store> slist = ss.getPersonalStore(userinfo.getId());
		//订单信息
		List<Map<String,Object>> paidlist=cs.getPaidShopInfo(userinfo.getId());
		//付款信息
		List<Map<String,Object>> paylist=cs.getPayShop(userinfo.getId());
		//收货信息
		List<Map<String,Object>> donelist=cs.getDoneShopInfo(userinfo.getId());
		//收藏商品信息
		List<Map<String ,Object>> colllist=cs.getCollShopInfo(userinfo.getId());
		//收藏店铺
		List<Map<String ,Object>> collstoreist=ss.getCollStoreInfo(userinfo.getId());
		model.addAttribute("storelist", slist);
		model.addAttribute("paidlist",paidlist);
		model.addAttribute("paylist",paylist);
		model.addAttribute("donelist",donelist);
		model.addAttribute("colllist",colllist);
		model.addAttribute("collstoreist",collstoreist);
		if(num==1){model.addAttribute("orderinfo","active");
		}
		if(num==2){model.addAttribute("collinfo","active");}
		if(num==3){
			model.addAttribute("manageshops","active");
		}
		return "user/set";
	}
	@RequestMapping("/build")
	public String goBuild() {
		return "store/build";
	}
	@RequestMapping("/storemanage/{storeid}")
	public String goStoreManage(@PathVariable int storeid,Model model) {
		//	加载店铺信息：涉及store表，product和prostandard表
		// 调service完成根据id查询某个店铺
		Store storeinfo = ss.getStoreInfoById(storeid);
		model.addAttribute("storeinfo",storeinfo);
		List<Map<String,Object>> productlist=ss.getProductList(storeid);
		model.addAttribute("shopkeeper",1);
		model.addAttribute("productlist",productlist);
		return "store/manage";
	}
	@RequestMapping("/proreg/{storeid}")
	public String goProReg(@PathVariable int storeid,Model model) {
		// 加载类别信息
		List<Category> clist = cs.getCategoryInfo();
		// 跳转到商品注册页面
		model.addAttribute("storeid",storeid);
		model.addAttribute("catelist",clist);
		return "product/proreg";
	}
	@RequestMapping("/second/{id}")
	public String goDetail(@PathVariable int id, Model model,HttpSession session) {
		List<Category> sonlist=cs.getCategorySonInfo(id);
		String cname=cs.getNameById(id);
		model.addAttribute("cname",cname);
		model.addAttribute("sonlist",sonlist);
		//加载默认推荐商品
		List<Map<String,Object>> defaultlist=cs.getDefaultshop();
		//model.addAttribute("defaultlist",defaultlist);
		session.setAttribute("defaultlist",defaultlist);
		return "product/index";
	}
	@RequestMapping("/store/{storeid}")
	public String goStore(@PathVariable int storeid, Model model, HttpSession session){
		int num=ss.checkStoreColl(String.valueOf(storeid));
		if(num!=0){
			model.addAttribute("collected",1);
		}
		Store storeinfo = ss.getStoreInfoById(storeid);
		model.addAttribute("storeinfo",storeinfo);
		List<Map<String,Object>> productlist=ss.getProductList(storeid);
		model.addAttribute("productlist",productlist);
		List<Map<String,Object>> storehotlist=ss.storehotShop(storeid);
		model.addAttribute("storehotlist",storehotlist);
		Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
		if(userinfo!=null){
			int userid=ss.getKeeperById(storeid);
			if(userinfo.getId()==userid){
				model.addAttribute("shopkeeper",1);
			}
		}
		return "store/index";
	}
	@RequestMapping("/pay/{orderid}")
	public String goPay(@PathVariable String orderid, HttpSession session,Model model) {
		// 加载类别信息+加载首页商品信息+轮播图图片
		Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
		List<Map<String,Object>> paylist=cs.getPayShop(userinfo.getId());
		model.addAttribute("paylist",paylist);
		List<Map<String,Object>> addresslist=cs.getAddress(userinfo.getId());
		model.addAttribute("address",addresslist);
		Addressinfo faultaddress=cs.defaultAddress();
		session.setAttribute("faultaddress",faultaddress);
		return "user/pay";
	}
	@RequestMapping("/search/{content}")
	public String goSearch(@PathVariable String content, HttpSession session,Model model) {
		// 加载搜索信息
		List<Map<String,Object>> mohushoplist=cs.mohuShoplist(content);
		List<Map<String,Object>> storelist=cs.storelist(content);
		List<Map<String,Object>> namelist=cs.namelist(content);
		if(mohushoplist.size()!=0){
			model.addAttribute("mohushoplist",mohushoplist);
		}else if(storelist.size()!=0){
			return "redirect:/go/store/"+storelist.get(0);
		}else if(namelist.size()!=0){
			List<Map<String,Object>> secondnamelist=cs.secondnamelist(content);
			if(secondnamelist.size()!=0){
				model.addAttribute("secondlist",secondnamelist);
				List<Integer> secondidlist=cs.secondIdlist(content);
				System.out.println(secondidlist);
				List<Map<String,Object>> secondmap=null;
					System.out.println(secondidlist.get(0));
					List<Map<String,Object>> sonmap=cs.secondShopById(secondidlist.get(0));
					model.addAttribute("mohushoplist",sonmap);
			}else{
				model.addAttribute("secondlist",namelist);
			}
		}
		return "product/search";
	}

	@RequestMapping("/sendtext")
	public void goSearch(String content, HttpSession session, HttpServletResponse response) throws IOException {
		// 加载搜索信息
		String context=(String)session.getAttribute("content");
		if(context!=null){
			session.removeAttribute("content");
		}
		session.setAttribute("content",content);
		response.getWriter().print(1);
	}
}
