package com.neuedu.domain;

public class Addressinfo {
  private int id;
  private int userid;
  private String address;
  private String post;
  private String mobile;
  private int defaultadd;
  private String username;

  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }

  public int getId() {
    return id;
  }
  public void setId(int id){
    this.id = id;
  }
  public int getUserid() {
    return userid;
  }
  public void setUserid(int userid){
    this.userid = userid;
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
  public int getDefaultadd() {
    return defaultadd;
  }
  public void setDefaultadd(int defaultadd){
    this.defaultadd = defaultadd;
  }
}
