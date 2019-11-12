package com.gg.Bean;

import org.springframework.web.multipart.MultipartFile;

/**
 * lgg
 * 2019/9/23
 */
public class Image {
    /**
     * id
     */
    private Integer id;

    /**
     * 姓名
     */
    private String uname;


    /**
     * 图片路径
     */
    private String image;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return uname;
    }

    public void setName(String name) {
        this.uname = name;
    }


    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

}
