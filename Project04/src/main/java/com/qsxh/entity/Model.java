package com.qsxh.entity;

public class Model {
    private String name;
    private String idcard;
    private String res;
    private String description;
    private String sex;
    private String birthday;
    private String address;
    private String isok;
    private String constellations;

    public Model() {
    }

    public Model(String name, String idcard, String res, String description, String sex, String birthday, String address) {
        this.name = name;
        this.idcard = idcard;
        this.res = res;
        this.description = description;
        this.sex = sex;
        this.birthday = birthday;
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getRes() {
        return res;
    }

    public void setRes(String res) {
        this.res = res;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getIsok() {
        return isok;
    }

    public void setIsok(String isok) {
        this.isok = isok;
    }

    public String getConstellations() {
        return constellations;
    }

    public void setConstellations(String constellations) {
        this.constellations = constellations;
    }
}
