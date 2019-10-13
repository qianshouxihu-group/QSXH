package com.qsxh.service.impl;

import com.qsxh.dao.CpLimitDao;
import com.qsxh.dao.HabitDao;
import com.qsxh.dao.PersonalDao;
import com.qsxh.entity.ImageReturn;
import com.qsxh.entity.PersonalData;
import com.qsxh.service.IPersonalService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("/iPersonalService")
public class PersonalServiceImpl implements IPersonalService {

    @Resource
    private PersonalDao personalDao;
    @Resource
    private CpLimitDao cpLimitDao;
    @Resource
    private HabitDao habitDao;

    @Override
    public boolean improvingRegData(PersonalData personalData) {
      Integer num =  personalDao.regUpdate(personalData);
        if (num==2){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public PersonalData findBasicData(String userid) {
        return personalDao.findUserWithBasic(userid) ;
    }

    @Override
    public boolean updateBasicData(PersonalData personalData) {
      Integer num = personalDao.updateUserWithBasic(personalData);
      if (num==2){
          return true;
      }else {
          return false;
      }
    }

    @Override
    public PersonalData findCpLimitData(String userid) {
        return cpLimitDao.findCpLimitByUser(userid);
    }

    @Override
    public boolean updateCpLimitData(PersonalData personalData) {
        Integer num = cpLimitDao.updateCpLimitByUser(personalData);
        if (num==1){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public PersonalData findLimitData(String userid) {
        return personalDao.findDataWithLimit(userid);
    }

    @Override
    public boolean updateLimitData(PersonalData personalData) {
       Integer num = personalDao.updateDataWithLimit(personalData);
        if (num==1){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public PersonalData findWSData(String userid) {
        return personalDao.findDataWithWS(userid);
    }

    @Override
    public boolean updateWSData(PersonalData personalData) {
        Integer num = personalDao.updateDataWithWS(personalData);
        if (num==1){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List findHItemData() {
        return habitDao.findAllByHabit();
    }

    @Override
    public List findHabitData(String userid) {
        return habitDao.findAllByUser(userid);
    }

    @Override
    public void insertHabitData(List<Object> obj,String userid) {
        habitDao.insertHabitByUser(obj,userid);
    }

    @Override
    public void deleteHabitData(String userid) {
        habitDao.deleteHabitByUser(userid);
    }

    @Override
    public boolean updateHeadImg(ImageReturn imageReturn) {
        Integer num =  personalDao.updateUserWithHeadImg(imageReturn);
        if (num==1){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean insertPhotoWithUser(ImageReturn imageReturn) {
        Integer num =  habitDao.insertPhotoByUser(imageReturn);
        if (num>=1){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public List findPhotoWithUser(String userid) {

        return habitDao.findPhotoByUser(userid);
    }

    @Override
    public boolean deleteMyPhoto(Integer photoid) {
        Integer num = habitDao.deleteMyPhoto(photoid);
        if (num>=1){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean updateBasicWithoutAddress(PersonalData personalData) {
        Integer num =  personalDao.updateBasicWithoutAddress(personalData);
        if (num>=1){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public boolean updateCpWithoutAddress(PersonalData personalData) {
        Integer num = cpLimitDao.updateCpLimitWithoutAddress(personalData);
        if (num>=1){
            return true;
        }else {
            return false;
        }
    }

}
