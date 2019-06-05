package com.neuedu.domain;

import com.sun.tools.classfile.Opcode;
import jdk.nashorn.internal.objects.annotations.Setter;

public class Prostandard {
    private int id;
    private String proid;
    private String standard;
    private Double oldprice;
    private Double newprice;
    private int stock;
    private String procolor;

    public String getProcolor() {
        return procolor;
    }

    public void setProcolor(String procolor) {
        this.procolor = procolor;
    }
    public int getId() {
        return id;
    }
    public void setId(int id){
        this.id = id;
    }

    public String getProid() {
        return proid;
    }

    public void setProid(String proid) {
        this.proid = proid;
    }

    public String getStandard() {
        return standard;
    }
    public void setStandard(String standard){
        this.standard = standard;
    }
    public Double getOldprice() {
        return oldprice;
    }
    public void setOldprice(Double oldprice){
        this.oldprice = oldprice;
    }
    public Double getNewprice() {
        return newprice;
    }
    public void setNewprice(Double newprice){
        this.newprice = newprice;
    }
    public int getStock() {
        return stock;
    }
    public void setStock(int stock){
        this.stock = stock;
    }
}
