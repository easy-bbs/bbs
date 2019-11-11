package com.gg.Service;

import com.gg.Bean.Image;
import com.gg.Bean.Sign_info;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.List;

/**
 * lgg
 * 2019/7/30
 */
public interface IService<T> {
    /**
     * 插入一条信息
     */
    void save(T bean);
    void add(T bean);

    /**
     * 按用户账号查询
     * @param user_id
     * @return
     */
    T getById(Serializable user_id);

    T select(Serializable user_id);

    /**
     * 根据id删除信息
     */
    void deleteById(Serializable id);

    /**
     * 根据学号删除
     */
    void deleteByUser_id(Serializable User_id);

    /**
     * 根据用户账号更新
     */

    void updata(T bean);

    /**
     * 查询所有数据
     */
    List<T> findAll();

    /**
     * 修改用户密码
     */
    void changePwd(T bean);

    /**
     * 获取排名前十的信息
     */
    List<T> SelectTopTen();

    /**
     * 保存图片
     */
    void setImage(String filePath,String name);


}
