package com.qsxh.utiles;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Test {

    private String good;

    public static void main(String[] args) {
        String content="春天的how2619东方红interface故事";
        Map<Character,Integer> map=new HashMap();
        char[] arryChar=content.toCharArray();
        for(char c:arryChar){
            if(map.containsKey(c)){
                map.put(c, map.get(c)+1);
            }else{
                map.put(c, 1);
            }
        }
        System.out.println(map);
        Test.changeWeek();
    }

    public static void changeWeek(){

        Calendar cal = Calendar.getInstance();

        Date nowDay = new Date();

        SimpleDateFormat sdf = new SimpleDateFormat("dd");
        String dayNum = sdf.format(nowDay);

        cal.setTime(nowDay);

        int todayWeekNum = Calendar.DAY_OF_WEEK;

        cal.setTime(getFirst(nowDay));

        int firstWeekNum = Calendar.DAY_OF_WEEK;

        System.out.println("今天是本月第"+ dayNum +"天");
        System.out.println("今天是周"+todayWeekNum);
        System.out.println("今年的第一天是周"+firstWeekNum);
    }


    public static Date getFirst(Date nowDay){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
        String nowYear = sdf.format(nowDay);
        String dateStr = nowYear + "-01-01";
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date = sd.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println(dateStr);
        return date;
    }

    public static Date getDateByStr2(String dd)
    {

        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        Date date;
        try {
            date = sd.parse(dd);
        } catch (ParseException e) {
            date = null;
            e.printStackTrace();
        }
        return date;
    }

}
