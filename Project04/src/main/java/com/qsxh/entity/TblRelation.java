package com.qsxh.entity;

public class TblRelation {

    private String ffromid;
    private String ftoid;
    private String fgood;
    private String ffollow;
    private String giftno;

    public TblRelation(){}

    public String getGiftno() {
        return giftno;
    }

    public void setGiftno(String giftno) {
        this.giftno = giftno;
    }

    public String getFfromid() {
        return ffromid;
    }

    public void setFfromid(String ffromid) {
        this.ffromid = ffromid;
    }

    public String getFtoid() {
        return ftoid;
    }

    public void setFtoid(String ftoid) {
        this.ftoid = ftoid;
    }

    public String getFgood() {
        return fgood;
    }

    public void setFgood(String fgood) {
        this.fgood = fgood;
    }

    public String getFfollow() {
        return ffollow;
    }

    public void setFfollow(String ffollow) {
        this.ffollow = ffollow;
    }
}
