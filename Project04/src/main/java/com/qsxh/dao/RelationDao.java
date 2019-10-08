package com.qsxh.dao;

import com.qsxh.entity.TblRelation;
import com.qsxh.entity.TblUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RelationDao {

    //查找关系
    public TblRelation findRelation(TblRelation tblRelation);

    //更新关系
    public Integer updateRelation(TblRelation tblRelation);

    //增加无关系
    public Integer addRelation(TblRelation tblRelation);

    //查找已关注列表
    public List<TblUser> findFollowed(@Param("userid") String userid);





    //-----------以下其实本来应该放在userDao-------------------

    //查找魅力值
    public String findCharm(@Param("userid") String userid);

    //修改魅力值
    public Integer changeCharm(@Param("userid") String userid,@Param("ucharm") String ucharm);

}
