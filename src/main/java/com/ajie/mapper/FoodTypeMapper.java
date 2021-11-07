package com.ajie.mapper;

import com.ajie.entity.FoodType;
import com.github.pagehelper.Page;

import java.util.List;

/**
 * @author ajie
 * @createTime 2021年06月14日 18:57:00
 */
public interface FoodTypeMapper {

    /**
     * 添加食物分类
     * @param foodType
     */
    void insert(FoodType foodType);

    /**
     * 删除食物分类
     * @param id
     */
    void delete(Long id);

    /**
     * 修改食物分类
     * @param foodType
     */
    void update(FoodType foodType);

    /**
     * 分页查询
     * @param queryString
     * @return
     */
    Page<FoodType> findPage(String queryString);

    /**
     * 根据分类名称查询分类信息
     * @param title
     * @return
     */
    FoodType findByTitle(String title);

    /**
     * 获取所有的分类
     * @return
     */
    List<FoodType> typeAll();
}
