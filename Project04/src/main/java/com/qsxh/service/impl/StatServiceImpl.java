package com.qsxh.service.impl;


import com.qsxh.dao.StatMapper;
import com.qsxh.entity.StatEntity;
import com.qsxh.service.StatService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("statService")
public class StatServiceImpl implements StatService {
	
	
	@Resource
	private StatMapper statMapper;

	@Override
	public List<StatEntity> loadUserSexStatList() {
		return statMapper.loadUserSexStatList();
	}

	@Override
	public List<Double> loadVipBuyYearStat(String year) {
		return this.statMapper.loadVipBuyYearStat(year);
	}

	@Override
	public List<Double> loadIncreaseUserYearStat(String year) {
		return this.statMapper.loadIncreaseUserYearStat(year);
	}

	@Override
	public List<StatEntity> loadUserConsumeOrderStat(String year) {
		return this.statMapper.loadUserConsumeOrderStat(year);
	}

	@Override
	public List<StatEntity> loadUserEduStat() {
		return this.statMapper.loadUserEduStat();
	}

	@Override
	public List<StatEntity> loadUserAgeStat() {
		return this.statMapper.loadUserAgeStat();
	}


}
