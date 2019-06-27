package cn.edu.nenu.domain;

/**
 * Created by wangh on 2019/3/29.
 */

import cn.edu.nenu.config.orm.IdEntity;

import javax.persistence.*;
import java.util.Date;

/**
 * 文章管理
 */
@Entity
@Table(name = "t_article")
public class Article extends IdEntity {

    @Column
    private String title; //文章标题

    @Lob  //大容量文本
    @Basic(fetch = FetchType.EAGER)
    private String content; //文章内容

    @ManyToOne
    @JoinColumn(name = "category_id",referencedColumnName = "id",nullable = false)
    private Category category; //文章类别

    @ManyToOne
    @JoinColumn(name = "user_id",referencedColumnName = "id",nullable = false)
    private User user; //作者

    //@Temporal(TemporalType.TIMESTAMP)
    @Column
    private Date createTime; //发布时间

    //@Temporal(TemporalType.TIMESTAMP)
    @Column
    private Date lastEditTime; //最后更新时间

    @Column(nullable = true)
    private String attachment; //附件

    @Column(length = 1)
    private int top; //置顶，1代表置顶，0代表不置顶

    @Column(length = 11)
    private int praise; //点赞量

    @Column(length = 11)
    private int view=0; //浏览量


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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastEditTime() {
        return lastEditTime;
    }

    public void setLastEditTime(Date lastEditTime) {
        this.lastEditTime = lastEditTime;
    }

    public String getAttachment() {
        return attachment;
    }

    public void setAttachment(String attachment) {
        this.attachment = attachment;
    }

    public int getTop() {
        return top;
    }

    public void setTop(int top) {
        this.top = top;
    }

    public int getPraise() {
        return praise;
    }

    public void setPraise(int praise) {
        this.praise = praise;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }
}
