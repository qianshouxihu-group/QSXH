package com.qsxh.service;

import com.qsxh.entity.DataGridView;
import com.qsxh.entity.Role;

public interface RoleService {

    /**
     * 加载角色管理分配菜单的json
     * @param roleid
     * @return
     */
    public DataGridView initRoleMenuTreeJson(String roleid);

    /**
     * 保存角色和菜单的关系
     * @param role
     */
    public void saveRoleMenu(Role role);

}
