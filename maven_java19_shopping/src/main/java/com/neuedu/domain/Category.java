package com.neuedu.domain;

public class Category {
  private int id;
  private int parentid;
  private String cname;
  public int getId() {
    return id;
  }
  public void setId(int id){
    this.id = id;
  }
  public int getParentid() {
    return parentid;
  }
  public void setParentid(int parentid){
    this.parentid = parentid;
  }
  public String getCname() {
    return cname;
  }
  public void setCname(String cname){
    this.cname = cname;
  }
}
