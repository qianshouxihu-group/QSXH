package com.qsxh.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.qsxh.entity.User;
import com.qsxh.service.AccountService;
import com.qsxh.service.UserBiz;
import com.qsxh.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

@Controller
@RequestMapping("/log")
public class UserLogAction extends ActionSupport {
    @Resource
    private UserService us;
    @Resource
    private AccountService as;
    @Resource
    private UserBiz userBiz;


    //前台用户登录逻辑
    @RequestMapping("/login")
    public ModelAndView managerLogin(HttpServletRequest request, String uname, String password){
        ModelAndView mv = new ModelAndView();
        User user = us.userLogin(uname,password);
        HttpSession session = request.getSession();

        System.out.println("账号名"+uname+"   "+"密码"+password);


        String verifyCode = request.getParameter("verifyCode");
        String sessionVerifyCode = (String) session.getAttribute("verifyCodeValue");
        if (!verifyCode.equalsIgnoreCase(sessionVerifyCode)) {
            //验证失败逻辑
            request.setAttribute("log","codeerror");
            mv.setViewName("login");
        }else
        {
            //验证成功逻辑
            if(null!= user)
            {
                session.setAttribute("user", user);
                // 1
                if("4".equals(user.getRoleid())){
                    String vipdate= as.getVipenddate(user.getUserid());
                    Date date = new Date();
                    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                    // 2
                    if (df.format(date).compareTo(vipdate)>0) {
                        // 3
                        us.changeRoldid(user.getUserid(),"3");
                        as.addVipenddate(user.getUserid(),"");
                    }
                }


                mv.setViewName("muban");
            }else{
                request.setAttribute("log","lf");
                mv.setViewName("login");
            }
        }


        return mv;
    }


    //后台管理员登录逻辑
    @RequestMapping("/login2")
    public ModelAndView managerLogin2(HttpServletRequest request, String uname, String password) {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        User user = us.userLogin2(uname,password);

        String verifyCode = request.getParameter("verifyCode");
        String sessionVerifyCode = (String) session.getAttribute("verifyCodeValue");
        if (!verifyCode.equalsIgnoreCase(sessionVerifyCode)) {
            //验证失败逻辑
            request.setAttribute("log","codeerror");
            mv.setViewName("login_backstage");
        }else{
            if(null!= user)
            {
                session.setAttribute("manager", user);

                mv.setViewName("");
            }else{
                request.setAttribute("log","lf");
                mv.setViewName("login_backstage");
            }

        }


        return mv;
    }

    /*获取验证码*/
    @RequestMapping("/getVerifyCode")
    public void generate(HttpServletResponse response, HttpSession session) {
        ByteArrayOutputStream output = new ByteArrayOutputStream();
        String verifyCodeValue = drawImg(output);
        // 将校验码保存到session中
        session.setAttribute("verifyCodeValue", verifyCodeValue);

        try {
            ServletOutputStream out = response.getOutputStream();
            output.writeTo(out);
        } catch (IOException e) {

            e.printStackTrace();

        }
    }

    /* 绘制验证码 */
    private String drawImg(ByteArrayOutputStream output) {
        String code = "";
        // 随机产生4个字符
        for (int i = 0; i < 4; i++) {
            code += randomChar();
        }
        int width = 70;
        int height = 25;
        BufferedImage bi = new BufferedImage(width, height,
                BufferedImage.TYPE_3BYTE_BGR);
        Font font = new Font("Times New Roman", Font.PLAIN, 20);
        // 调用Graphics2D绘画验证码
        Graphics2D g = bi.createGraphics();
        g.setFont(font);
        Color color = new Color(66, 2, 82);
        g.setColor(color);
        g.setBackground(new Color(226, 226, 240));
        g.clearRect(0, 0, width, height);
        FontRenderContext context = g.getFontRenderContext();
        Rectangle2D bounds = font.getStringBounds(code, context);
        double x = (width - bounds.getWidth()) / 2;
        double y = (height - bounds.getHeight()) / 2;
        double ascent = bounds.getY();
        double baseY = y - ascent;
        g.drawString(code, (int) x, (int) baseY);
        g.dispose();
        try {
            ImageIO.write(bi, "jpg", output);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return code;
    }

    /* 获取随机参数 */
    private char randomChar() {
        Random r = new Random();
        String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
        return s.charAt(r.nextInt(s.length()));
    }


}
