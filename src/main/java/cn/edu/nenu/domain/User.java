package cn.edu.nenu.domain;
import cn.edu.nenu.config.orm.IdEntity;

import javax.persistence.*;
/**
 * description:
 * user:芋头
 * date:2019/6/21
 * time:13:23
 */
/**
 * 用户管理
 */
@Entity
@Table(name = "T_USER")
public class User extends IdEntity {


    @Column(length = 36,unique=true,nullable = false)
    private String userName;  //用户名

    @Column(length = 128,nullable = false)
    private String password;  //密码

    @Column(length = 225)
    private String image;  //头像

    @Column(length = 20,nullable = false)
    private int role;    //角色

    @Column()
    private float sort; //排序

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public float getSort() {
        return sort;
    }

    public void setSort(float sort) {
        this.sort = sort;
    }

    @Override
    public String toString() {
        return "User{" +
                "userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", image='" + image + '\'' +
                ", role=" + role +
                ", sort=" + sort +
                '}';
    }
}
