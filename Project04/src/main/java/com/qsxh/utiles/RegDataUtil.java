package com.qsxh.utiles;

public class RegDataUtil {

    public static final int ID_length=18;

    //根据身份证获取出生年月
    public static String getBirthday(String idCard){
        String birthday = null;
        String year =  idCard.substring(0,4);
        String mouth = idCard.substring(4,6);
        String day = idCard.substring(6,8);
        birthday = year+"-"+mouth+"-"+day;
        return birthday;
    }

    public static String GetYear(String ID)
    {
        Integer len=ID.length();
        if(len<ID_length)
            return null;
        return ID.substring(6,10);
    }

    public static String GetMonth(String ID)
    {
        Integer len=ID.length();
        if(len<ID_length)
            return null;
        return ID.substring(10,12);
    }

    public static String GetDay(String ID)
    {
        Integer len=ID.length();
        if(len<ID_length)
            return null;
        return ID.substring(12,14);
    }

    //根据身份证号码获取星座
    public static String GetConstellation(String ID)
    {
        int month=Integer.parseInt(GetMonth(ID));
        int day=Integer.parseInt(GetDay(ID));
        String value="";

        if(((month==3)   && (day >=21)) || ((month==4)  &&(day<=19))) value="白羊座";
        if(((month==4)   && (day >=20)) || ((month==5)  &&(day<=20))) value="金牛座";
        if(((month==5)   && (day >=21)) || ((month==6)  &&(day<=21))) value="双子座";
        if(((month==6)   && (day >=22)) || ((month==7)  &&(day<=22))) value="巨蟹座";
        if(((month==7)   && (day >=23)) || ((month==8)  &&(day<=22))) value="狮子座";
        if(((month==8)   && (day >=23)) || ((month==9)  &&(day<=22))) value="处女座";
        if(((month==9)   && (day >=23)) || ((month==10) &&(day<=23))) value="天秤座";
        if(((month==10)  && (day >=24)) || ((month==11) &&(day<=22))) value="天蝎座";
        if(((month==11)  && (day >=23)) || ((month==12) &&(day<=21))) value="射手座";
        if(((month==12)  && (day >=22)) || ((month==1)  &&(day<=19))) value="摩羯座";
        if(((month==1)   && (day >=20)) || ((month==2)  &&(day<=18))) value="水瓶座";
        if(((month==2)   && (day >=19)) || ((month==3)  &&(day<=20))) value="双鱼座";

        return value;
    }

}
