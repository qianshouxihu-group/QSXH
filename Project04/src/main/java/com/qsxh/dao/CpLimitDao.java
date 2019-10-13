package com.qsxh.dao;

import com.qsxh.entity.PersonalData;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CpLimitDao {
    //择偶条件查询
    public PersonalData findCpLimitByUser(@Param("userid") String userid);
    //更新择偶条件
    public Integer updateCpLimitByUser(PersonalData personalData);
    //不带所在地的择偶条件更新
    public Integer updateCpLimitWithoutAddress(PersonalData personalData);
}
