package com.qsxh.entity;

public class UserAndData {
    private String userid;
    private int uage; //年龄------1
    private String upass;
    private String uname;
    private String roleid;
    private String uimgurl;
    private String ustate;
    private String uonline;
    private String regdate;
    private String usex;//性别
    private String ubirthday;//生日
    private String uwechat;
    private String uaddress;//所在地------2
    private String uheight;//身高------3
    private String uweight;
    private String uedu;//学历------4
    private String umerried;//婚姻状况------5
    private String ublood;//血型------6
    private String uschool;
    private String ucharm;
    private String uinstro;
    private String ugold;
    private String uincome;//收入------7
    private String conste;//星座
    private String realname;//真实姓名
    private String positions;//职位
    private String uwork;//工作类别------8
    private String major;//专业
    private String gradtime;//毕业时间
    private String uhouse;//住房------9
    private String ucar;//车------10
    private String s_province;//省
    private String s_city;//市
    private String uageRange;//年龄范围
    private String minbir; //最小年龄de年份
    private String maxbir; //最大年龄de年份
    private String condition;  //查询条件
    private int limit;  //查询的记录条数
    private String limitString;//接收limit
    private int count;//匹配指数
    private int page;//页数

    public UserAndData() {
    }

    public UserAndData(String userid, int uage, String upass, String uname, String roleid, String uimgurl, String ustate, String uonline, String regdate, String usex, String ubirthday, String uwechat, String uaddress, String uheight, String uweight, String uedu, String umerried, String ublood, String uschool, String ucharm, String uinstro, String ugold, String uincome, String conste, String realname, String positions, String uwork, String major, String gradtime, String uhouse, String ucar, String s_province, String s_city, String uageRange, String minbir, String maxbir, String condition, int limit, String limitString, int count, int page) {
        this.userid = userid;
        this.uage = uage;
        this.upass = upass;
        this.uname = uname;
        this.roleid = roleid;
        this.uimgurl = uimgurl;
        this.ustate = ustate;
        this.uonline = uonline;
        this.regdate = regdate;
        this.usex = usex;
        this.ubirthday = ubirthday;
        this.uwechat = uwechat;
        this.uaddress = uaddress;
        this.uheight = uheight;
        this.uweight = uweight;
        this.uedu = uedu;
        this.umerried = umerried;
        this.ublood = ublood;
        this.uschool = uschool;
        this.ucharm = ucharm;
        this.uinstro = uinstro;
        this.ugold = ugold;
        this.uincome = uincome;
        this.conste = conste;
        this.realname = realname;
        this.positions = positions;
        this.uwork = uwork;
        this.major = major;
        this.gradtime = gradtime;
        this.uhouse = uhouse;
        this.ucar = ucar;
        this.s_province = s_province;
        this.s_city = s_city;
        this.uageRange = uageRange;
        this.minbir = minbir;
        this.maxbir = maxbir;
        this.condition = condition;
        this.limit = limit;
        this.limitString = limitString;
        this.count = count;
        this.page = page;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public int getUage() {
        return uage;
    }

    public void setUage(int uage) {
        this.uage = uage;
    }

    public String getUpass() {
        return upass;
    }

    public void setUpass(String upass) {
        this.upass = upass;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }

    public String getUimgurl() {
        return uimgurl;
    }

    public void setUimgurl(String uimgurl) {
        this.uimgurl = uimgurl;
    }

    public String getUstate() {
        return ustate;
    }

    public void setUstate(String ustate) {
        this.ustate = ustate;
    }

    public String getUonline() {
        return uonline;
    }

    public void setUonline(String uonline) {
        this.uonline = uonline;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex;
    }

    public String getUbirthday() {
        return ubirthday;
    }

    public void setUbirthday(String ubirthday) {
        this.ubirthday = ubirthday;
    }

    public String getUwechat() {
        return uwechat;
    }

    public void setUwechat(String uwechat) {
        this.uwechat = uwechat;
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

    public String getUweight() {
        return uweight;
    }

    public void setUweight(String uweight) {
        this.uweight = uweight;
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

    public String getUschool() {
        return uschool;
    }

    public void setUschool(String uschool) {
        this.uschool = uschool;
    }

    public String getUcharm() {
        return ucharm;
    }

    public void setUcharm(String ucharm) {
        this.ucharm = ucharm;
    }

    public String getUinstro() {
        return uinstro;
    }

    public void setUinstro(String uinstro) {
        this.uinstro = uinstro;
    }

    public String getUgold() {
        return ugold;
    }

    public void setUgold(String ugold) {
        this.ugold = ugold;
    }

    public String getUincome() {
        return uincome;
    }

    public void setUincome(String uincome) {
        this.uincome = uincome;
    }

    public String getConste() {
        return conste;
    }

    public void setConste(String conste) {
        this.conste = conste;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getPositions() {
        return positions;
    }

    public void setPositions(String positions) {
        this.positions = positions;
    }

    public String getUwork() {
        return uwork;
    }

    public void setUwork(String uwork) {
        this.uwork = uwork;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getGradtime() {
        return gradtime;
    }

    public void setGradtime(String gradtime) {
        this.gradtime = gradtime;
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

    public String getS_province() {
        return s_province;
    }

    public void setS_province(String s_province) {
        this.s_province = s_province;
    }

    public String getS_city() {
        return s_city;
    }

    public void setS_city(String s_city) {
        this.s_city = s_city;
    }

    public String getUageRange() {
        return uageRange;
    }

    public void setUageRange(String uageRange) {
        this.uageRange = uageRange;
    }

    public String getMinbir() {
        return minbir;
    }

    public void setMinbir(String minbir) {
        this.minbir = minbir;
    }

    public String getMaxbir() {
        return maxbir;
    }

    public void setMaxbir(String maxbir) {
        this.maxbir = maxbir;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public String getLimitString() {
        return limitString;
    }

    public void setLimitString(String limitString) {
        this.limitString = limitString;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }
}
