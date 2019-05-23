package cn.edu.nenu.domain;

/**
 * Created by wangh on 2019/3/29.
 */

import cn.edu.nenu.config.orm.IdEntity;

import javax.persistence.*;


/**
 * 用户管理
 */
@Entity
@Table(name = "T_USER")
public class User extends IdEntity {

    @Column(length = 128)
    private String realName;  //真实姓名

    @ManyToOne
    @JoinColumn(name = "gender_id",referencedColumnName = "id",nullable = false)
    private Dict sex;  //性别

    @Column
    private String email;     //邮箱

    @Column(length = 11)
    private String phone;     //联系方式

    @Column(length = 36,unique=true,nullable = false)
    private String userName;  //用户名

    @Column(length = 128,nullable = false)
    private String password;  //密码

    @Column
    private String status;    //状态

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Dict getSex() {
        return sex;
    }

    public void setSex(Dict sex) {
        this.sex = sex;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
