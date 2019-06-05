package com.neuedu.domain;
public class Product {
  private int id;
  private String proname;
  private int cateid;
  private int storeid;
  private String status;
  private String cover;
  private double freight;
  private String proid;
  private int prosales;

  public int getProsales() {
    return prosales;
  }

  public void setProsales(int prosales) {
    this.prosales = prosales;
  }

  public String getProid() {
    return proid;
  }

  public void setProid(String proid) {
    this.proid = proid;
  }

  public double getFreight() {
        return freight;
    }

    public void setFreight(double freight) {
        this.freight = freight;
    }

    public int getId() {
    return id;
  }
  public void setId(int id){
    this.id = id;
  }
  public String getProname() {
    return proname;
  }
  public void setProname(String proname){
    this.proname = proname;
  }
  public int getCateid() {
    return cateid;
  }
  public void setCateid(int cateid){
    this.cateid = cateid;
  }
  public int getStoreid() {
    return storeid;
  }
  public void setStoreid(int storeid){
    this.storeid = storeid;
  }
  public String getStatus() {
    return status;
  }
  public void setStatus(String status){
    this.status = status;
  }
  public String getCover() {
    return cover;
  }
  public void setCover(String cover){
    this.cover = cover;
  }
}
