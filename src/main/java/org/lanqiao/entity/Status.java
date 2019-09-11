package org.lanqiao.entity;

public class Status {
    private String statusId;

    private String statusAlias1;

    private String statusAlias2;

    private Integer statusClass;

    private String statusDesc;

    public String getStatusId() {
        return statusId;
    }

    public void setStatusId(String statusId) {
        this.statusId = statusId == null ? null : statusId.trim();
    }

    public String getStatusAlias1() {
        return statusAlias1;
    }

    public void setStatusAlias1(String statusAlias1) {
        this.statusAlias1 = statusAlias1 == null ? null : statusAlias1.trim();
    }

    public String getStatusAlias2() {
        return statusAlias2;
    }

    public void setStatusAlias2(String statusAlias2) {
        this.statusAlias2 = statusAlias2 == null ? null : statusAlias2.trim();
    }

    public Integer getStatusClass() {
        return statusClass;
    }

    public void setStatusClass(Integer statusClass) {
        this.statusClass = statusClass;
    }

    public String getStatusDesc() {
        return statusDesc;
    }

    public void setStatusDesc(String statusDesc) {
        this.statusDesc = statusDesc == null ? null : statusDesc.trim();
    }
}