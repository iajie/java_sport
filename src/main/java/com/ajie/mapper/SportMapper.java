package com.ajie.mapper;

import com.ajie.entity.FoodType;
import com.ajie.entity.Sport;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Insert;

import java.util.List;

/**
 * @Author 阿杰
 * @create 2021-12-09 20:24
 */
public interface SportMapper {

    /**
     * 添加
     * @param sport
     */
    @Insert("insert into sport(title, content, create_time, create_name) values (#{title}, #{content}, #{createTime}, #{createName})")
    void insert(Sport sport);

    /**
     * 删除
     * @param id
     */
    void delete(Long id);

    /**
     * 修改
     * @param sport
     */
    void update(Sport sport);

    /**
     * 分页查询
     * @param queryString
     * @return
     */
    Page<Sport> findPage(String queryString);
}
