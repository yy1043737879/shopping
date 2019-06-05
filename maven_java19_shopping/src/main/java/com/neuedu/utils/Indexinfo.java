package com.neuedu.utils;

import com.neuedu.domain.Category;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2019/2/24.
 */
public class Indexinfo {
    List<Category> catelist;
    List<Map<String,Object>> hotmap;
    List<Map<String,Object>> newmap;

    public List<Category> getCatelist() {
        return catelist;
    }

    public void setCatelist(List<Category> catelist) {
        this.catelist = catelist;
    }

    public List<Map<String, Object>> getHotmap() {
        return hotmap;
    }

    public void setHotmap(List<Map<String, Object>> hotmap) {
        this.hotmap = hotmap;
    }

    public List<Map<String, Object>> getNewmap() {
        return newmap;
    }

    public void setNewmap(List<Map<String, Object>> newmap) {
        this.newmap = newmap;
    }
}
