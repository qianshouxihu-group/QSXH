package com.qsxh.service;

import com.qsxh.entity.ImageReturn;
import com.qsxh.entity.PersonalData;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IPersonalService {

    //完善注册信息
    public boolean improvingRegData(PersonalData personalData);
    //基本资料查询
    public PersonalData findBasicData(@Param("userid") String userid);
    //基本资料更新
    public boolean updateBasicData(PersonalData personalData);
    //择偶条件查询
    public PersonalData findCpLimitData(@Param("userid") String userid);
    //择偶条件更新
    public boolean updateCpLimitData(PersonalData personalData);
    //个性要求查询
    public PersonalData findLimitData(@Param("userid") String userid);
    //个性要求更新
    public boolean updateLimitData(PersonalData personalData);
    //工作学习查询
    public PersonalData findWSData(@Param("userid") String userid);
    //工作学习更新
    public boolean updateWSData(PersonalData personalData);
    //兴趣爱好选项查询
    public List findHItemData();
    //用户信息爱好查询
    public List findHabitData(@Param("userid") String userid);
    //用户兴趣爱好批量插入
    public void insertHabitData(List<Object> obj, @Param("userid") String userid);
    //删除用户兴趣
    public void deleteHabitData(@Param("userid") String userid);
    //更改用户头像
    public boolean updateHeadImg(ImageReturn imageReturn);
    //添加相册照片
    public boolean insertPhotoWithUser(ImageReturn imageReturn);
    //查询用户相册
    public List findPhotoWithUser(@Param("userid") String userid);
    //删除用户照片
    public boolean deleteMyPhoto(@Param("photoid") Integer photoid);
    //不带地址的基础资料更新
    public boolean updateBasicWithoutAddress(PersonalData personalData);
    //不带地址的基础资料更新
    public boolean updateCpWithoutAddress(PersonalData personalData);
    //修改用户密码
    public boolean updateUserPass(@Param("upass") String upass,@Param("userid")String userid);

}
