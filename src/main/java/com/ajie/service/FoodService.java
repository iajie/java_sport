package com.ajie.service;

import com.ajie.entity.Food;
import com.ajie.entity.FoodType;
import com.ajie.utils.QueryInfo;
import com.ajie.utils.Result;

import java.util.List;

/**
 * @author ajie
 * @createTime 2021年06月14日 19:07:00
 */
public interface FoodService {
    /**
     * 删除菜品
     * @param id
     * @return
     */
    Result delete(Long id);

    /**
     * 修改菜品
     * @param food
     * @return
     */
    Result update(Food food);

    /**
     * 添加菜品
     * @param food
     * @return
     */
    Result insert(Food food);

    /**
     * 分页查询菜品信息
     * @param queryInfo
     * @return
     */
    Result findPage(QueryInfo queryInfo);

    /**
     * 修改菜品分类
     * @param foodType
     * @return
     */
    Result updateType(FoodType foodType);

    /**
     * 删除食物分类
     * @param id
     * @return
     */
    Result deleteType(Long id);

    /**
     * 添加食物分类
     * @param foodType
     * @return
     */
    Result insertType(FoodType foodType);

    /**
     * 批量导入
     * @param list
     * @return
     */
    Result batchImport(List<Food> list);

    /**
     * 查询食物
     * @param queryInfo
     * @return
     */
    Result findFoodPage(QueryInfo queryInfo);

    /**
     * 查询所有分类信息
     * @return
     */
    Result typeAll();

    Result findFoodByTypeId(QueryInfo queryInfo);
}
