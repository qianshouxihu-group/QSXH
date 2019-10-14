package com.qsxh.dao;

import com.qsxh.entity.FundEntity;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("fundDao")
public interface FundDao {
    public List<FundEntity> findAllAccount(FundEntity fundEntity);

    public Integer getFundNum(FundEntity fundEntity);
}
