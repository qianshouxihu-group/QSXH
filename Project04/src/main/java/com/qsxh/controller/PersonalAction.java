package com.qsxh.controller;

import com.opensymphony.xwork2.ActionSupport;
import com.qsxh.entity.*;
import com.qsxh.service.IPersonalService;
import com.qsxh.service.RelationService;
import com.qsxh.service.impl.MatchUserServiceImpl;
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
    private RelationService relationService;

    @Resource
    private IPersonalService iPersonalService;
    @Resource
    private MatchUserServiceImpl matchUserService;
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
    public ModelAndView findBasicInform(HttpServletRequest request){

        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        //查询该用户基本资料
        PersonalData personalData = iPersonalService.findBasicData(userid);
        String birthday = personalData.getUbirthday();
        try {
        int age = AgeUtils.getAge(AgeUtils.parse(birthday));   //得到最新年龄
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
    public ModelAndView updateBasicInform(HttpServletRequest request,PersonalData personalData){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        personalData.setUserid(userid);
        //获取提交的所在地信息
        String province = personalData.getS_province();
        String city = personalData.getS_city();
        if (("不限".equals(province)||"选择省份".equals(province))&&"地级市".equals(city)){
        boolean flag = iPersonalService.updateBasicWithoutAddress(personalData);
            if (true==flag){
                PersonalData personData= iPersonalService.findBasicData(userid);
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
            PersonalData personData= iPersonalService.findBasicData(userid);
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
    public ModelAndView findCPInform(HttpServletRequest request){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        PersonalData personalData = iPersonalService.findCpLimitData(userid);
        mv.addObject("cpData",personalData);
        mv.setViewName("caboutcp");
        return mv;
    }

    /*
    更新择偶条件
    **/
    @RequestMapping("/updateCP")
    public ModelAndView updateCPInform(HttpServletRequest request,PersonalData personalData){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        personalData.setUserid(userid);
        //获取提交的所在地信息
        String province = personalData.getS_province();
        String city = personalData.getS_city();
        if ("选择省份".equals(province)&&"地级市".equals(city)){
            boolean flag = iPersonalService.updateCpWithoutAddress(personalData);
            if (true==flag){
                PersonalData personData= iPersonalService.findCpLimitData(userid);
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
                PersonalData personData= iPersonalService.findCpLimitData(userid);
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
    public ModelAndView findLimitInform(HttpServletRequest request){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        PersonalData personalData = iPersonalService.findLimitData(userid);
        mv.addObject("limitData",personalData);
        mv.setViewName("climitcon");
        return mv;
    }

    /*
    个性要求更新
    **/
    @RequestMapping("/updateLimit")
    public ModelAndView updateLimitInform(HttpServletRequest request,PersonalData personalData){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        personalData.setUserid(userid);
        boolean flag = iPersonalService.updateLimitData(personalData);
        if (true==flag){
            PersonalData personData = iPersonalService.findLimitData(userid);
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
    public ModelAndView findWSInform(HttpServletRequest request){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        PersonalData personalData = iPersonalService.findWSData(userid);
        mv.addObject("wsData",personalData);
        mv.setViewName("caboutstudy");
        return  mv;
    }

    /*
    工作学习更新
    **/
    @RequestMapping("/updateWS")
    public ModelAndView updateWSInform(HttpServletRequest request,PersonalData personalData){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        personalData.setUserid(userid);
        boolean flag = iPersonalService.updateWSData(personalData);
        if (true==flag){
            PersonalData personData = iPersonalService.findWSData(userid);
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
    public ModelAndView findHabitInform(HttpServletRequest request){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        //查询数据库中的兴趣爱好选项
        List list1 = iPersonalService.findHItemData();
        //查询用户兴趣
        List list2 = iPersonalService.findHabitData(userid);
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
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        String[] habits =  request.getParameterValues("habits");
        iPersonalService.deleteHabitData(userid);
        List <Object> list = new ArrayList();
        for (int i = 0; i < habits.length; i++) {
           list.add(habits[i]);
        }
        iPersonalService.insertHabitData(list,userid);
        List listData = iPersonalService.findHabitData(userid);
        mv.addObject("userHabit",listData);
        mv.setViewName("cabouthobby");
        return  mv;
    }

    /*
    确认修改密码
    **/
    @RequestMapping(value="/checkPassWord")
    public @ResponseBody String checkUserPass(HttpServletRequest request,String upass){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        String addPass = MD5.getMD5(upass);   //加密转换
        String str = null;
        PersonalData personalData = iPersonalService.findBasicData(userid);
        String pass =  personalData.getUpass();
        if (pass.equals(addPass)){
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
    public ModelAndView updatePassWord(HttpServletRequest request,String newupass){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        String addPass = MD5.getMD5(newupass); //加密转换
        boolean flag = iPersonalService.updateUserPass(addPass,userid);
        if (true == flag){
            mv.setViewName("crepwdinfor");
        }else{
            mv.setViewName("crepassword");
        }
        return mv;
    }

    /*
    我的主页
    **/
    @RequestMapping("/myHomePage")
    public ModelAndView showMyHomepage(HttpServletRequest request){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        UserAndData userAndData = new UserAndData();
        PersonalData personalData= iPersonalService.findBasicData(userid); //基本资料
        //实时更新年龄
        String birthday = personalData.getUbirthday();
        try {
            int age = AgeUtils.getAge(AgeUtils.parse(birthday));
            personalData.setUage(age);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List list = iPersonalService.findPhotoWithUser(userid); //相册查询
        PersonalData cpDate = iPersonalService.findCpLimitData(userid); //择偶要求
        PersonalData workData = iPersonalService.findWSData(userid); //工作要求
        PersonalData requiredData = iPersonalService.findLimitData(userid); //个性要求
        List list1 = iPersonalService.findHabitData(userid);//兴趣爱好

        userAndData.setCondition("member");    //查询最新会员
        userAndData.setLimitString("6");       //查询条数
        userAndData.setUsex(user.getUsex());    //性别
        List <UserAndData> memberlist = matchUserService.findUserByTime(userAndData);



        mv.addObject("basicInfor",personalData);
        mv.addObject("myPhotoList",list);
        mv.addObject("cpLimitDate",cpDate);
        mv.addObject("workDate",workData);
        mv.addObject("required",requiredData);
        mv.addObject("habitDate",list1);
        mv.addObject("memberlist",memberlist);
        mv.setViewName("cmyhomepage");
        return mv;
    }

    /*
    我的相册
    **/
    @RequestMapping("/myPhotograph")
    public ModelAndView showMyPhotograph(HttpServletRequest request){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        List list = iPersonalService.findPhotoWithUser(userid);
        mv.addObject("photoList",list);
        mv.setViewName("cimgupload");
        return mv;
    }

    /*
    删除照片
    **/
    @RequestMapping("/deleteMyPhotograph")
    public ModelAndView deleteMyPhotograph(HttpServletRequest request,Integer photoid){
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        boolean flag = iPersonalService.deleteMyPhoto(photoid);
        if(true==flag){
            List list = iPersonalService.findPhotoWithUser(userid);
            mv.addObject("photoList",list);
        }
        mv.setViewName("cimgupload");
        return mv;
    }

    /*
        查看Ta的信息
        **/
    @RequestMapping("/showTaInforn")
    public ModelAndView showTaHomepage(HttpServletRequest request,String taId){
        System.out.println("======="+taId+"==========这是我的测试");
        //获得id
        User user = (User) request.getSession().getAttribute("user");
        String userid = user.getUserid();
        UserAndData userAndData = new UserAndData();
        //查询登录用户信息
        PersonalData mine = iPersonalService.findBasicData(userid);
        PersonalData personalData= iPersonalService.findBasicData(taId); //基本资料
        String role = mine.getRoleid();  //获取用户角色

        //获取用户关系信息
        TblRelation param = new TblRelation();
        param.setFfromid(userid);
        param.setFtoid(taId);
        TblRelation relation = relationService.findRelation(param);

        //实时更新年龄
        String birthday = personalData.getUbirthday();
        try {
            int age = AgeUtils.getAge(AgeUtils.parse(birthday));
            personalData.setUage(age);
        } catch (Exception e) {
            e.printStackTrace();
        }
        List list = iPersonalService.findPhotoWithUser(taId); //相册查询
        PersonalData workData = iPersonalService.findWSData(taId); //工作要求
        PersonalData cpDate = iPersonalService.findCpLimitData(taId); //择偶要求
        PersonalData requiredData = iPersonalService.findLimitData(taId); //个性要求
        List list1 = iPersonalService.findHabitData(taId);//兴趣爱好

        userAndData.setUsex(user.getUsex());    //性别
        userAndData.setCondition("member");    //查询最新会员
        userAndData.setLimitString("6");       //查询条数
        List <UserAndData> memberlist = matchUserService.findUserByTime(userAndData);

        mv.addObject("mineData",mine);
        mv.addObject("basicInfor",personalData);
        mv.addObject("myPhotoList",list);
        mv.addObject("memberlist",memberlist);

        System.out.println(role);
        if ("4".equals(role)){

            mv.addObject("relationUser", relation);
            mv.addObject("cpLimitDate",cpDate);
            mv.addObject("workDate",workData);
            mv.addObject("required",requiredData);
            mv.addObject("habitDate",list1);
            mv.setViewName("chomepage");
        }

        if ("3".equals(role)){
            mv.setViewName("climithomepage");
        }

        return mv;
    }


}
