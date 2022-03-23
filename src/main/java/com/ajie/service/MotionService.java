package com.ajie.service;

import com.ajie.entity.Motion;
import com.ajie.utils.QueryInfo;
import com.ajie.utils.Result;

/**
 * @CreateAuthor ajie
 * @createTime 2022/3/23 19:14
 **/
public interface MotionService {

    /**
     * 分页查询
     * @param queryInfo 查询条件
     * @return
     */
    Result findPage(QueryInfo queryInfo);

    /**
     * 添加运动信息
     * @param sport
     * @return
     */
    Result add(Motion sport);

    /**
     * 修改运动信息
     * @param sport
     * @return
     */
    Result edit(Motion sport);

    /**
     * 根据ID删除运动信息
     * @param id
     * @return
     */
    Result delete(Long id);

    Result findInfo(Long id);
}
