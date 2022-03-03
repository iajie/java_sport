package com.ajie.service;

import com.ajie.entity.Food;
import com.ajie.entity.FoodType;
import com.ajie.entity.Sport;
import com.ajie.entity.WxRun;
import com.ajie.utils.QueryInfo;
import com.ajie.utils.Result;

import java.util.List;

/**
 * @author ajie
 * @createTime 2021年06月14日 19:07:00
 */
public interface SportService {
    /**
     * 删除菜品
     * @param id
     * @return
     */
    Result delete(Long id);

    /**
     * 获取详情
     * @param id
     * @return
     */
    Result findInfo(Long id);

    /**
     * 修改菜品
     * @param sport
     * @return
     */
    Result update(Sport sport);

    /**
     * 添加菜品
     * @param sport
     * @return
     */
    Result insert(Sport sport);

    /**
     * 分页查询菜品信息
     * @param queryInfo
     * @return
     */
    Result findPage(QueryInfo queryInfo);

    Result insertStep(List<WxRun> runs);

    Result stepReport();

}
