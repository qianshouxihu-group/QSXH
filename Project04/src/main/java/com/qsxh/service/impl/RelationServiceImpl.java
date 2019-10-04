package com.qsxh.service.impl;

import com.qsxh.dao.RelationDao;
import com.qsxh.entity.TblRelation;
import com.qsxh.entity.TblUser;
import com.qsxh.service.RelationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("/relation")
public class RelationServiceImpl implements RelationService {

    @Resource
    private RelationDao relationDao;

    private boolean result;

    //查询关系，包括点赞和关注
    @Override
    public TblRelation findRelation(TblRelation relation) {

        TblRelation result = relationDao.findRelation(relation);

        if (result==null){
            relationDao.addRelation(relation);
        }

        return result;
    }

    @Override
    public List<TblUser> findFollowed(String userid) {
        return relationDao.findFollowed(userid);
    }

    @Override//点赞
    public boolean good(TblRelation relation) {

        //查询现有关系
        TblRelation tr = findRelation(relation);

        //更改点赞关系
        tr.setFgood("61");

        int num = relationDao.updateRelation(tr);

        result = num > 0 ? true : false;

        return result;
    }

    @Override//修改关注关系
    public boolean follow(TblRelation relation) {

        //查询现有关系
        TblRelation tr = findRelation(relation);

        //判断关系
        String ffollow = tr.getFfollow().equals("71") ? "72" : "71";

        tr.setFfollow(ffollow);

        int num = relationDao.updateRelation(tr);

        result = num > 0 ? true : false;

        return result;
    }
}
