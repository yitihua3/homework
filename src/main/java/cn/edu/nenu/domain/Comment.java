package cn.edu.nenu.domain;

import cn.edu.nenu.config.orm.IdEntity;

import javax.persistence.*;

/**
 * Created by wangh on 2019/6/30.
 */
@Entity
@Table(name = "t_comment")
public class Comment extends IdEntity {

    @ManyToOne
    @JoinColumn(name = "user_id",referencedColumnName = "id",nullable = false)
    private User user; //评论者

    @ManyToOne
    @JoinColumn(name = "article_id",referencedColumnName = "id",nullable = false)
    private Article article; //被评论的文章

    @Column
    private String time; //评论时间

    @Column
    private String content; //评论内容


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
