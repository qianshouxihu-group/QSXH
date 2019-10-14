package com.qsxh.service.impl;

import com.qsxh.dao.MenuMapper;
import com.qsxh.dao.RoleMapper;
import com.qsxh.entity.DataGridView;
import com.qsxh.entity.Menu1;
import com.qsxh.entity.Role;
import com.qsxh.entity.TreeNode;
import com.qsxh.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("roleService")
public class RoleServiceImpl implements RoleService {


    @Resource
    private MenuMapper menuMapper;

    @Resource
    private RoleMapper roleMapper;

    @Override
    public DataGridView initRoleMenuTreeJson(String roleid) {
        // 查询所有的可用的菜单
        Menu1 menu = new Menu1();
        System.out.println("------------查询===="+roleid+"====角色总菜单");
        List<Menu1> allMenu = menuMapper.queryAllMenu(menu);

        // 根据角色ID查询当前角色拥有的菜单
        List<Menu1> roleMenu = menuMapper.queryMenuByRoleId(roleid);
        List<TreeNode> data = new ArrayList<>();
        for(Menu1 m1 : allMenu) {
            String checkArr = "0";

            for (Menu1 m2 : roleMenu) {

                if ((m1.getMenuid()).equals(m2.getMenuid()) ) {
                    checkArr = "1";
                    break;
                }
            }
            String menuid = m1.getMenuid();
            String fid = m1.getFid();
            String title = m1.getMname();
            Boolean spread=false;
            if ((m1.getFid()).equals("1")){
                spread=true;
            }else {
                spread=false;
            }
            data.add(new TreeNode(menuid, fid, title, spread, checkArr));
        }
        return new DataGridView(data);
    }

    @Override
    public void saveRoleMenu(Role role) {
        String rid=role.getRoleid();
        String [] mids=role.getIds();
        //根据rid删除sys_role_menu里面所有数据
        this.roleMapper.deleteRolMenuByRid(rid);
        //保存角色和菜单的关系
        for (String mid : mids) {
            this.roleMapper.insertRoleMenu(rid,mid);
        }
    }



}
