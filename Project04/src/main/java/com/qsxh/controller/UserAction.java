package com.qsxh.controller;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.opensymphony.xwork2.ActionSupport;
import com.qsxh.entity.User;
import com.qsxh.service.AccountService;
import com.qsxh.service.AliMessagesUtil;
import com.qsxh.service.UserBiz;
import com.qsxh.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/testManager")
public class UserAction extends ActionSupport {

    @Resource
    private UserService us;
    @Resource
    private AccountService as;
    @Resource
    private UserBiz userBiz;

    private String userid;
    private User user;
    private List<User> userList;


    //注销方法
    @RequestMapping("/outLogin")
    public ModelAndView outLogin(HttpSession session, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        System.out.println("账号已注销");
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        //String path = request.getURI()
        mv.setViewName("login");
        return mv;
    }

    //后台注销
    @RequestMapping("/outLogin2")
    public ModelAndView backOutLogin(HttpSession session, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        System.out.println("账号已注销");
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        //String path = request.getURI()
        mv.setViewName("login_backstage");
        return mv;
    }

    //    普通用户查询
    @RequestMapping(value = "/userselect.action")
    public @ResponseBody
    Map<String,Object> userSelect(User user){
        int page= user.getPage();
        int limit= user.getLimit();
        System.out.println("=====查询第几页=="+page+"=======一页行数=="+limit);
        user.setPage((page - 1) * limit);
        System.out.println("查询条件========"+ user.getUserid()+ user.getUname()+ user.getUedu()+ user.getBegindate()+ user.getEnddate());
        int count= userBiz.getUserNum(user);
        System.out.println("========总条数======"+count);
        userList=userBiz.findUserList(user);
        Map<String, Object> usermap = new HashMap<String, Object>();
        usermap.put("code", 0);
        usermap.put("count", count);
        usermap.put("data", userList);
        return usermap;
    }


    //    重置密码
    @RequestMapping(value = "/resetpwd.action")
    public @ResponseBody String userPassReset(String userid){
        int flag=0;
        System.out.println("==========="+userid);
        flag=userBiz.userPassReset(userid);
        return String.valueOf(flag);
    }
    //    修改用户数据
    @RequestMapping(value = "/updateUser.action")
    public @ResponseBody String updateMethod(User user){
        int flag=0;
        System.out.println("修改后的"+ user.getUedu()+ user.getUname()+ user.getUsex());
        flag=userBiz.updateUser(user);
        System.out.println("修改成功为2，失败为0=========="+flag);
        return String.valueOf(flag);
    }

    //删除用户
    @RequestMapping(value = "/deleteUser.action")
    public @ResponseBody String deleteUser(String userid){
        int flag=0;
        flag=userBiz.deleteUser(userid);
        return String.valueOf(flag);
    }

    //批量删除用户
    @RequestMapping(value = "/deleteUsers.action")
    public @ResponseBody
    String deleteUsers(User user){
        try {
            userBiz.deleteUsers(user.getUserids());
            return "1";
        } catch (Exception e) {
            e.printStackTrace();
            return "0";
        }
    }

    //忘记密码--发送短信验证码
    @RequestMapping("/sendcode")
    public @ResponseBody Map  sendcode(String userid,HttpSession session) throws ClientException {
        System.out.println("忘记密码--发送短信验证码 userid="+userid);
        Map<String , String> map = new HashMap<>();

        String code= AliMessagesUtil.getRandNum(6);
        SendSmsResponse response= AliMessagesUtil.sendSms(userid,code);
        System.out.println("验证码是"+code);
        if (null!=response) {
            map.put("msg", "success");
            userBiz.userPassReset(userid);
            session.setAttribute("code",code);
        }else {
            map.put("msg", "fail");
        }
        return map;
    }

    //忘记密码--验证 验证码的正误，并重置密码
    @RequestMapping("/checkcode")
    public @ResponseBody Map checkcode(HttpSession session, HttpServletRequest request,String code)
    {
        Map<String , String> map = new HashMap<>();
        String scode= (String) session.getAttribute("code");
        if(scode.equals(code)){
            //验证码正确
            //移除session中存储的验证码
            session.removeAttribute("code");
            map.put("msg", "success");

        }else{
            //验证码错误
            map.put("msg", "fail");
        }
        return map;
    }


}
