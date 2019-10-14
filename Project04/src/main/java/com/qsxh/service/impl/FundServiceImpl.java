package com.qsxh.service.impl;

import com.qsxh.dao.FundDao;
import com.qsxh.entity.FundEntity;
import com.qsxh.service.FundService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("fundService")
public class FundServiceImpl implements FundService {

    @Resource
    private FundDao fundDao;


    @Override
    public List<FundEntity> findAllAccount(FundEntity fundEntity) {
        return this.fundDao.findAllAccount(fundEntity);
    }

    @Override
    public Integer getFundNum(FundEntity fundEntity) {
        return this.fundDao.getFundNum(fundEntity);
    }
}
