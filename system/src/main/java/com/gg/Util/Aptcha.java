package com.gg.Util;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

/**
 * lgg
 * 2019/8/1
 */
public class Aptcha  {
    //放到session中的key
    public static final String RANDOMCODEKEY = "randomcode_key";
    private Random random = new Random();
    //随机产生字符串
    private String randString = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    private int height = 35;//图片的高度
    private int width = 100;//图片的宽度
    private int StringNum = 4;//产生的字符数

    /**
     * 随机生成图片验证码
     * @param request
     * @param response
     */
    public void getAptcha(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_BGR);

        Graphics g = image.getGraphics();
        g.fillRect(0,0,width,height);
        g.setFont(new Font("Times New Roman",Font.ROMAN_BASELINE,18));
        g.setColor(getColor(50,100));
        String string = drowString(g,randString);
        session.removeAttribute(RANDOMCODEKEY);
        session.setAttribute(RANDOMCODEKEY,string);
        g.dispose();

        try {
            ImageIO.write(image,"JPEG",response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    /**
     * 生成图片的上的验证码
     * @param g
     * @param randString
     * @return
     */
    public String drowString (Graphics g,String randString){
        String string ="";
        //设置字体
        g.setFont(getFont());
        //设置颜色
        g.setColor(new Color(random.nextInt(77),random.nextInt(88),random.nextInt(99)));
        //获取四个随机字符
        for (int i=1;i<=4;i++){
            string = string + getRandString(random.nextInt(36));
        }
        //画字符串并随机生成的位置不同
        int num = random.nextInt(5);
        g.drawString(string,5+num,16);
        return string;
    }

    /**
     * 随机获得randomString中任意四个字符串
     * @return
     */
    public String getRandString(int num){
        return String.valueOf(randString.charAt(num));
    }

    /**
     * 产生斜体字体
     * @return
     */
    public Font getFont(){
        return new Font("Arial Bold",Font.ITALIC,18);
    }

    /**
     * 生成随机颜色
     * @param x
     * @param y
     * @return
     */
    public Color getColor(int x,int y){
        if (x>255)
            x = 255;
        if (y>255)
            y = 255;
        //随机生成rgb的值
        int r = x + random.nextInt(y-x-16);
        int g = x + random.nextInt(y-x-14);
        int b = x + random.nextInt(y-x-18);
        return new Color(r,g,b);
    }
}
