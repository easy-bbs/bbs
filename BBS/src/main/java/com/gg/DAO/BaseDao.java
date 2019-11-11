package com.gg.DAO;


import com.gg.Bean.Image;
import com.gg.Bean.Sign_info;
import com.gg.Bean.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.io.Serializable;
import java.util.List;

/**
 * lgg
 * 2019/7/30
 */
@Repository
public interface BaseDao<T> {

    /**
     * 保存tb_user表
     */
    //alter table emp  AUTO_INCREMENT=1;
    @Insert("insert into tb_user (user_name,user_id,password,permission,creat_time) values(#{user_name},#{user_id},#{password},0,now()) ")
    void save(T bean);

    /**
     * 按照id查询tb_user表
     */
    @Select("select * from tb_user where user_id = #{user_id}")
    User selectById(Serializable user_id);

    /**
     *按照id查询tb_info表
     */
    @Select("select * from tb_info where user_id = #{user_id}")
    Sign_info select(Serializable user_id);

    /**
     *
     */
    @Select("SELECT * from tb_info  order by sign_in_time DESC  LIMIT 10")
    List<Sign_info> selectTopTen();

    /**
     * 查询所有数据
     */
    @Select("select * from tb_info")
    List<Sign_info> findAll();

    /**
     * 修改
     */
    @Update("update tb_info set sign_in_time = #{sign_in_time}," +
                                "rank = #{rank} " +
                                "where id = #{id} ")
    void updata(T bean);

    /**
     * 修改密码
     */
    @Update("update tb_user set password = #{password} where user_id = #{user_id} ")
    void changePwd(T bean);
    /**
     * 根据ID删除
     */
    @Delete("delete from tb_info where id = #{id}")
    void deleteById(Serializable id);

    /**
     * 根据学号删除
     */
    @Delete("delete from tb_info where user_id = #{user_id}")
    void deleteByUser_id(Serializable user_id);

    /**
     * 保存tb_info表
     */
    @Insert("insert into tb_info(name,user_id,sign_in_time,rank) values (#{name},#{user_id},#{sign_in_time},#{rank})")
    void add(T bean);

    /**
     * 保存图片本地地址
     */
    @Insert("insert into tb_images(uname,image) values (#{uname},#{image})")
    void setImg(Image img);


}
