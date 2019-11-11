package com.gg.Controller;

import com.alibaba.fastjson.JSONObject;
import com.gg.Bean.Image;
import com.gg.Bean.Msg;
import com.gg.Bean.Sign_info;
import com.gg.Bean.User;
import com.gg.Service.LoginService;
import com.gg.Service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.Serializable;
import java.util.*;


/**
 * 用户操作
 * lgg
 * 2019/8/6
 */
@Controller
@RequestMapping("system")
public class UserController {

    private String filePath="D:/img/"; //定义上传文件的存放位置

    @Autowired
    private UserService service;
    @Autowired
    private LoginService s;

    /**
     * 分页、数据
     * @param pn
     * @return
     */
    @RequestMapping("/pageInfo")
    @ResponseBody
    public PageInfo getPageInfo(@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        //传入第几页，显示几页
        PageHelper.startPage(pn,5);
        //查询所有信息
        List<Sign_info> info = service.findAll();
        PageInfo page = new PageInfo(info,5);

        return page;
    }

    /**
     * 添加数据
     */
    @RequestMapping(value = "/save")
    public void save(Sign_info info){
        service.add(info);
    }

    /**
     * 删除
     */
    @RequestMapping(value = "/delete")
    public void delete(@RequestParam(value = "id")Serializable id){
        service.deleteById(id);
    }

    /**
     * 修改密码
     */
    @RequestMapping("/changePwd")
    public void changePwd(User user){
        s.changePwd(user);
    }

    /**
     *退出
     */
    @RequestMapping("/destory")
    public String destory(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        return "redirect:/login.jsp";
    }

    /**
     * 个人信息
     */
    @RequestMapping("/userInfo")
    @ResponseBody
    public Sign_info UserInfo(@RequestParam(value = "user_id") Serializable id){
        Sign_info info = service.select(id);
        return info;
    }

    /**
     * 编辑
     */
    @RequestMapping("/edit")
    public void edit(Sign_info info){
        service.updata(info);
    }

    /**
     * 批量删除
     */
    @RequestMapping("/deleteAll")
    public void deleteAll(@RequestParam(value = "ids") String ids){

        System.out.println(ids);
        if (ids.contains("-")){
            String[] string = ids.split("-");
            for (String id: string
                 ) {
                Integer Id = Integer.parseInt(id);
                service.deleteById(Id);
            }
        }else{
            Integer id = Integer.parseInt(ids);
            service.deleteById(id);
        }
    }

    /**
     * 返回排名前十的json数据
     */
    @RequestMapping("/TopTen")
    @ResponseBody
    public PageInfo TopTen(){
        List<Sign_info> info = service.SelectTopTen();
        PageInfo i = new PageInfo(info,10);
        return i;
    }

    /**
     * 图片上传
     */
    @RequestMapping(value = "/upload")
    @ResponseBody
    public Map<String,Object> upload(@RequestParam MultipartFile file, @RequestParam(value = "name") String name)  {

//        String fileName = file.getOriginalFilename();  //获取上传文件的名字
//        Map map = new HashMap<String,Object>();
//
//        //判断文件夹是否存在,不存在则创建
//        File file1=new File(filePath);
//
//        if(!file1.exists()){
//            file1.mkdirs();
//        }
//
//        String newFilePath=filePath+fileName; //新文件的路径
//        String newFileName = UUID.randomUUID()+fileName;
//        try {
//            file.transferTo(new File(newFilePath));  //将传来的文件写入新建的文件
//
//        } catch (IllegalStateException | IOException e) {
//            e.printStackTrace();
//        }
//
//        map.put("msg","ok");
//        map.put("code",200);
//        service.setImage(newFileName,name);
//        return map;

        String fileName = filePath+System.currentTimeMillis()+"_"+file.getOriginalFilename(); //上传后的文件名   原始文件名加上时间戳
        FileOutputStream out;
        Map map = new HashMap<String,Object>();

       // JSONObject resObj = new JSONObject();
      //  resObj.put("msg", "ok");
       // resObj.put("code", 0);

        System.out.println(fileName);
        System.out.println(name);
        try {
            map.put("code",0);
            map.put("msg","ok");
            service.setImage(fileName,name);
            out = new FileOutputStream(new File(fileName));
            IOUtils.copy(file.getInputStream(), out);
            out.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
         //   resObj.put("msg", "error");
         //   resObj.put("code",1);
            map.put("code",1);
            map.put("msg","error");
            e.printStackTrace();
        }
        return map;

    }


}
