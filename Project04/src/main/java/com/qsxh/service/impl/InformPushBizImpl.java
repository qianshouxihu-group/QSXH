package com.qsxh.service.impl;

import com.google.gson.Gson;
import com.qsxh.dao.InformDao;
import com.qsxh.entity.Inform;
import com.qsxh.rabbitmq.MessageProducer2;
import com.qsxh.service.IInformPushBiz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//消息推送业务
@Service("informPushBiz")
public class InformPushBizImpl implements IInformPushBiz {

    @Resource
    private InformDao informDao;

    private List<String> userids;

    @Qualifier(value="MessageProducer2")
    @Autowired
    private MessageProducer2 messageProducer;

    //历史推送消息
    @Override
    public Map<String, Object> informList(Inform inform) {
        int page = inform.getPage();
        int limit = inform.getLimit();

        inform.setPage((page - 1) * limit);
//        System.out.println("查询条件："+inform.getUserid()+inform.getBegindate()+inform.getEnddate());
        List<Inform> list = informDao.informList(inform);
        int count = informDao.informCount(inform);
        System.out.println("总条数："+count);

        Map<String , Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg", "");
        map.put("count", count);
        map.put("data", list);
        return map;
    }

    //新增推送
    @Override
    public String addPush(Inform inform) {

        //获取系统时间，作为消息推送时间
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String now = dateFormat.format(new Date());
        inform.setItime(now);

        System.out.println("后台接受数据："+inform.getItoid()+inform.getItime());
//        try {
//            messageProducer.sendMessage("测试消息消费者能否收到此条消息===============");
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        //根据推送接收人群 查出所有用户
        if (null != inform.getItoid() || !"".equals(inform.getItoid()))
        {
            switch (inform.getItoid())
            {
                case "all":
                userids = informDao.findAll(null);
                    break;
                case "allMan":
                userids = informDao.findAllMan(null);
                    break;
                case "allWomen":
                userids = informDao.findAllWomen(null);
                    break;
                case "allUser":
                userids = informDao.findAllUser(null);
                    break;
                case "allVip":
                userids = informDao.findAllVip(null);
                    break;
                default:
                    break;
            }
            for (String userid : userids)
            {
                //交给 消息生产者 将消息放入队列
                //格式：itime,ititle,icontext,itype,itoid,iurl
                inform.setItoid(userid);
                Gson gson = new Gson();
                String informJson = gson.toJson(inform);
                try {
                    messageProducer.sendMessage(informJson);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return "success";//暂时返回成功，因为不好判断所有用户都有收到消息
    }
}
