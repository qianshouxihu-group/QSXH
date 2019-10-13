package com.qsxh.dao;


import com.qsxh.entity.ImageReturn;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface HabitDao {
    //查询兴趣选项
    public List findAllByHabit();
    //查询用户兴趣爱好
    public List findAllByUser(@Param("userid") String userid);
    //用户兴趣爱好批量插入
    public void insertHabitByUser(@Param("list") List<Object> obj, @Param("userid") String userid);
    //删除用户兴趣爱好
    public void deleteHabitByUser(@Param("userid") String userid);
    //添加相册照片
    public Integer insertPhotoByUser(ImageReturn imageReturn);
    //查询用户相册
    public List findPhotoByUser(@Param("userid") String userid);
    //删除用户相册照片
    public Integer deleteMyPhoto(@Param("photoid") Integer photoid);
}
