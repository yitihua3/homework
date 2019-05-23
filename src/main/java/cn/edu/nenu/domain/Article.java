package cn.edu.nenu.domain;

/**
 * Created by wangh on 2019/3/29.
 */

import cn.edu.nenu.config.orm.IdEntity;

import javax.persistence.*;

/**
 * 文章管理
 */
@Entity
@Table(name = "T_ARTICLE")
public class Article extends IdEntity {

    @Column
    private String title;

    @Lob  //大容量文本
    @Basic(fetch = FetchType.EAGER)
    private String content;

    @Column
    private String author;

    @Column
    private String createTime;

    @Column
    private String lastEditTime;

    @Column
    private String status;

    @ManyToOne
    @JoinColumn(name = "category_id",referencedColumnName = "id",nullable = false)
    private Category category;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getLastEditTime() {
        return lastEditTime;
    }

    public void setLastEditTime(String lastEditTime) {
        this.lastEditTime = lastEditTime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
