package com.qsxh.controller;

import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.qsxh.service.AliMessagesUtil;
import com.qsxh.service.UserBiz;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

//注册功能
@Controller
@RequestMapping("/regManager")
public class RegAction {
    @Resource
    private UserBiz userBiz;//用户业务处理对象

    //验证账号重复 ajax
    @RequestMapping(value = "/checkPhone.action" , method=RequestMethod.GET , produces="application/json;charset=utf-8")
    public @ResponseBody Map checkPhone(HttpServletRequest re ,String phone)
    {
        System.out.println("手机号："+phone);
        boolean flag = userBiz.checkUserid(phone);
        Map<String , String> map = new HashMap<>();
        if (flag)
        {
            map.put("msg", "fail");
        }
        else
        {
            map.put("msg", "success");
        }
        return map;
    }

    //注册 ajax
    @RequestMapping(value = "/reg.action" , method=RequestMethod.GET , produces="application/json;charset=utf-8")
//    @Transactional(propagation= Propagation.REQUIRED,rollbackForClassName="Exception")
    public @ResponseBody Map reg(HttpServletRequest request ,String phone, String password , String code)
    {
        System.out.println("手机号："+ phone + "密码:"+ password);

        //从session中获取验证码
        String regCode = request.getSession().getAttribute("regCode").toString();

        //根据两个验证的结果 返回不同map
        Map<String , String> map = new HashMap<>();
        if(regCode.equals(code))//比较用户输入验证码与发送的验证码
        {
            boolean flag = userBiz.insert4table(phone, password);//插入tbluser和tbldata和tblcplimit
            if(flag)
            {
                request.getSession().removeAttribute("regCode");//插入成功后，移除验证码
                map.put("msg", "success");
            }
            else
            {
                map.put("msg", "fail");
            }
        }
        else
        {
            map.put("msg", "codeWrong");
        }

        return map;
    }

    //发送短信验证码 并将验证码存入session
    @RequestMapping("/getCode.action")
    @ResponseBody
    public String getCode(HttpServletRequest request , String phone)
    {
        String code = AliMessagesUtil.getRandNum(6);
        String result = null;
        try {
            SendSmsResponse response = AliMessagesUtil.sendSms(phone, code);
            if (null != response)
            {
                request.getSession().setAttribute("regCode" , code);
                result = "success";//获取短信验证码成功
            }
            else
            {
                result = "fail";//获取短信验证码失败
            }
        } catch (ClientException e) {
            e.printStackTrace();
        }
        return result;
    }
}
