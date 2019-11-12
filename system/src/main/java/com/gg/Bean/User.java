package com.gg.Bean;

import java.io.Serializable;
import java.util.Date;

/**
 * lgg
 * 2019/7/29
 */
public class User implements Serializable {

    /**
     * 标识种子、标识增量、主键
     */
    private Integer id;

    /**
     * 用户名
     */
    private String user_name;

    /**
     * 用户id
     */
    private Integer user_id;

    /**
     * 密码
     */
    private String password;

    /**
     * 用户权限：1为管理员，0为普通用户
     */
    private Integer permission;

    /**
     *创建时间
     */
    private Date create_time;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getPermission() {
        return permission;
    }

    public void setPermission(Integer permission) {
        this.permission = permission;
    }

    public Date getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Date create_time) {
        this.create_time = create_time;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", user_name='" + user_name + '\'' +
                ", user_id=" + user_id +
                ", password='" + password + '\'' +
                ", permission=" + permission +
                ", create_time=" + create_time +
                '}';
    }

}
