package com.neuedu.utils;

import com.neuedu.domain.Category;
import com.neuedu.domain.Property;

import java.util.List;

/**
 * Created by Administrator on 2019/2/20.
 */
public class ProRegInfo {
    private List<Property> prolist;
    private List<Category> sonlist;

    public List<Property> getProlist() {
        return prolist;
    }

    public void setProlist(List<Property> prolist) {
        this.prolist = prolist;
    }

    public List<Category> getSonlist() {
        return sonlist;
    }

    public void setSonlist(List<Category> sonlist) {
        this.sonlist = sonlist;
    }
}
