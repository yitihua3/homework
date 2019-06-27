package cn.edu.nenu.domain;

import cn.edu.nenu.config.orm.IdEntity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * ssh
 * Created by chenf on 2019/6/16.
 * 文章所属类型
 */
@Entity
@Table(name = "t_category")
public class Category extends IdEntity {
    //类型名称
    @Column
    private String typename;

    //所属大类对应的id，如果为0则为大类，不为0则所属大类的id
    @Column(nullable = false)
    private Long  parents_id;
    //排序
    @Column()
    private float sort;

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public Long getParents_id() {
        return parents_id;
    }

    public void setParents_id(Long parents_id) {
        this.parents_id = parents_id;
    }

    public float getSort() {
        return sort;
    }

    public void setSort(float sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return "Category{" +
                "typename='" + typename + '\'' +
                ", parents_id=" + parents_id +
                ", sort=" + sort +
                '}';
    }
}
