package com.neuedu.domain;
public class Orderitem {
  private int id;
  private String orderid;
  private int standarid;
  private int counts;
  private int storeid;
  private  int userid;
  private String proid;

  public String getProid() {
    return proid;
  }

  public void setProid(String proid) {
    this.proid = proid;
  }

  public int getUserid() {
    return userid;
  }

  public void setUserid(int userid) {
    this.userid = userid;
  }

  public int getId() {
    return id;
  }
  public void setId(int id){
    this.id = id;
  }
  public String getOrderid() {
    return orderid;
  }
  public void setOrderid(String orderid){
    this.orderid = orderid;
  }
  public int getStandarid() {
    return standarid;
  }
  public void setStandarid(int standarid){
    this.standarid = standarid;
  }
  public int getCounts() {
    return counts;
  }
  public void setCounts(int counts){
    this.counts = counts;
  }
  public int getStoreid() {
    return storeid;
  }
  public void setStoreid(int storeid){
    this.storeid = storeid;
  }
}
