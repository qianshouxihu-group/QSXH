package com.qsxh.service.impl;

import com.qsxh.dao.DatingDao;
import com.qsxh.dao.InformDao;
import com.qsxh.dao.MessageDao;
import com.qsxh.entity.Dating;
import com.qsxh.entity.Inform;
import com.qsxh.entity.Message;
import com.qsxh.service.IInformBiz;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

//我的消息业务
@Service("informBiz")
public class InformBizImpl implements IInformBiz {
    @Resource
    private InformDao informDao ;//系统、活动消息dao层
    @Resource
    private MessageDao messageDao ;//留言dao层
    @Resource
    private DatingDao datingDao;//约会dao层

    //系统消息
    @Override
    public List<Inform> systemInform(String userid) {
        List<Inform> list = informDao.systemInform(userid);
        return list;
    }
    //活动消息
    @Override
    public List<Inform> activeInform(String userid) {
        List<Inform> list = informDao.activeInform(userid);
        return list;
    }
    //我的留言
    @Override
    public List<Message> messageInform(String userid) {
        List<Message> list = messageDao.messageInform(userid);
        return list;
    }
    //我的约会
    @Override
    public List<Dating> datingInform(String userid) {
        List<Dating> list = datingDao.datingInform(userid);
        return list;
    }

    //系统消息，活动消息 查看详情
    @Override
    public Inform informDetails(String informid) {
        Inform inform = informDao.informDetails(informid);
        return inform;
    }
    //系统消息，活动消息 已读
    @Override
    public boolean readSysOrActive(String informid) {
        Integer num = informDao.readSysOrActive(informid);
        if(num > 0 )
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    //我的留言 查看详情
    @Override
    public Message msgDetails(String msgid) {
        Message message = messageDao.messageDetails(msgid);
        return message;
    }
    //我的留言 已读
    @Override
    public boolean readMsg(String msgid) {
        Integer num = messageDao.readMessage(msgid);
        if(num > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    //我的留言 回复
    @Override
    public String addOneRecord(Message message) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String mtime = dateFormat.format(new Date());
        message.setMtime(mtime);
        message.setMfromid("1001");//先写死，后面从session取

        Integer num = messageDao.addOneRecord(message);
        if(num > 0 )
        {
            return "replySuccess";
        }
        else
        {
            return "replyFail";
        }
    }

    //我的约会 查看详情
    @Override
    public Dating datingDetails(String dateid) {
        Dating dating = datingDao.datingDetails(dateid);
        return dating;
    }
    //我的约会 回复并接受
    @Override
    @Transactional
    public String replyAndAccept(Dating dating) {
        Integer num1 = datingDao.replyDating(dating);
        Integer num2 = datingDao.acceptDating(dating);
        if (num1 > 0 && num2 >0)
        {
            return "success";
        }
        else
        {
            return "fail";
        }
    }
    //我的约会 拒绝
    @Override
    public String reject(String dateid) {
        Integer num = datingDao.rejectDating(dateid);
        if (num > 0)
        {
            return "success";
        }
        else
        {
            return "fail";
        }
    }

}
