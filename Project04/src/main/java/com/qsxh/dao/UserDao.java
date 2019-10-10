package com.qsxh.dao;

import com.qsxh.entity.TblUser;
import com.qsxh.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public interface UserDao {
    /*==========wzq============*/
    //账号重复验证
    public User checkUserid(@Param("userid") String userid);
    //前台注册 插入tbluser
    public Integer reg(@Param("userid") String userid, @Param("upass") String upass, @Param("regdate") String regdate);
    //前台注册 插入tbldata
    public Integer addHisData(@Param("userid") String userid);
    //前台注册 插入tblhabit
    public Integer addHisHabit(@Param("userid") String userid);
    //前台注册 插入tblcplimit
    public Integer addHisCplimit(@Param("userid") String userid);
    //后台注册审核 列表
    public List<User> regCheckList(User user);
    //后台注册审核 记录数
    public Integer regCheckCount(User user);
    //后台注册审核 通过
    public Integer regCheckPass(@Param("userid") String userid);
    //后台注册审核 不通过
    public Integer regCheckNoPass(@Param("userid") String userid);
    //后台注册审核 查看资料详情
    public User dataDetails(@Param("userid") String userid);

    /*============cjc=============*/
    //获取聊天列表
    public List<TblUser> findUser(@Param("userid") String userid);

    /*===========kjy============*/
    //用户登录
    public User userLogin(@Param("userid") String userid, @Param("upass") String upass);
    //管理员登录
    public User userLogin2(@Param("userid") String userid, @Param("upass") String upass);
    //查询用户信息
    public User getUser(@Param("userid") String userid);
    //查看金币
    public String selectGold(@Param("id") String userid);
    //获取角色名
    public String getRolename(@Param("rid")String rid);
    //获取参数名
    public String getParam(@Param("paramid")String paramid);
    //更改用户身份（成为/失去 会员）
    public int changeRoldid(@Param("id") String userid,@Param("rid") String roleid);

    /*==============gjy==============*/
    public List<User> findUserList(User User);
    public int getUserNum(User User);
    public int userPassReset(String userid);
    public int updateUser(User User);

    public int deleteUser(String userid);

    public int getVipUserNum(User User);

    public List<User> findVipUserList(User User);

    public int deleteVipUser(String userid);
}
