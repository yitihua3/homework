package cn.edu.nenu.domain;

/**
 * Created by wangh on 2019/3/29.
 */

import cn.edu.nenu.config.orm.IdEntity;
import org.springframework.data.jpa.repository.EntityGraph;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 组织机构
 */
@Entity
@Table(name = "T_ORGANIZATION")
public class Organization extends IdEntity{

    @Column
    private String pid;       //父节点

    @Column(length = 32)
    private String coding;    //四位一体编码

    @Column(length = 128)
    private String name;      //组织名称

    @Column(length = 128)
    private String alias;     //组织别称

    @Column(length = 128)
    private String organizationCode;   //组织编码

    @Column
    private float sequence;      //同级排序

    @Column
    private String status;    //状态


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public String getOrganizationCode() {
        return organizationCode;
    }

    public void setOrganizationCode(String organizationCode) {
        this.organizationCode = organizationCode;
    }

    public float getSequence() {
        return sequence;
    }

    public void setSequence(float sequence) {
        this.sequence = sequence;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
