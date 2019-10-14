package com.qsxh.entity;

/**
 * 择偶条件类
 */
public class UserCondition {
    private String userid;//用户id
    private String agerange; //年龄范围------1
    private String uaddress;//所在地------2
    private String uheight;//身高范围------3
    private String uedu;//学历------4
    private String umerried;//婚姻状况------5
    private String ublood;//血型------6
    private String uincome;//收入------7
    private String uwork;//工作类别------8
    private String uhouse;//住房------9
    private String ucar;//车------10
    private String usex;//性别
    private int count = 0;//匹配指数
    private String maxBir;//最大年龄de年份
    private String minBir;//最小年龄de年份
    private int maxage;//最大年龄
    private int minage;//最小年龄
    private String maxHeight;//最高身高
    private String minHeight;//最低身高

    public UserCondition() {
    }

    public UserCondition(String userid, String agerange, String uaddress, String uheight, String uedu, String umerried, String ublood, String uincome, String uwork, String uhouse, String ucar, String usex, int count, String maxBir, String minBir, int maxage, int minage, String maxHeight, String minHeight) {
        this.userid = userid;
        this.agerange = agerange;
        this.uaddress = uaddress;
        this.uheight = uheight;
        this.uedu = uedu;
        this.umerried = umerried;
        this.ublood = ublood;
        this.uincome = uincome;
        this.uwork = uwork;
        this.uhouse = uhouse;
        this.ucar = ucar;
        this.usex = usex;
        this.count = count;
        this.maxBir = maxBir;
        this.minBir = minBir;
        this.maxage = maxage;
        this.minage = minage;
        this.maxHeight = maxHeight;
        this.minHeight = minHeight;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getAgerange() {
        return agerange;
    }

    public void setAgerange(String agerange) {
        this.agerange = agerange;
    }

    public String getUaddress() {
        return uaddress;
    }

    public void setUaddress(String uaddress) {
        this.uaddress = uaddress;
    }

    public String getUheight() {
        return uheight;
    }

    public void setUheight(String uheight) {
        this.uheight = uheight;
    }

    public String getUedu() {
        return uedu;
    }

    public void setUedu(String uedu) {
        this.uedu = uedu;
    }

    public String getUmerried() {
        return umerried;
    }

    public void setUmerried(String umerried) {
        this.umerried = umerried;
    }

    public String getUblood() {
        return ublood;
    }

    public void setUblood(String ublood) {
        this.ublood = ublood;
    }

    public String getUincome() {
        return uincome;
    }

    public void setUincome(String uincome) {
        this.uincome = uincome;
    }

    public String getUwork() {
        return uwork;
    }

    public void setUwork(String uwork) {
        this.uwork = uwork;
    }

    public String getUhouse() {
        return uhouse;
    }

    public void setUhouse(String uhouse) {
        this.uhouse = uhouse;
    }

    public String getUcar() {
        return ucar;
    }

    public void setUcar(String ucar) {
        this.ucar = ucar;
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getMaxBir() {
        return maxBir;
    }

    public void setMaxBir(String maxBir) {
        this.maxBir = maxBir;
    }

    public String getMinBir() {
        return minBir;
    }

    public void setMinBir(String minBir) {
        this.minBir = minBir;
    }

    public int getMaxage() {
        return maxage;
    }

    public void setMaxage(int maxage) {
        this.maxage = maxage;
    }

    public int getMinage() {
        return minage;
    }

    public void setMinage(int minage) {
        this.minage = minage;
    }

    public String getMaxHeight() {
        return maxHeight;
    }

    public void setMaxHeight(String maxHeight) {
        this.maxHeight = maxHeight;
    }

    public String getMinHeight() {
        return minHeight;
    }

    public void setMinHeight(String minHeight) {
        this.minHeight = minHeight;
    }
}
