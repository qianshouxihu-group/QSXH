package com.qsxh.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.qsxh.entity.HabitData;
import com.qsxh.entity.PersonalData;
import com.qsxh.service.IPersonalService;
import com.qsxh.utiles.AgeUtils;
import com.qsxh.utiles.MD5;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;


@Controller
@RequestMapping("/personalManager")
public class PersonalAction extends ActionSupport {

    @Resource
    private IPersonalService iPersonalService;
    ModelAndView mv = new ModelAndView();

    /*
    完善注册信息
    **/
    @RequestMapping("/improving")
    public ModelAndView improveRegData(HttpServletRequest request, MultipartFile upload, PersonalData personalData) throws Exception{
        //拼接地址
        if("选择省份".equals(personalData.getS_province())&&"地级市".equals(personalData.getS_city())){
            personalData.setUaddress("未选择");
        }
        personalData.setUaddress(personalData.getS_province()+personalData.getS_city());
        //头像上传位置
        String path = request.getSession().getServletContext().getRealPath("/uploads/");
        //判断该路径是否存在
        File file = new File(path);
        if(!file.exists()){
            file.mkdirs(); //创建该文件夹
        }
        //获取上传文件名称
        String filename = upload.getOriginalFilename();
        //把文件名称设置为唯一值
        String uuid =  UUID.randomUUID().toString().replace("-","");
        filename = uuid+"_"+filename;
        String filepath="uploads/"+filename; //头像保存相对路径
        upload.transferTo(new File(path,filename));
        personalData.setImgurl(filepath);  //接收保存路径
        personalData.setRoleid("6");       //更改状态
        personalData.setIdcard(MD5.getMD5(personalData.getIdcard()));   //身份证加密
        boolean flag = iPersonalService.improvingRegData(personalData);
        String msg = null;
        if (true==flag){
            msg ="cregsuccess";
            System.out.println("完善资料成功");
        }else{
            msg ="cregdata";
        }
        mv.setViewName(msg);
        return mv;
    }

    /*
    基本资料查询
    **/
    @RequestMapping("/aboutBasic")
    public ModelAndView findBasicInform(){
        PersonalData personalData = iPersonalService.findBasicData("1001");
        String birthday = personalData.getUbirthday();
        try {
        int age = AgeUtils.getAge(AgeUtils.parse(birthday));
        personalData.setUage(age);
        } catch (Exception e) {
            e.printStackTrace();
        }
        mv.addObject("resultPersonalData",personalData);
        mv.setViewName("cbasicinform");
        return mv;
    }

    /*
    更新基础资料
    **/
    @RequestMapping("/updateBasic")
    public ModelAndView updateBasicInform(PersonalData personalData){
        personalData.setUserid("1001");
        //获取提交的所在地信息
        String province = personalData.getS_province();
        String city = personalData.getS_city();
        if (("不限".equals(province)||"选择省份".equals(province))&&"地级市".equals(city)){
        boolean flag = iPersonalService.updateBasicWithoutAddress(personalData);
            if (true==flag){
                PersonalData personData= iPersonalService.findBasicData("1001");
                mv.addObject("resultPersonalData",personData);
            }else{
                System.out.println("更新资料失败");
            }
        }
        else{
        if ((!"不限".equals(province)||!"选择省份".equals(province))&&"地级市".equals(city)){
            personalData.setS_city("未选择");
            personalData.setUaddress(personalData.getS_province()+personalData.getS_city());
        }
        if ((!"不限".equals(province)||!"选择省份".equals(province))&&!"地级市".equals(city)){
            personalData.setUaddress(personalData.getS_province()+personalData.getS_city());
        }
        boolean flag = iPersonalService.updateBasicData(personalData);
        if (true==flag){
            PersonalData personData= iPersonalService.findBasicData("1001");
            mv.addObject("resultPersonalData",personData);
        }else{
            System.out.println("更新资料失败");
        }
        }
        mv.setViewName("cbasicinform");
        return mv;
    }

    /*
    择偶条件查询
    **/
    @RequestMapping("/aboutCP")
    public ModelAndView findCPInform(){
        PersonalData personalData = iPersonalService.findCpLimitData("1001");
        mv.addObject("cpData",personalData);
        mv.setViewName("caboutcp");
        return mv;
    }

    /*
    更新择偶条件
    **/
    @RequestMapping("/updateCP")
    public ModelAndView updateCPInform(PersonalData personalData){
        personalData.setUserid("1001");
        //获取提交的所在地信息
        String province = personalData.getS_province();
        String city = personalData.getS_city();
        if ("选择省份".equals(province)&&"地级市".equals(city)){
            boolean flag = iPersonalService.updateCpWithoutAddress(personalData);
            if (true==flag){
                PersonalData personData= iPersonalService.findCpLimitData("1001");
                mv.addObject("cpData",personData);
            }else{
                System.out.println("更新资料失败");
            }
        }
        else{
            if ("不限".equals(province)&&"地级市".equals(city)){
                personalData.setS_city("不限");
                personalData.setUaddress("不限");
            }
            if ((!"不限".equals(province)||!"选择省份".equals(province))&&"地级市".equals(city)){
                personalData.setS_city("不限");
                personalData.setUaddress(personalData.getS_province()+personalData.getS_city());
            }
            if (!"选择省份".equals(province)&&!"地级市".equals(city)){
                personalData.setUaddress(personalData.getS_province()+personalData.getS_city());
            }
            boolean flag = iPersonalService.updateCpLimitData(personalData);
            if (true==flag){
                PersonalData personData= iPersonalService.findCpLimitData("1001");
                mv.addObject("cpData",personData);
            }else{
                System.out.println("更新资料失败");
            }
        }
        mv.setViewName("caboutcp");
        return mv;
    }

    /*
    个性要求查询
    **/
    @RequestMapping("/aboutLimit")
    public ModelAndView findLimitInform(){
        PersonalData personalData = iPersonalService.findLimitData("1001");
        mv.addObject("limitData",personalData);
        mv.setViewName("climitcon");
        return mv;
    }

    /*
    个性要求更新
    **/
    @RequestMapping("/updateLimit")
    public ModelAndView updateLimitInform(PersonalData personalData){
        personalData.setUserid("1001");
        boolean flag = iPersonalService.updateLimitData(personalData);
        if (true==flag){
            PersonalData personData = iPersonalService.findLimitData("1001");
            mv.addObject("limitData",personData);
        }else{
            System.out.println("更新个性要求失败");
        }
        mv.setViewName("climitcon");
        return mv;
    }

    /*
    工作学习查询
    **/
    @RequestMapping("/aboutWS")
    public ModelAndView findWSInform(){
        PersonalData personalData = iPersonalService.findWSData("1001");
        mv.addObject("wsData",personalData);
        mv.setViewName("caboutstudy");
        return  mv;
    }

    /*
    工作学习更新
    **/
    @RequestMapping("/updateWS")
    public ModelAndView updateWSInform(PersonalData personalData){
        personalData.setUserid("1001");
        boolean flag = iPersonalService.updateWSData(personalData);
        if (true==flag){
            PersonalData personData = iPersonalService.findWSData("1001");
            mv.addObject("wsData",personalData);
        }else{
            System.out.println("更新工作学习失败");
        }
        mv.setViewName("caboutstudy");
        return  mv;
    }

    /*
    兴趣爱好查询
    **/
    @RequestMapping("/aboutHabit")
    public ModelAndView findHabitInform(){
        //查询数据库中的兴趣爱好选项
        List list1 = iPersonalService.findHItemData();
        //查询用户兴趣
        List list2 = iPersonalService.findHabitData("1001");
        mv.addObject("habitItem",list1);
        mv.addObject("userHabit",list2);
        mv.setViewName("cabouthobby");
        return mv;
    }

    /*
    用户兴趣爱好更新
    **/
    @RequestMapping("/updateHabit")
    public ModelAndView updateHabitInform(HttpServletRequest request, HabitData habitData){

        String[] habits =  request.getParameterValues("habits");
        iPersonalService.deleteHabitData("1001");
        List <Object> list = new ArrayList();
        for (int i = 0; i < habits.length; i++) {
           list.add(habits[i]);
        }
        iPersonalService.insertHabitData(list,"1001");
        List listData = iPersonalService.findHabitData("1001");
        mv.addObject("userHabit",listData);
        mv.setViewName("cabouthobby");
        return  mv;
    }

    /*
    确认修改密码
    **/
    @RequestMapping(value="/checkPassWord")
    public @ResponseBody String checkUserPass(String upass){
        System.out.println(upass);
        String str = null;
        PersonalData personalData = iPersonalService.findBasicData("1001");
        String pass =  personalData.getUpass();
        if (pass.equals(upass)){
            str = "1" ;
        }else{
            str = "2" ;
        }
        return str;
    }

    /*
    修改密码
    **/
    @RequestMapping("/rePassWord")
    public ModelAndView updatePassWord(){


        mv.setViewName("crepassword");
        return mv;
    }

    /*
    我的主页
    **/
    @RequestMapping("/myHomePage")
    public ModelAndView showMyHomepage(){

        PersonalData personalData= iPersonalService.findBasicData("1001"); //基本资料
        //实时更新年龄
        String birthday = personalData.getUbirthday();
        try {
            int age = AgeUtils.getAge(AgeUtils.parse(birthday));
            personalData.setUage(age);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List list = iPersonalService.findPhotoWithUser("1001"); //相册查询
        PersonalData cpDate = iPersonalService.findCpLimitData("1001"); //择偶要求
        PersonalData workData = iPersonalService.findWSData("1001"); //工作要求
        PersonalData requiredData = iPersonalService.findLimitData("1001"); //个性要求
        List list1 = iPersonalService.findHabitData("1001");//兴趣爱好

        mv.addObject("basicInfor",personalData);
        mv.addObject("myPhotoList",list);
        mv.addObject("cpLimitDate",cpDate);
        mv.addObject("workDate",workData);
        mv.addObject("required",requiredData);
        mv.addObject("habitDate",list1);
        mv.setViewName("cmyhomepage");
        return mv;
    }

    /*
    我的相册
    **/
    @RequestMapping("/myPhotograph")
    public ModelAndView showMyPhotograph(){
       List list = iPersonalService.findPhotoWithUser("1001");
        mv.addObject("photoList",list);
        mv.setViewName("cimgupload");
        return mv;
    }

    /*
    删除照片
    **/
    @RequestMapping("/deleteMyPhotograph")
    public ModelAndView deleteMyPhotograph(Integer photoid){
        boolean flag = iPersonalService.deleteMyPhoto(photoid);
        if(true==flag){
            List list = iPersonalService.findPhotoWithUser("1001");
            mv.addObject("photoList",list);
        }
        mv.setViewName("cimgupload");
        return mv;
    }


}
