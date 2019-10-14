package com.qsxh.controller;

import com.qsxh.entity.FundEntity;
import com.qsxh.service.FundService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/fund")
public class FundAction {

    @Resource
    private FundService fundService;

    private List<FundEntity> fundList;
    //    普通用户查询
    @RequestMapping(value = "/fundList.action")
    public @ResponseBody
    Map<String,Object> findFundList(FundEntity fundEntity){
        Integer page= fundEntity.getPage();
        Integer limit= fundEntity.getLimit();
        fundEntity.setPage((page - 1) * limit);
        System.out.println("======"+fundEntity.getPage());
        Integer count=fundService.getFundNum(fundEntity);
        System.out.println("资金流水数=========="+count);
        fundList =fundService.findAllAccount(fundEntity);
        Map<String, Object> fundMap = new HashMap<String, Object>();
        fundMap.put("code", 0);
        fundMap.put("count", count);
        fundMap.put("data", fundList);
        return fundMap;
    }


}
