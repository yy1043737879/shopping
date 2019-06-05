package com.neuedu.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.neuedu.domain.*;
import com.neuedu.service.CategoryService;
import com.neuedu.utils.ProRegInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.neuedu.service.StoreService;

@Controller
@RequestMapping("/store")
public class StoreController {
	@Autowired
	StoreService ss;
	@Autowired
	CategoryService cs;
	@RequestMapping("/build")
	public String storeBuild(MultipartFile file,Store store,HttpServletRequest request) {
		Userinfo userinfo = (Userinfo)request.getSession().getAttribute("login_user");
		// 保存登陆者id		
		store.setUserid(userinfo.getId());
		if(file.isEmpty()){
	         System.out.println("文件未上传!");
	    }else {
	    	try {
	    		// 得到上传文件名
		    	String fileName = file.getOriginalFilename();
		    	// 准备保存路径
		    	String savePath = request.getServletContext().getRealPath("/static/img/store_cover/");
		    	File path = new File(savePath);
		    	if(!path.exists()) {
		    		path.mkdirs();
		    	}
		    	String uuid = UUID.randomUUID()+"";
		    	// 上传
		    	String finalPath = savePath + uuid + fileName;
		    	File local = new File(finalPath);
				file.transferTo(local);
				// 保存店铺封面
				store.setStorecover(uuid + fileName);
				// 调service保存店铺信息
				store.setBuildtime(new Date());
				// -------------
				int count = ss.storeReg(store);
			} catch (IllegalStateException e) {
				e.printStackTrace();
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    }
		return "redirect:/go/set/3";
	}
	@RequestMapping("/loadSonCate")
	public void getSonCate(Integer maincate, HttpServletResponse response) throws IOException{
		// 调service查询二级分类
		if(maincate != null){
			List<Property> prolist=cs.getPropertySonInfo(maincate);
			List<Category> sonlist = cs.getCategorySonInfo(maincate);
//			响应数据
			ProRegInfo proreg=new ProRegInfo();
			proreg.setProlist(prolist);
			proreg.setSonlist(sonlist);
			response.getWriter().print(JSON.toJSONString(proreg));
		}else {
			response.getWriter().print(1);
		}
	}
	@RequestMapping("/grounding/{proid}/{storeid}")
	public String shopGrounding(@PathVariable String proid,@PathVariable String storeid,Model model){
		ss.shopGrounding(proid);
		Store storeinfo = ss.getStoreInfoById(Integer.parseInt(storeid));
		model.addAttribute("storeinfo",storeinfo);
		List<Map<String,Object>> productlist=ss.getProductList(Integer.parseInt(storeid));
		model.addAttribute("shopkeeper",1);
		model.addAttribute("productlist",productlist);
		return "store/manage";
	}
	@RequestMapping("/collstore")
	public void collStore(String storeid, HttpServletResponse response, HttpSession session) throws IOException {
		int num=ss.checkStoreColl(storeid);
		if(num==0){
			Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
			Collectioninfo coll=new Collectioninfo();
			coll.setUserid(userinfo.getId());
			coll.setSidorpid(storeid);
			coll.setTypeid(0);
			ss.collStoreinfo(coll);
			response.getWriter().print(0);
		}else {
			response.getWriter().print(1);
		}

	}
}
