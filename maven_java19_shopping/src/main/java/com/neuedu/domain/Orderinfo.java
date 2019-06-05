package com.neuedu.domain;
import java.util.*;
public class Orderinfo {
  private int id;
  private String ordercode;
  private String username;
  private String address;
  private String post;
  private String mobile;
  private Date creatdate;
  private Date paydate;
  private Date delivrytime;
  private Date confirmtime;
  private String status;
  private String message;
  private String proid;

  public String getProid() {
    return proid;
  }

  public void setProid(String proid) {
    this.proid = proid;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public int getId() {
    return id;
  }
  public void setId(int id){
    this.id = id;
  }
  public String getOrdercode() {
    return ordercode;
  }
  public void setOrdercode(String ordercode){
    this.ordercode = ordercode;
  }
  public String getUsername() {
    return username;
  }
  public void setUsername(String username){
    this.username = username;
  }
  public String getAddress() {
    return address;
  }
  public void setAddress(String address){
    this.address = address;
  }
  public String getPost() {
    return post;
  }
  public void setPost(String post){
    this.post = post;
  }
  public String getMobile() {
    return mobile;
  }
  public void setMobile(String mobile){
    this.mobile = mobile;
  }
  public Date getCreatdate() {
    return creatdate;
  }
  public void setCreatdate(Date creatdate){
    this.creatdate = creatdate;
  }
  public Date getPaydate() {
    return paydate;
  }
  public void setPaydate(Date paydate){
    this.paydate = paydate;
  }
  public Date getDelivrytime() {
    return delivrytime;
  }
  public void setDelivrytime(Date delivrytime){
    this.delivrytime = delivrytime;
  }
  public Date getConfirmtime() {
    return confirmtime;
  }
  public void setConfirmtime(Date confirmtime){
    this.confirmtime = confirmtime;
  }
  public String getStatus() {
    return status;
  }
  public void setStatus(String status){
    this.status = status;
  }
}
