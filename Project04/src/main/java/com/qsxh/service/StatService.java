package com.qsxh.service;


import com.qsxh.entity.StatEntity;

import java.util.List;

public interface StatService {

	/**
	 * 查询性别分布的数据
	 * @return
	 */
	public List<StatEntity> loadUserSexStatList();

	/**
	 * 加载vip购买年度统计数据
	 * @param year
	 * @return
	 */
	public List<Double> loadVipBuyYearStat(String year);

	/**
	 * 加载新增用户年度统计数据
	 * @param year
	 * @return
	 */
	public List<Double> loadIncreaseUserYearStat(String year);


	/**
	 * 加载用户消费年度排行统计数据
	 * @param year
	 * @return
	 */

    public List<StatEntity> loadUserConsumeOrderStat(String year);

	/**
	 * 加载用户学历分布数据
	 * @param
	 * @return
	 */
    public List<StatEntity> loadUserEduStat();

	public List<StatEntity> loadUserAgeStat();
}
