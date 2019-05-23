package cn.edu.nenu.domain;

/**
 * Created by wangh on 2019/3/29.
 */

import cn.edu.nenu.config.orm.IdEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 栏目分类
 */
@Entity
@Table(name = "T_CATEGORY")
public class Category extends IdEntity {

    @Column
    private String name;

    @Column
    private String sequence;

    @Column
    private String status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSequence() {
        return sequence;
    }

    public void setSequence(String sequence) {
        this.sequence = sequence;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
