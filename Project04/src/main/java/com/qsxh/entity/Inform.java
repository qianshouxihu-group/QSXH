package com.qsxh.entity;
//(系统、活动)消息实体类
public class Inform {
    private Integer informid;
    private String itime;
    private String ititle;
    private String icontext;
    private String itype;
    private String itoid;
    private String iurl;
    private String istate;

    private int page;
    private int limit;
    private String begindate;//查询条件 起始时间
    private String enddate;//查询条件 终止时间

    public Inform() {
    }

    public Inform(Integer informid, String itime, String ititle, String icontext, String itype, String itoid, String iurl, String istate, int page, int limit, String begindate, String enddate) {
        this.informid = informid;
        this.itime = itime;
        this.ititle = ititle;
        this.icontext = icontext;
        this.itype = itype;
        this.itoid = itoid;
        this.iurl = iurl;
        this.istate = istate;
        this.page = page;
        this.limit = limit;
        this.begindate = begindate;
        this.enddate = enddate;
    }

    public Integer getInformid() {
        return informid;
    }

    public void setInformid(Integer informid) {
        this.informid = informid;
    }

    public String getItime() {
        return itime;
    }

    public void setItime(String itime) {
        this.itime = itime;
    }

    public String getItitle() {
        return ititle;
    }

    public void setItitle(String ititle) {
        this.ititle = ititle;
    }

    public String getIcontext() {
        return icontext;
    }

    public void setIcontext(String icontext) {
        this.icontext = icontext;
    }

    public String getItype() {
        return itype;
    }

    public void setItype(String itype) {
        this.itype = itype;
    }

    public String getItoid() {
        return itoid;
    }

    public void setItoid(String itoid) {
        this.itoid = itoid;
    }

    public String getIurl() {
        return iurl;
    }

    public void setIurl(String iurl) {
        this.iurl = iurl;
    }

    public String getIstate() {
        return istate;
    }

    public void setIstate(String istate) {
        this.istate = istate;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public String getBegindate() {
        return begindate;
    }

    public void setBegindate(String begindate) {
        this.begindate = begindate;
    }

    public String getEnddate() {
        return enddate;
    }

    public void setEnddate(String enddate) {
        this.enddate = enddate;
    }
}
