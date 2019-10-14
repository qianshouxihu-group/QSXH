package com.qsxh.service.impl;

import com.qsxh.dao.AccountDao;
import com.qsxh.dao.RelationDao;
import com.qsxh.dao.UserDao;
import com.qsxh.entity.Account;
import com.qsxh.entity.TblRelation;
import com.qsxh.entity.TblUser;
import com.qsxh.entity.User;
import com.qsxh.service.RelationService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service("relationService")
public class RelationServiceImpl implements RelationService {

    @Resource
    private RelationDao relationDao;

    @Resource
    private UserDao userDao;

    @Resource
    private AccountDao accountDao;

    private boolean result;

    //查询关系，包括点赞和关注
    @Override
    public TblRelation findRelation(TblRelation relation) {

        TblRelation result = relationDao.findRelation(relation);


        if (result==null){
            relationDao.addRelation(relation);
            result = relationDao.findRelation(relation);
        }

        User user = userDao.getUser(relation.getFtoid());
        result.setUonline(user.getUonline());

        return result;
    }

    @Override//查找关注列表
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

        //查找并增加魅力值
        result = num > 0 ? addCharm(tr.getFtoid(),3) : false;

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

    @Override//送礼
    public String sendGift(TblRelation relation) {

        String fromid = relation.getFfromid();
        String toid = relation.getFtoid();

        //送礼费用和增加的魅力值，先写死，后续可以修改从数据库获得
        int giftPay = 100;
        int charmNum = 50;

        Account param = new Account();
        param.setUserid(fromid);
        param.setAgold(giftPay+"");
        param.setAtype("22");

        //扣金币
        String goldResult = goldAccount(param);

        if (goldResult.equals("noenough")){
            return goldResult;
        }
        else if (goldResult.equals("yes")){
            //金币消费成功，增加魅力值
            result = addCharm(toid,charmNum);
        }
        else if (goldResult.equals("no")){
            result = false;
        }

        String back = result ? "yes" : "no";

        return back;
    }

    @Override//增加魅力值
    public boolean addCharm(String userid, int charm) {

        String ucharm = relationDao.findCharm(userid);

        int nowCharm = Integer.parseInt(ucharm);

        nowCharm += charm;

        int charmNum = relationDao.changeCharm(userid,nowCharm+"");

        result = charmNum > 0 ? true : false;

        return result;

    }

    @Override//金币消费
    public String goldAccount(Account param) {

        String userid = param.getUserid();

        //查找并修改金币数量
        int nowGold = Integer.parseInt(userDao.selectGold(userid));
        int payGold = Integer.parseInt(param.getAgold());

        nowGold = nowGold - payGold;
        String agold = nowGold + "";

        if (nowGold<0){
            return "noenough";
        }

        int goldNum = accountDao.changegold(agold,userid);

        System.out.println("金币扣款成功，金币余额---"+agold);

        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String date = df.format(new Date());

        //增加金币消费记录
        Account account = new Account();
        account.setAdate(date);
        account.setAgold(payGold+"");
        account.setAtype(param.getAtype());
        account.setUserid(userid);
        account.setRmb("");

        int accountNum = accountDao.recharge(account);

        String back = goldNum>0&&accountNum>0 ? "yes" : "no";

        return back;
    }


}
