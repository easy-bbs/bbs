package com.gg.Controller;

import com.gg.Bean.User;
import com.gg.Service.LoginService;
import com.gg.Util.Aptcha;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import static com.gg.Util.Aptcha.RANDOMCODEKEY;

/**
 * lgg
 * 2019/7/29
 */
@Controller
@RequestMapping("system")
public class LoginController {

    @Autowired
    private LoginService service;

    /**
     * 校验用户信息
     */
    @RequestMapping("/login")
    public String checkLogin(HttpServletRequest request){

        String user_id = request.getParameter("user_id");//账号
        String password = request.getParameter("password");//密码
        String code  = request.getParameter("captcha");//验证码
        User user1 = service.getById(user_id);
        String name = user1.getUser_name();
        //获取验证码信息
        HttpSession session = request.getSession();
        String aptcha = (String) session.getAttribute(RANDOMCODEKEY);
        session.setAttribute("name",name);
        session.setAttribute("user_id",user_id);
        session.setAttribute("password",password);
        //判断验证码是否正确
        if (code.equalsIgnoreCase(aptcha)){
            //判断密码是否正确
            if (password.equals(user1.getPassword())){
                //获取用户信息
                return "index";
            }
            return "redirect:/login.jsp";
        }
        return "redirect:/login.jsp";
    }

    /**
     * 注册
     */
    @RequestMapping("/register")
    public String register(){
        return "redirect:/register.jsp";
    }

    /**
     * 获取生成验证码显示到 UI 界面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/changeCode")
    public void checkCode(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //设置相应类型,告诉浏览器输出的内容为图片
        response.setContentType("image/jpeg");
        //设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);

        Aptcha aptcha = new Aptcha();
        try {
            aptcha.getAptcha(request, response);//输出图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取用户注册信息
     */
    @RequestMapping("/getRegister")
    public String save(User user){
        service.save(user);
        return "redirect:/login.jsp";
    }
}
