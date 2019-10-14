package com.qsxh.service;

import com.qsxh.entity.FundEntity;

import java.util.List;

public interface FundService {

    public List<FundEntity> findAllAccount(FundEntity fundEntity);

    public Integer getFundNum(FundEntity fundEntity);


}
