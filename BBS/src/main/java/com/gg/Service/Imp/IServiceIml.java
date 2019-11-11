package com.gg.Service.Imp;

import com.gg.Bean.Image;
import com.gg.Bean.Sign_info;
import com.gg.DAO.BaseDao;
import com.gg.Service.IService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import java.util.UUID;

/**
 * lgg
 * 2019/7/30
 */
@Service("IService")
public class IServiceIml<T> implements IService<T> {


    @Autowired
    private BaseDao baseDao;


    @Override
    public void save(T bean) {
        baseDao.save(bean);
    }

    @Override
    public void add(T bean) {
        baseDao.add(bean);
    }

    @Override
    public T getById(Serializable id) {
        return (T) baseDao.selectById(id);
    }

    @Override
    public T select(Serializable user_id) {
        return (T) baseDao.select(user_id);
    }

    @Override
    public void deleteById(Serializable id) {
        baseDao.deleteById(id);
    }

    @Override
    public void deleteByUser_id(Serializable user_id) {
        baseDao.deleteByUser_id(user_id);
    }

    @Override
    public void updata(T bean) {
        baseDao.updata(bean);
    }



    @Override

    public List<T> findAll() {
        return baseDao.findAll();
    }

    @Override
    public void changePwd(T bean) {
        baseDao.changePwd(bean);
    }

    @Override
    public List<T> SelectTopTen() {
        return baseDao.selectTopTen();
    }

    @Override
    public void setImage(String image,String name) {



        Image image1 = new Image();
        image1.setImage(image);
        image1.setName(name);

        baseDao.setImg(image1);

    }


}


