package com.qsxh.service.impl;

import com.qsxh.dao.MenuMapper;
import com.qsxh.entity.Menu;

import com.qsxh.service.MenuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Resource
    private MenuMapper menuMapper;
    @Override
    public List<Menu> selectRoleMenuList(String roleid) {
        return this.menuMapper.selectRoleMenuList(roleid);
    }

    @Override
    public Map<String, List<Menu>> listToMap(List<Menu> menuList) {
        Map<String, List<Menu>> menumap = new LinkedHashMap<>();
        String key = "后台管理";
        for (int i = 0; i < menuList.size(); i++) {
            Menu menu = menuList.get(i);
            if(!key.equals(menu.getFname())) {
                key = menu.getFname();
                List<Menu> menuList2 = new ArrayList<>();
                for (int j = 0; j < menuList.size(); j++) {
                    Menu childMenu = menuList.get(j);
                    if(key.equals(childMenu.getFname())) {
                        menuList2.add(childMenu);
                    }
                }
                if(!key.equals("后台管理")){
                    menumap.put(key, menuList2);//组装map
                }

            }
        }

        return menumap;
    }
}
