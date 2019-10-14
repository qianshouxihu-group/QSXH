package com.qsxh.dao;


import com.qsxh.entity.Menu;
import com.qsxh.entity.Menu1;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MenuMapper {

    public List<Menu1> queryAllMenu(Menu1 menu);


    public List<Menu1> queryMenuByRoleId(@Param("roleid") String rid);


    public List<Menu> selectRoleMenuList(String roleid);
}