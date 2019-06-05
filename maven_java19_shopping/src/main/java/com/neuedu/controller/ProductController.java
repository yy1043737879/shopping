package com.neuedu.controller;

import com.alibaba.fastjson.JSON;
import com.neuedu.domain.*;
import com.neuedu.service.CategoryService;
import com.neuedu.utils.Indexinfo;
import com.sun.tools.javac.jvm.Items;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2019/2/21.
 */
@Controller
@RequestMapping("/product")
public class ProductController {
    @Autowired
    CategoryService cs;
    @RequestMapping("/reg")
    public @ResponseBody String getReg(MultipartFile file, HttpServletRequest request){
        String proname=request.getParameter("proname");
        String oldprice=request.getParameter("oldprice");
        String newprice=request.getParameter("newprice");
        String storeid=request.getParameter("storeid");
        String freight=request.getParameter("freight");
        String category=request.getParameter("category");
        String category_son=request.getParameter("category_son");
        String []standardv=request.getParameterValues("standard");
       String []color=request.getParameterValues("color");
        String []stock=request.getParameterValues("stock");
        List<Property> prolist=cs.getPropertySonInfo(Integer.parseInt(category));
       String[] provalue=request.getParameterValues("provalues");
       Integer id=cs.getProductId();

       if(id==null){
           id=0;
       }
       String nameid=""+id+storeid+category+category_son;
       for(int i=0;i<color.length;i++){
            //插入prostandard表
           Prostandard stand=new Prostandard();
           stand.setProid(""+nameid+i);//商品id
           stand.setNewprice(Double.parseDouble(newprice));//现价
           stand.setOldprice(Double.parseDouble(oldprice));//原价
           stand.setStandard(standardv[i]);//规格
           stand.setStock(Integer.parseInt(stock[i]));//库存
           stand.setProcolor(color[i]);
           cs.addProductInfo(stand);
           for(int j=0;j<prolist.size();j++){
               //插入propertyvalue表
               Propertyvalue value=new Propertyvalue();
               value.setProid(""+nameid+i);//商品id
               value.setValueid(prolist.get(j).getId());//对应property表的id
                value.setProvalue(provalue[j]);
             //  value.setProvalue(request.getParameter(""+(prolist.get(j).getId())));//属性值
             /*  String color2=request.getParameter("颜色");
               value.setProvalue(color2);*/
               cs.addValueInfo(value);

           }
           //插入product表
           Product product=new Product();
           product.setProid(""+nameid+i);
           product.setProname(proname);//商品名称
           product.setCateid(Integer.parseInt(category_son));//类别id，对应category表的id列
           product.setStoreid(Integer.parseInt(storeid));//商铺id，对应store表的id列
           // product.setCover("封面");//商品封面
           product.setFreight(Double.parseDouble(freight));//运费
           if(file.isEmpty()){
               System.out.println("文件未上传!");
           }else {
               //得到上传的文件名
               String fileName = file.getOriginalFilename();
               //得到服务器项目发布运行所在地址
               String strFolder = request.getServletContext().getRealPath("static/img/products/");
               File folder = new File(strFolder);
               if(!folder.exists())
               {
                   folder.mkdirs();
               }
               String uuid = UUID.randomUUID()+"";
               //上传
               String strFinalPath = strFolder + uuid+fileName;
               File localFile = new File(strFinalPath);
               try {
                   file.transferTo(localFile);
               } catch (IllegalStateException e) {
                   e.printStackTrace();
               } catch (IOException e) {
                   e.printStackTrace();
               }
               //注入图片属性
               if(product  != null) {
                   product.setCover(uuid+fileName);
               }
           }
           cs.addProductIndex(product);
       }
       // List<Category> sonlist = cs.getCategorySonInfo(Integer.parseInt(category));

      /*  Propertyvalue value=new Propertyvalue();
        value.setProid(1);//商品id
        value.setProvalue(2);//对应property表的id
        value.setProvalue('联想');//属性值
        cs.addValueInfo(value);*/


        return "1";
    }
    @RequestMapping("/kind")
    public  void findKing(HttpServletRequest request,HttpServletResponse response) throws IOException {
        Indexinfo info=new Indexinfo();
       List<Category> catelist=cs.getCategoryInfo();
       List<Map<String,Object>> hotmap=cs.getHotShop();
       List<Map<String,Object>> newmap=cs.getNewShop();
      info.setCatelist(catelist);
      info.setHotmap(hotmap);
      info.setNewmap(newmap);
      response.getWriter().println(JSON.toJSONString(info));
    }
    @RequestMapping("/index/{id}")
    public String goDetail(@PathVariable int id, Model model){
        List<Category> sonlist=cs.getCategorySonInfo(id);
        String cname=cs.getNameById(id);
        model.addAttribute("cname",cname);
        model.addAttribute("sonlist",sonlist);
        List<Map<String,Object>> Recomendlist=cs.getRecommendShop(id);
        int i=Recomendlist.size();
        if(Recomendlist.size()!=0){
            model.addAttribute("recomendlist",Recomendlist);
        }else {
           /* List<Map<String,Object>> defaultlist=cs.getDefaultshop();
            model.addAttribute("defaultlist",defaultlist);*/
            model.addAttribute("startrecond",cname);
            System.out.println("*******************");
            System.out.println();
        }
      /*  List<Map<String,Object>> defaultlist=cs.getDefaultshop();
        model.addAttribute("defaultlist",defaultlist);*/
        return "product/index";
    }
    @RequestMapping("/detail/{proid}")
    public String productDetail(@PathVariable String proid,Model model){
       Map<String,Object> shopMap=cs.getShopList(proid);
       model.addAttribute("shopmap",shopMap);
        return "product/detail";
    }
    @RequestMapping("/collshop")
    public void collShop( String proid,String typeid, HttpSession session,HttpServletResponse response) throws IOException {

        int num=cs.ckeckcollShop(proid);
        if(num==0){
            Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
            Collectioninfo coll=new Collectioninfo();
            coll.setUserid(userinfo.getId());
            coll.setTypeid(Integer.parseInt(typeid));
            coll.setSidorpid(proid);
            cs.addcollShop(coll);
            response.getWriter().println(1);
        }else{
            response.getWriter().println(0);
        }

    }
    @RequestMapping("/orderitem")
    public  void orderItemShop(String proid,String counts,String storeid,HttpSession session,HttpServletResponse response) throws IOException {
       int num=cs.checkOrederShop(proid);

            Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
            Orderitem item=new Orderitem();
        Integer id=cs.getOrderinfoId();
        if(id==null){
            id=0;
        }
        System.out.println(id);
            item.setOrderid(""+proid+id);
            item.setCounts(Integer.parseInt(counts));
            item.setProid(proid);
            item.setStoreid(Integer.parseInt(storeid));
            item.setUserid(userinfo.getId());
            if(num==0){
                cs.addOrderinfo(item);
                response.getWriter().println(item.getOrderid());
            }else{
                cs.addShopNums(item);
                String ordernum=cs.getShopOrderById(proid);
                response.getWriter().println(ordernum);
            }

    }
    @RequestMapping("/moveitem")
    public  void moveItemShop(String orderid,String proid,HttpServletResponse response) throws IOException {

        Orderitem item=new Orderitem();
        item.setOrderid(orderid);
        cs.moveShopcate(item);
        response.getWriter().println(1);
    }
    @RequestMapping("/submitorder")
    public  void submitOrder(String orderid,String message,String proid,HttpSession session,HttpServletResponse response) throws IOException {
        Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
        Addressinfo faultaddress=(Addressinfo)session.getAttribute("faultaddress");
        Orderinfo orderinfo=new Orderinfo();
        orderinfo.setOrdercode(orderid);
        orderinfo.setUsername(faultaddress.getUsername());
        orderinfo.setPost(faultaddress.getPost());
        orderinfo.setAddress(faultaddress.getAddress());
        orderinfo.setMessage(message);
        orderinfo.setMobile(faultaddress.getMobile());
        orderinfo.setProid(proid);
        orderinfo.setPaydate(new Date());
        orderinfo.setStatus("piad");
        cs.updateOrderitems(proid);
        cs.submitOrder(orderinfo);
        System.out.println(proid);
        cs.updateShopNum(proid);
        response.getWriter().println(1);

    }
    @RequestMapping("/updateadress")
    public void updateAdress(String id,HttpSession session,HttpServletResponse response) throws IOException {
        session.removeAttribute("faultaddress");
        cs.updateAdress(Integer.parseInt(id));
        Addressinfo faultaddress=cs.defaultAddress();
        session.setAttribute("faultaddress",faultaddress);
        response.getWriter().println(1);
    }

    @RequestMapping("/deleteadress")
    public void  deleteAdress(String id,HttpServletResponse response) throws IOException {
        cs.deleteadress(Integer.parseInt(id));
        response.getWriter().println(1);
    }
    @RequestMapping("/updateaddinfo")
    public void updateAddinfo(Addressinfo info,HttpSession session,HttpServletResponse response) throws IOException {
        Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
        info.setUserid(userinfo.getId());
        cs.updateAddinfo(info);
        response.getWriter().println(1);
    }
    @RequestMapping("/newaddinfo")
    public void newAddinfo(HttpServletRequest request,HttpSession session,HttpServletResponse response) throws IOException {
        Userinfo userinfo = (Userinfo)session.getAttribute("login_user");
        Addressinfo info=new Addressinfo();
        info.setAddress(request.getParameter("address"));
        info.setMobile(request.getParameter("mobile"));
        info.setUsername(request.getParameter("username"));
        info.setPost(request.getParameter("post"));
        info.setUserid(userinfo.getId());
        String defaultadd=request.getParameter("defaultadd");
       if(defaultadd.equals("0")){
           cs.addressinfo(info);
       }
       if(defaultadd.equals("1")){
           info.setDefaultadd(1);
           cs.addFaultressinfo(info);
           session.removeAttribute("faultaddress");
           Addressinfo faultaddress=cs.defaultAddress();
           session.setAttribute("faultaddress",faultaddress);
       }
        response.getWriter().println(1);
    }
    @RequestMapping("receiveshop")
    public void receiveShop(String orderid,HttpServletResponse response) throws IOException {
        cs.receiveshop(orderid);
        response.getWriter().println(1);
    }
}
