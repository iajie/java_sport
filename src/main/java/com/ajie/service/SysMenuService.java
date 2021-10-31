package com.ajie.service;

import com.ajie.entity.SysMenu;
import com.ajie.entity.SysPermission;
import com.ajie.utils.QueryInfo;
import com.ajie.utils.Result;

/**
 * @author ajie
 * @createTime 2021年08月11日 20:40:00
 */
public interface SysMenuService {

    /**
     * 查询所有父级菜单
     * @return
     */
    Result findParent();

    /**
     * 分页查询
     * @param queryInfo 页码、页数大小、查询内容
     * @return
     */
    Result findPage(QueryInfo queryInfo);

    /**
     * 添加菜单数据
     * @param menu
     * @return
     */
    Result insert(SysMenu menu);

    /**
     * 删除菜单数据
     * @param id
     * @return
     */
    Result delete(Long id);

    /**
     * 修改菜单数据
     * @param menu
     * @return
     */
    Result update(SysMenu menu);
}
