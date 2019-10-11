package com.qsxh.service;

import com.qsxh.entity.Menu;

import java.util.List;
import java.util.Map;

public interface MenuService {
    public    List<Menu> selectRoleMenuList(String roleid);

    public Map<String,List<Menu>> listToMap(List<Menu> list);
}
