package com.gg.Bean;

/**
 * lgg
 * 2019/8/6
 */
public class Sign_info {

    /**
     * 标识种子、标识增量、主键
     */
    private Integer id;

    /**
     * 姓名
     */
    private String name;

    /**
     * 学号
     */
    private Integer user_id;

    /**
     * 签到时间
     */
    private Integer sign_in_time;

    /**
     * 签到时间排名
     */
    private Integer rank;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getSign_in_time() {
        return sign_in_time;
    }

    public void setSign_in_time(Integer sign_in_time) {
        this.sign_in_time = sign_in_time;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    @Override
    public String toString() {
        return "Sign_info{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", user_id=" + user_id +
                ", sign_in_time=" + sign_in_time +
                ", rank=" + rank +
                '}';
    }
}
