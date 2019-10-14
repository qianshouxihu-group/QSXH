package com.qsxh.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.qsxh.entity.Menu;
import com.qsxh.entity.User;
import com.qsxh.interceptor.Log;
import com.qsxh.service.*;
import com.qsxh.utiles.MD5;
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
import java.util.List;
import java.util.*;

@Controller
@RequestMapping("/log")
public class UserLogAction extends ActionSupport {
    @Resource
    private UserService us;
    @Resource
    private AccountService as;
    @Resource
    private UserBiz userBiz;
    @Resource
    private IInformBiz informBiz;

    @Resource
    private MenuService menuService;

    //前台用户登录逻辑
    @RequestMapping("/login")
    @Log(actionType = "登录", actionName = "前台用户登录")
    public ModelAndView managerLogin(HttpServletRequest request, String uname, String password){
        ModelAndView mv = new ModelAndView();
        //md5加密
        String md5pass = MD5.getMD5(password);
        User user = us.userLogin(uname,md5pass);
        HttpSession session = request.getSession();

        System.out.println("账号名"+uname+"   "+"密码"+password);


        String verifyCode = request.getParameter("verifyCode");
        String sessionVerifyCode = (String) session.getAttribute("verifyCodeValue");
        System.out.println("验证码"+sessionVerifyCode);
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
                //登录后，计算消息未读数（王宗清）
                //登录需做特殊处理，如果用拦截器来做消息未读数，登录会被拦截
                List<Integer> list = informBiz.unreadCount(user.getUserid());
                request.setAttribute("countList", list);
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
                    mv.setViewName("index");
                }

                if("3".equals(user.getRoleid())){
                    mv.setViewName("index");
                }
                if("5".equals(user.getRoleid())){
                    request.getSession().setAttribute("userid",user.getUserid());
                    mv.addObject("userid", user.getUserid());
                    mv.setViewName("cregdata");
                }
                if("6".equals(user.getRoleid())){
                    request.getSession().setAttribute("userid",user.getUserid());
                    mv.setViewName("cregsuccess");
                }

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

        String md5pass = MD5.getMD5(password);
        User user = us.userLogin2(uname,md5pass);

        System.out.println(""+uname+"   "+password);
        String verifyCode = request.getParameter("verifyCode");
        String sessionVerifyCode = (String) session.getAttribute("verifyCodeValue");
        if (!verifyCode.equalsIgnoreCase(sessionVerifyCode)) {
            //验证失败逻辑
            request.setAttribute("log","codeerror");
            mv.setViewName("login_backstage");
        }else{
            if(null!= user)
            {

                //角色对应的菜单map
                String roleid=user.getRoleid();
                List<com.qsxh.entity.Menu> menuList=new ArrayList<Menu>();
                menuList=menuService.selectRoleMenuList(roleid);
                Map<String, List<com.qsxh.entity.Menu>> menumap = new HashMap<String, List<Menu>>();
                menumap=menuService.listToMap(menuList);

                session.setAttribute("manager", user);
                session.setAttribute("menumap", menumap);

                mv.setViewName("admin/adminindex");
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
