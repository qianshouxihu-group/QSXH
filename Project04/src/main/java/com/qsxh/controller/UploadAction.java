package com.qsxh.controller;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.qsxh.entity.ImageReturn;
import com.qsxh.entity.Model;
import com.qsxh.service.IPersonalService;
import com.qsxh.utiles.Base64Utils;
import com.qsxh.utiles.RegDataUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.UUID;


@Controller
@RequestMapping("/uploadManager")
public class UploadAction extends ActionSupport {

    @Resource
    private IPersonalService iPersonalService;
    Base64Utils base64Utils = new Base64Utils();

    @RequestMapping("/ajaxCheckIdCard")
    public @ResponseBody
    Model checkIdCard(@RequestBody Model model)throws Exception {
        String s1,s2,s3,s4,s5;
        String  idcard = model.getIdcard();
        String name = model.getName();
      //  String mapjson = checkIdCard.getResult(idcard,name);
        String mapjson = "{'code':'0','message':'成功','result':{'name':'钟兴旺','idcard':'350823199305185819','res':'1','description':'一致','sex':'男','birthday':'19930518','address':'福建省上杭县'}}";
        Map map = JSON.parseObject(mapjson);
        s1 =((Map) map.get("result")).get("res").toString();
        if ("1".equals(s1)||"1"==s1){
            s2 =((Map) map.get("result")).get("sex").toString();  //获取性别
            s3 =((Map) map.get("result")).get("birthday").toString();
            s4 = RegDataUtil.getBirthday(s3);                     //转转生日格式
            s5 = RegDataUtil.GetConstellation(idcard); //获取星座
            model.setSex(s2);
            model.setBirthday(s4);
            model.setIsok("true");
            model.setConstellations(s5);
        } else{
            model.setIsok("false");
        }
        return model;
    }

    /*
    相册图片上传
    **/
    @RequestMapping("/pictureManager")
    public @ResponseBody ImageReturn acceptPic(String imgBase,String imgFormat,HttpServletRequest request,ImageReturn imageReturn){
        //base64头部
        if ("jpg".equals(imgFormat)){
            imgFormat ="jpeg";
        }
        String replaceStr = "data:image/"+imgFormat+";base64,";
        //获取文件夹位置
        String path = request.getSession().getServletContext().getRealPath("/uploads/");
        String uuid =  UUID.randomUUID().toString().replace("-","");
        //拼接头像路径
        String imgFilePath = path+uuid+"."+imgFormat;
        String url = "uploads/"+uuid+"."+imgFormat;
        //base64转换成图片并指定存放
        boolean flag = base64Utils.Base64ToImage(imgBase,imgFilePath,replaceStr);
        imageReturn.setUserid("1001");
         imageReturn.setImgurl(url);
        boolean flag1 = iPersonalService.insertPhotoWithUser(imageReturn);
       if (true==flag&&true==flag1){
           imageReturn.setIsok(1);
       }else{
           imageReturn.setIsok(2);
       }
        return imageReturn ;
    }

    /*
    修改头像
    **/
    @RequestMapping("/headPicture")
    public @ResponseBody ImageReturn updateHead(String image,ImageReturn imageReturn,HttpServletRequest request){
        //获取文件夹位置
        String path = request.getSession().getServletContext().getRealPath("/uploads/");
        String uuid =  UUID.randomUUID().toString().replace("-","");
        //拼接头像路径
        String imgFilePath = path+uuid+".jpg";
        String url = "uploads/"+uuid+".jpg";
        //替换头部
        String replaceStr = "data:image/png;base64,";
        //Base64转换成图片
        boolean flag = base64Utils.Base64ToImage(image,imgFilePath,replaceStr);
        imageReturn.setUserid("1001");
        imageReturn.setImgurl(url);
        boolean flag1 = iPersonalService.updateHeadImg(imageReturn);
        if (true==flag&&true==flag1){
            imageReturn.setFile(image);
            imageReturn.setResult("ok");
        }else{
            imageReturn.setResult("error");
        }
        return imageReturn;
    }

}
