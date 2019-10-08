package com.qsxh.controller;

import com.qsxh.utiles.UploadUtil;
import org.apache.struts2.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;

@Controller
@RequestMapping("/MyUpload")
public class FileUploadAciton {

    @ResponseBody//单文件上传
    @RequestMapping("/imgFile")
    public String imgUpload(@RequestParam("img") MultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException, JSONException {

        Map<String,Object> map = null;
        try {
            map = UploadUtil.simUpload(file, request);
        } catch (Exception e) {
            e.printStackTrace();
        }

        String result = map==null ? "no" : (String) map.get("url");

        //调用工具类完成上传，返回相关数据到页面
        return result;
    }

}
