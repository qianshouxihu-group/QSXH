package com.qsxh.dao;

import com.qsxh.entity.ImageReturn;
import com.qsxh.entity.PersonalData;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface PersonalDao {

    //注册完善
    public Integer regUpdate(PersonalData personalData);
    //基本资料查询
    public PersonalData findUserWithBasic(@Param("userid") String userid);
    //基本资料更新
    public Integer updateUserWithBasic(PersonalData personalData);
    //个性要求查询
    public PersonalData findDataWithLimit(@Param("userid") String userid);
    //个性要求更新
    public Integer updateDataWithLimit(PersonalData personalData);
    //工作学习查询
    public PersonalData findDataWithWS(@Param("userid") String userid);
    //工作学习更新
    public Integer updateDataWithWS(PersonalData personalData);
    //头像更新
    public Integer updateUserWithHeadImg(ImageReturn imageReturn);
    //不带所在地的基础资料更新
    public Integer updateBasicWithoutAddress(PersonalData personalData);
    //更改用户密码
    public Integer updatePass(@Param("upass") String upass,@Param("userid") String userid);

}
