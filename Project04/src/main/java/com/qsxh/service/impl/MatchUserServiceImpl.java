package com.qsxh.service.impl;

import com.qsxh.dao.MatchUserDao;
import com.qsxh.entity.UserAndData;
import com.qsxh.entity.UserCondition;
import com.qsxh.service.MatchUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service("matchUserService")
public class MatchUserServiceImpl implements MatchUserService {

    private List<UserAndData> list;
    private UserCondition userCondition = new UserCondition();
    @Resource
    private MatchUserDao matchUserDao;
    private int limitpage = 0;//当前页数
    private int limitSize = 30; //显示记录条数

    /*
    按照魅力值查询用户列表
     */
    public List<UserAndData> findUserByCharisma(UserAndData userAndData){
        limitpage = 0;
        limitSize = Integer.parseInt(userAndData.getLimitString());//记录初始显示的条数
        //获取现在的时间
        Calendar mycalendar=Calendar.getInstance();
        //获取年份
        String year=String.valueOf(mycalendar.get(Calendar.YEAR));
        int minage = (Integer.parseInt(year)-18);
        int maxage = (Integer.parseInt(year)-200);
        userAndData.setMinbir(minage+"");//设置默认最小年龄de年份
        userAndData.setMaxbir(maxage+"");//设置默认最大年龄de年份
        userAndData.setUageRange("不限");
        userAndData.setLimit(Integer.parseInt(userAndData.getLimitString()));//将前台页面传来的要显示的记录条数转成int
        //将list中的出生年月换算成年龄在页面显示，hs()
        list = hs(matchUserDao.findUserByCondition(userAndData));
        return list;
    }
    /*
    按照搜索条件查询用户列表
     */
    public List<UserAndData> findUserByCondition(UserAndData userAndData){
        limitpage = 0;
        limitSize = Integer.parseInt(userAndData.getLimitString());
        //条件整合
        UserAndData userAndData1 = Condition(userAndData);
        //将list中的出生年月换算成年龄在页面显示，hs()
        list = hs(matchUserDao.findUserByCondition(userAndData1));
        return list;
    }

    /*
    按时间查询
     */
    @Override
    public List<UserAndData> findUserByTime(UserAndData userAndData) {
        userAndData.setLimit(Integer.parseInt(userAndData.getLimitString()));//将前台页面传来的要显示的记录条数转成int
        //将list中的出生年月换算成年龄在页面显示，hs()
        list = hs(matchUserDao.findUserByCondition(userAndData));
        return list;
    }

    /*
    智能匹配
     */
    @Override
    public List<UserAndData> SmartUser(String id) {
        //根据userid查出择偶要求,以及用户的性别
        userCondition = matchUserDao.findUserCondition(id);



        //需要判断该用户择偶要求是否为空！！！
        //如果是空，跳到提示页面，提示页面可以跳转到完善资料页



        //获取年龄范围
        int minage = 0;
        int maxage = 0;
        if(!userCondition.getAgerange().equals("不限")){
            String[] Age = userCondition.getAgerange().split("-");
            minage=Integer.parseInt(Age[0]);
            minage=Integer.parseInt(Age[1]);
        }
        //获取身高范围
        String[] Height = userCondition.getUheight().split("-");
        userCondition.setMinHeight(Height[0]);
        userCondition.setMaxHeight(Height[1]);
        //根据用户的性别查询异性
        if (userCondition.getUsex().equals("男")){
            userCondition.setUsex("女");
        }else{
            userCondition.setUsex("男");
        }
        //获取现在的时间
        Calendar mycalendar=Calendar.getInstance();
        //获取年份
        String year=String.valueOf(mycalendar.get(Calendar.YEAR));
        //将条件中的最小最大年龄转换成出生年
        userCondition.setMinBir(Integer.parseInt(year)-minage+"");
        userCondition.setMaxBir(Integer.parseInt(year)-maxage+"");
        userCondition.setMinage(minage);
        userCondition.setMaxage(maxage);
        //将择偶要求作为条件进行匹配,查出所有任意符合其中一个条件及以上的异性用户
        list = matchUserDao.SmartMatchAll(userCondition);
        //list统计匹配指数
        list = MatchCalculation(list);
        //按照匹配指数对list进行排序
        list = MatchRank(list);
        return list;
    }

    /*
    分页
     */
    @Override
    public List<UserAndData> Page(UserAndData userAndData) {
        limitpage = (limitpage+1)*limitSize;
        userAndData.setPage(limitpage);
        //条件整合
        UserAndData userAndData1 = Condition(userAndData);
        limitSize += limitSize;
        userAndData1.setLimit(limitSize);
        list = hs(matchUserDao.findUserByCondition(userAndData1));
        return list;
    }

    /*
        统计匹配指数的方法
     */
    public List<UserAndData> MatchCalculation(List<UserAndData> list){
        //对List进行指数打分并排序
        for (int i=0;i<list.size();i++){
            int count=0;//记录匹配指数
            //1.年龄
            if(list.get(i).getUageRange() != null) {
                //获取现在的时间
                Calendar mycalendar=Calendar.getInstance();
                //获取年份
                String year=String.valueOf(mycalendar.get(Calendar.YEAR));
                //将条件中的最小最大年龄转换成出生年
                if ((list.get(i).getUage()>=userCondition.getMinage() && list.get(i).getUage()<=userCondition.getMaxage()) || userCondition.getAgerange().equals("不限")){
                    count++;
                }
            }
            //2.所在地
            if(list.get(i).getUaddress() != null) {
                if(list.get(i).getUaddress().equals(userCondition.getUaddress()) || userCondition.getUaddress().equals("不限") || userCondition.getUaddress().equals("选择省份地级市") ){
                    count++;
                }
            }
            //3.身高
            if(list.get(i).getUheight() != null) {
                if((Integer.parseInt(list.get(i).getUheight())>=Integer.parseInt(userCondition.getMinHeight()) && Integer.parseInt(list.get(i).getUheight())<=Integer.parseInt(userCondition.getMaxHeight())) || userCondition.getUheight().equals("不限")){
                    count++;
                }
            }
            //4.学历
            if(list.get(i).getUedu() != null) {
                if (list.get(i).getUedu().equals(userCondition.getUedu()) || userCondition.getUedu().equals("不限")){
                    count++;
                }
            }
            //5.婚姻状况
            if(list.get(i).getUmerried() != null) {
                if (list.get(i).getUmerried().equals(userCondition.getUmerried()) || userCondition.getUmerried().equals("不限")){
                    count++;
                }
            }
            //6.血型
            if(list.get(i).getUblood() != null) {
                if (list.get(i).getUblood().equals(userCondition.getUblood()) || userCondition.getUblood().equals("不限")){
                    count++;
                }
            }
            //7.收入
            if(list.get(i).getUincome() != null){
                if (list.get(i).getUincome().equals(userCondition.getUincome()) || userCondition.getUincome().equals("不限")){
                    count++;
                }
            }
            //8.工作类别
            if(list.get(i).getUwork() != null){
                if (list.get(i).getUwork().equals(userCondition.getUwork()) || userCondition.getUwork().equals("不限")){
                    count++;
                }
            }
            //9.住房
            if(list.get(i).getUhouse() != null){
                if (list.get(i).getUhouse().equals(userCondition.getUhouse()) || userCondition.getUhouse().equals("不限")){
                    count++;
                }
            }
            //10.车
            if(list.get(i).getUcar() != null){
                if (list.get(i).getUcar().equals(userCondition.getUcar()) || userCondition.getUcar().equals("不限")){
                    count++;
                }
            }
            //将count记录
            list.get(i).setCount(count);
        }
        return list;
    }

    /*
    换算年龄
     */
    public List<UserAndData> hs(List<UserAndData> list){
        //获取现在的时间
        Calendar mycalendar=Calendar.getInstance();
        //获取年份
        String year=String.valueOf(mycalendar.get(Calendar.YEAR));
        for (int i = 0; i <list.size() ; i++) {
            String[] arg = list.get(i).getUbirthday().split("-");
            int age = Integer.parseInt(year)-Integer.parseInt(arg[0]);
            list.get(i).setUage(age);
        }
        return list;
    }
    /*
        给list进行匹配度排序
     */
    public List<UserAndData> MatchRank(List<UserAndData> list){
        Collections.sort(list, new Comparator<UserAndData>() {

            public int compare(UserAndData u1, UserAndData u2) {

                // 按照匹配指数进行降序排列
                if (u1.getCount() > u2.getCount()) {
                    return -1;
                }
                if (u1.getCount() == u2.getCount()) {
                    return 0;
                }
                return 1;
            }
        });
        return list;
    }

    //条件整合方法
    public UserAndData Condition(UserAndData userAndData){
        userAndData.setLimit(Integer.parseInt(userAndData.getLimitString()));//将前台页面传来的要显示的记录条数转成int
        if("省份".equals(userAndData.getS_province())||"选择省份".equals(userAndData.getS_province())){
            userAndData.setUaddress("不限");
        }else if("地级市".equals(userAndData.getS_city())){
            userAndData.setUaddress(userAndData.getS_province());
        }else {
            userAndData.setUaddress(userAndData.getS_province()+userAndData.getS_city());
        }
        int minage;//最小年龄de年份
        int maxage;//最大年龄de年份
        //获取现在的时间
        Calendar mycalendar=Calendar.getInstance();
        //获取年份
        String year=String.valueOf(mycalendar.get(Calendar.YEAR));

        if("不限".equals(userAndData.getUageRange())){
            minage = (Integer.parseInt(year)-18);
            maxage = (Integer.parseInt(year)-200);
        }else if("53以上".equals(userAndData.getUageRange())){
            minage = (Integer.parseInt(year)-53);
            maxage = (Integer.parseInt(year)-200);
        }else{
            String age[] = userAndData.getUageRange().split("-");//将年龄范围切割为最大，最小年龄
            minage = (Integer.parseInt(year)-Integer.parseInt(age[0]));
            maxage = (Integer.parseInt(year)-Integer.parseInt(age[1]));
        }
        userAndData.setMinbir(minage+"");
        userAndData.setMaxbir(maxage+"");
        return userAndData;
    }
}
