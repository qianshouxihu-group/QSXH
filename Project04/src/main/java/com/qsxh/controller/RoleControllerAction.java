package com.qsxh.controller;

import com.qsxh.entity.DataGridView;
import com.qsxh.entity.ResultObj;
import com.qsxh.entity.Role;
import com.qsxh.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/roledemo")
public class RoleControllerAction {

    @Resource
    private RoleService roleService;
    @RequestMapping("initRoleMenuTreeJson")
    public @ResponseBody
    DataGridView initRoleMenuTreeJson(String roleid) {
        System.out.println("================进入查询菜单"+roleid);
        System.out.println("======================="+this.roleService.initRoleMenuTreeJson(roleid));
        return this.roleService.initRoleMenuTreeJson(roleid);
    }

    /**
     * 保存角色和菜单的关系
     */
    @RequestMapping("saveRoleMenu")
    public @ResponseBody
    ResultObj saveRoleMenu(Role role) {

        ResultObj resultObj=new ResultObj();
        try {
            this.roleService.saveRoleMenu(role);
            resultObj.setMsg("权限保存成功");
            return resultObj;
        } catch (Exception e) {
            e.printStackTrace();
            resultObj.setMsg("权限保存失败");
            return resultObj;

        }
    }

}
