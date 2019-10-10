package com.qsxh.utiles;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class UploadUtil {

    public static Map<String, Object> simUpload(MultipartFile file, HttpServletRequest request)
            throws Exception {

        if(!file.isEmpty()){
            String path = request.getSession().getServletContext().getRealPath("/temp");
            System.out.println(path);
            //定义文件
            File parent = new File(path);
            if(!parent.exists()) parent.mkdirs();

            HashMap<String, Object> map = new HashMap<String,Object>();

            String oldName = file.getOriginalFilename();

            long size = file.getSize();

            //把文件名称设置为唯一值
            String uuid =  UUID.randomUUID().toString().replace("-","");
            String newFileName = uuid + "_" + oldName;

            String url = "temp/"+newFileName;

            //文件传输，parent文件
            file.transferTo(new File(parent, newFileName));

            map.put("oldname",oldName);//文件原名称
            map.put("name",newFileName);//文件新名称
            map.put("url",url);

            //以json方式输出到页面
            return map;
        }else{
            return null;
        }
    }
}
