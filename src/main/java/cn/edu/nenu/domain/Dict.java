package cn.edu.nenu.domain;
import cn.edu.nenu.config.orm.IdEntity;
import cn.edu.nenu.util.Constants;

import javax.persistence.*;

/**
 * Created by wangh on 2019/3/29.
 */


/**
 * 数据字典类：用于存放：性别、民族、政治面貌等常量
 */
@Entity
@Table(name = "T_DICT")

public class Dict extends IdEntity {

    @Column
    private String type;   //类型

    @Column
    private String code;   //编码

    @Column
    private String name;   //名称

    @Column
    private float sort;   //排序

    @Column
    private Constants.Status status = Constants.Status.DISABLE; //状态

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getSort() {
        return sort;
    }

    public void setSort(float sort) {
        this.sort = sort;
    }

    public Constants.Status getStatus() {
        return status;
    }

    public void setStatus(Constants.Status status) {
        this.status = status;
    }
}
