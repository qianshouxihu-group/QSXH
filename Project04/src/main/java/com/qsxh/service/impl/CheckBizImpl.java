package com.qsxh.service.impl;

import com.qsxh.dao.DatingDao;
import com.qsxh.dao.InformDao;
import com.qsxh.dao.UserDao;
import com.qsxh.entity.Dating;
import com.qsxh.entity.Inform;
import com.qsxh.entity.User;
import com.qsxh.service.ICheckBiz;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CheckBizImpl implements ICheckBiz {
    @Resource
    private UserDao userDao;
    @Resource
    private InformDao informDao;
    @Resource
    private DatingDao datingDao;

    /*--------------------------------注册审核----------------------------------*/
    //后台注册审核 列表
    @Override
    public Map<String, Object> regCheckListAndCount(User user) {
        int page = user.getPage();
        int limit = user.getLimit();

        user.setPage((page - 1) * limit);
        System.out.println("查询条件："+user.getUserid()+user.getBegindate()+user.getEnddate());
        List<User> list = userDao.regCheckList(user);
        int count = userDao.regCheckCount(user);
        System.out.println("总条数："+count);

        Map<String , Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", list);
        return map;
    }
    //后台注册审核 通过
    @Override
    @Transactional
    public String regCheckPass(String userid) {
        //更改该用户角色为普通用户
        Integer num = userDao.regCheckPass(userid);
        //系统发送一条信息给该用户，提示其审核通过
        Integer num2 = sendSystemInform(userid ,null , "pass");
        if(num > 0 && num2 > 0)
        {
            return "passSuccess";
        }
        else
        {
            return "passFail";
        }
    }
    //后台注册审核 不通过
    @Override
    @Transactional
    public String regCheckNoPass(String userid) {
        //更改该用户角色为未提交
        Integer num = userDao.regCheckNoPass(userid);
        //系统发送一条信息给用户，提示其审核不通过
        Integer num2 = sendSystemInform(userid ,null, "nopass");
        if(num > 0 && num2 > 0)
        {
            return "noPassSuccess";
        }
        else
        {
            return "noPassFail";
        }
    }
    //后台注册审核 批量通过
    @Override
    public void allPass(String[] userids) {
        for (String userid : userids)
        {
            regCheckPass(userid);
        }
    }
    //后台注册审核 批量不通过
    @Override
    public void allNoPass(String[] userids) {
        for (String userid : userids)
        {
            regCheckNoPass(userid);
        }
    }
    //后台注册审核 查看资料详情
    @Override
    public User dataDetails(String userid) {
        User user = userDao.dataDetails(userid);
        return user;
    }
    //发送审核结果消息
    @Override
    public Integer sendSystemInform(String userid ,Dating datingDetails, String result) {
        Inform inform = new Inform();
        //构建发送的消息
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String itime = dateFormat.format(new Date());
        inform.setItime(itime);
        inform.setItoid(userid);
        inform.setIstate("32");
        inform.setItype("81");
        switch (result)
        {
            case "pass":
            {
                inform.setItitle("资料审核通过");
                inform.setIcontext("恭喜您，您的资料已通过我们的审核，祝您在牵手西湖早日找到伴侣！");
                break;
            }
            case "nopass":
            {
                inform.setItitle("资料审核未通过");
                inform.setIcontext("抱歉，您的资料未通过我们的审核，请重新填写完善您的资料！");
                break;
            }
            case "datingPass":
                inform.setItitle("约会审核通过");
                inform.setIcontext("恭喜您，您向"+datingDetails.getUname2()+"发起的约会申请（约会时间："+datingDetails.getDdate()+" "+datingDetails.getDtime()+"）已通过我们的审核，请等待对方回复！");//这边需要将接收人的姓名返回给发起人，让其知道是哪条约会
                break;
            case "datingNoPass":
                inform.setItitle("约会审核未通过");
                inform.setIcontext("抱歉，您向"+datingDetails.getUname2()+"发起的约会申请（约会时间："+datingDetails.getDdate()+" "+datingDetails.getDtime()+"）约会申请未通过我们的审核，请重新申请约会！");//这边需要将接收人的姓名返回给发起人，让其知道是哪条约会
                break;
            default:break;
        }
        //发送
        Integer num = informDao.sendSystemInform(inform);
        return num;
    }

    /*------------------------------------约会审核--------------------------------------*/
    //后台约会审核 列表
    @Override
    public Map<String, Object> datingCheckListAndCount(Dating dating) {
        int page = dating.getPage();
        int limit = dating.getLimit();

        dating.setPage((page - 1) * limit);
        System.out.println("查询条件："+dating.getDfromid()+dating.getDtoid()+dating.getBegindate()+dating.getEnddate());
        List<Dating> list = datingDao.datingCheckList(dating);
        Integer count = datingDao.datingCheckCount(dating);
        System.out.println("总条数："+count);

        Map<String , Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", list);
        return map;
    }
    //后台约会审核 通过
    @Override
    @Transactional
    public String datingCheckPass(String dateid , String dfromid) {
        //更改该约会为通过
        Integer num = datingDao.datingCheckPass(dateid);
        //系统发送一条信息给该用户，提示其审核通过
        //获得该约会的详细信息，以便进行详细的反馈（什么时候 ，发给谁的约会被通过或不通过）
        Dating datingDetails = datingDao.datingDetails(dateid);
        Integer num2 = sendSystemInform(dfromid , datingDetails , "datingPass");
        if(num > 0 && num2 > 0)
        {
            return "passSuccess";
        }
        else
        {
            return "passFail";
        }
    }
    //后台约会审核 不通过
    @Override
    @Transactional
    public String datingCheckNoPass(String dateid ,String dfromid) {
        //更改该约会为不通过
        Integer num = datingDao.datingCheckNoPass(dateid);
        //系统发送一条信息给该用户，提示其审核通过
        //获得该约会的详细信息，以便进行详细的反馈（什么时候，发给谁的约会被通过或不通过）
        Dating datingDetails = datingDao.datingDetails(dateid);
        Integer num2 = sendSystemInform(dfromid ,datingDetails ,  "datingNoPass");
        if(num > 0 && num2 > 0)
        {
            return "noPassSuccess";
        }
        else
        {
            return "noPassFail";
        }
    }
    //后台约会审核 批量通过
    @Override
    public void datingAllPass(String dateids  , String dfromids) {
//        for (int i=0 ; i < dateids.length ; i++)
//        {
//            datingCheckPass(dateids[i] , dfromids[i]);
//        }
        System.out.println("直接打印："+dateids);
        String[] dateidsArray = dateids.split("dateids=");
        String[] dfromidArray = dfromids.split("dfromids=");
        System.out.println("数组长度："+dateidsArray.length+"+++"+dfromidArray.length);

        System.out.println("处理后："+dateidsArray[0]+"/"+dateidsArray[1]);
        System.out.println("处理后："+dfromidArray[0]+"/"+dfromidArray[1]);

        for (int i=1 ; i < dateidsArray.length ; i++)
        {
            datingCheckPass(dateidsArray[i] , dfromidArray[i]);
            System.out.println(dateidsArray[i]+"/"+dfromidArray[i]);
        }
    }
    //后台约会审核 批量不通过
    @Override
    public void datingAllNoPass(String dateids  , String dfromids) {
        String[] dateidsArray = dateids.split("dateids=");
        String[] dfromidArray = dfromids.split("dfromids=");
        for (int i=1 ; i < dateidsArray.length ; i++)
        {
            datingCheckNoPass(dateidsArray[i] , dfromidArray[i]);
        }
    }
    //后台约会审核 查看约会详情
    @Override
    public Dating datingDetails(String dateid) {
        Dating dating = datingDao.datingDetails(dateid);
        return dating;
    }
}
