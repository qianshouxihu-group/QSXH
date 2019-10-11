package com.qsxh.entity;

public class Menu1 {

    private String roleid;
    private String menuid;
    private String fid;
    private String mname;
        private String id;

        private String pid;

        private String title;

        private String href;

        private Integer spread;

        private String target;

        private String icon;

        private Integer available;

        public Menu1() {
            // TODO Auto-generated constructor stub
        }

        public Menu1(String id, String pid, String title, String href, Integer spread, String target, String icon,
                     Integer available) {
            super();
            this.id = id;
            this.pid = pid;
            this.title = title;
            this.href = href;
            this.spread = spread;
            this.target = target;
            this.icon = icon;
            this.available = available;
        }

    public Menu1(String roleid, String menuid, String fid, String mname, String id, String pid, String title, String href, Integer spread, String target, String icon, Integer available) {
        this.roleid = roleid;
        this.menuid = menuid;
        this.fid = fid;
        this.mname = mname;
        this.id = id;
        this.pid = pid;
        this.title = title;
        this.href = href;
        this.spread = spread;
        this.target = target;
        this.icon = icon;
        this.available = available;
    }

    public String getRoleid() {
        return roleid;
    }

    public void setRoleid(String roleid) {
        this.roleid = roleid;
    }

    public String getMenuid() {
        return menuid;
    }

    public void setMenuid(String menuid) {
        this.menuid = menuid;
    }

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getId() {
            return id;
        }

        public void setId(String id) {
            this.id = id;
        }

        public String getPid() {
            return pid;
        }

        public void setPid(String pid) {
            this.pid = pid;
        }

        public Integer getSpread() {
            return spread;
        }

        public void setSpread(Integer spread) {
            this.spread = spread;
        }

        public String getTitle() {
            return title;
        }

        public void setTitle(String title) {
            this.title = title == null ? null : title.trim();
        }

        public String getHref() {
            return href;
        }

        public void setHref(String href) {
            this.href = href == null ? null : href.trim();
        }



        public String getTarget() {
            return target;
        }

        public void setTarget(String target) {
            this.target = target == null ? null : target.trim();
        }

        public String getIcon() {
            return icon;
        }

        public void setIcon(String icon) {
            this.icon = icon == null ? null : icon.trim();
        }

        public Integer getAvailable() {
            return available;
        }

        public void setAvailable(Integer available) {
            this.available = available;
        }

}
