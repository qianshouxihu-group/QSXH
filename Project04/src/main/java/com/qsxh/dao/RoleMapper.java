package com.qsxh.dao;



import org.apache.ibatis.annotations.Param;


public interface RoleMapper {

	/**
	 * 根据角色id删除sys_role_role里面的数据
	 * 
	 * @param
	 */
	public void deleteRolMenuByRid(String roleid);

	/**
	 * 保存角色和菜单的关系 sys_role_menu
	 * @param
	 * @param
	 */
	public void insertRoleMenu(@Param("roleid") String rid, @Param("menuid") String mid);


}