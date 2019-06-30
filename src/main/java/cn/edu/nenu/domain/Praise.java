package cn.edu.nenu.domain;

import cn.edu.nenu.config.orm.IdEntity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Created by wangh on 2019/6/30.
 */
@Entity
@Table(name = "t_praise")
public class Praise extends IdEntity {

    @ManyToOne
    @JoinColumn(name = "user_id",referencedColumnName = "id",nullable = false)
    private User user; //点赞者

    @ManyToOne
    @JoinColumn(name = "article_id",referencedColumnName = "id",nullable = false)
    private Article article; //被点赞的文章

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
}
