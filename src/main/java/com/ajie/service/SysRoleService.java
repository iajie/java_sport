package com.ajie.service;

import com.ajie.entity.SysRole;
import com.ajie.utils.QueryInfo;
import com.ajie.utils.Result;

/**
 * @author ajie
 * @createTime 2021年08月11日 20:40:00
 */
public interface SysRoleService {

    /**
     * 分页查询
     * @param queryInfo 页码、页数大小、查询内容
     * @return
     */
    Result findPage(QueryInfo queryInfo);

    /**
     * 添加角色数据
     * @param role
     * @return
     */
    Result insert(SysRole role);

    /**
     * 删除角色数据
     * @param id
     * @return
     */
    Result delete(Long id);

    /**
     * 修改角色数据
     * @param role
     * @return
     */
    Result update(SysRole role);

    Result findAll();
}
