package com.qsxh.controller;


import com.qsxh.entity.StatEntity;
import com.qsxh.service.StatService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("stat")
public class StatController {
	
	@Resource
	private StatService statService;
	/**
	 * 加载会员性别分布数据
	 */
	@RequestMapping("loadUserSexStatJson")
	public @ResponseBody
	List<StatEntity> loadUserSexStatJson(){
		return this.statService.loadUserSexStatList();
	}

	/**
	 * 加载vip购买年度统计数据
	 */
	@RequestMapping("loadVipBuyYearStat")
	public @ResponseBody
	List<Double> loadVipBuyYearStat(String year){
		List<Double> entities=this.statService.loadVipBuyYearStat(year);
		return entities;
	}

	/**
	 * 加载新增用户年度统计数据
	 */
	@RequestMapping("loadIncreaseUserYearStat")
	public @ResponseBody
	List<Double> loadIncreaseUserYearStat(String year){
		List<Double> entities=this.statService.loadIncreaseUserYearStat(year);
		return entities;
	}

	/**
	 * 加载用户消费年度排行数据
	 */
	@RequestMapping("loadUserConsumeOrderStat")
	public @ResponseBody
	Map<String,Object> loadUserConsumeOrderStat(String year){
		List<StatEntity> entities=this.statService.loadUserConsumeOrderStat(year);
		Map<String,Object> map=new HashMap<String, Object>();
		List<String> names=new ArrayList<String>();
		List<Double> values=new ArrayList<Double>();
		for (StatEntity statEntity : entities) {
			names.add(statEntity.getName());
			values.add(statEntity.getValue());
		}
		map.put("name", names);
		map.put("value", values);
		return map;
	}

	/**
	 * 加载会员学历分布数据
	 */
	@RequestMapping("loadUserEduStat")
	public @ResponseBody
	List<StatEntity> loadUserEduStat(){
		return this.statService.loadUserEduStat();
	}



	@RequestMapping("loadUserAgeStat")
	public @ResponseBody
	List<StatEntity> loadUserAgeStat(){
		return this.statService.loadUserAgeStat();
	}

}
