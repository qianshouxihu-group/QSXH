package com.qsxh.entity;

public class FundEntity {

    private String accountid;
    private String adate;
    private String agold;
    private String atype;
    private String userid;
    private String rmb;
    private Integer limit;
    private Integer page;
    private String begindate;
    private String enddate;

    private String pname;
    public FundEntity() {
    }


    public FundEntity(String accountid, String adate, String agold, String atype, String userid, String rmb, Integer limit, Integer page, String begindate, String enddate, String pname) {
        this.accountid = accountid;
        this.adate = adate;
        this.agold = agold;
        this.atype = atype;
        this.userid = userid;
        this.rmb = rmb;
        this.limit = limit;
        this.page = page;
        this.begindate = begindate;
        this.enddate = enddate;
        this.pname = pname;
    }


    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getAccountid() {
        return accountid;
    }

    public void setAccountid(String accountid) {
        this.accountid = accountid;
    }

    public String getAdate() {
        return adate;
    }

    public void setAdate(String adate) {
        this.adate = adate;
    }

    public String getAgold() {
        return agold;
    }

    public void setAgold(String agold) {
        this.agold = agold;
    }

    public String getAtype() {
        return atype;
    }

    public void setAtype(String atype) {
        this.atype = atype;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getRmb() {
        return rmb;
    }

    public void setRmb(String rmb) {
        this.rmb = rmb;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
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
