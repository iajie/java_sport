package com.ajie.mapper;


import com.ajie.entity.Motion;
import com.github.pagehelper.Page;

/**
 * @CreateAuthor ajie
 * @createTime 2022/3/23 19:11
 **/
public interface MotionMapper {

    /**
     * 数据查询
     * @param queryString 根据字符串查询
     * @return
     */
    Page<Motion> findPage(String queryString);

    /**
     * 修改运动信息
     * @param sport 运动参数
     * @return
     */
    int update(Motion sport);

    /**
     * 根据运动编号查询运动信息
     * @param id
     * @return
     */
    Motion findById(Long id);

    /**
     * 添加运动
     * @param sport
     * @return
     */
    int insert(Motion sport);

    /**
     * 根据运动名称查询运动信息
     * @param name
     * @return
     */
    Motion findByName(String name);

    /**
     * 根据编号删除运动信息
     * @param id
     * @return
     */
    int delete(Long id);

}
