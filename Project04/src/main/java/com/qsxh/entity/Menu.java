package com.qsxh.entity;

public class Menu {

    private String menuid;
    private String mname;
    private String nurl;
    private String fname;

    //无参构造
    public Menu() {
    }
    //全参构造


    public Menu(String menuid, String mname, String nurl, String fname) {
        this.menuid = menuid;
        this.mname = mname;
        this.nurl = nurl;
        this.fname = fname;
    }

    public String getMenuid() {
        return menuid;
    }

    public void setMenuid(String menuid) {
        this.menuid = menuid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getNurl() {
        return nurl;
    }

    public void setNurl(String nurl) {
        this.nurl = nurl;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }
}
