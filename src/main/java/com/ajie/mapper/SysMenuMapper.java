package com.ajie.mapper;

import com.ajie.entity.SysMenu;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 菜单数据的增删改查
 * @author ajie
 * @createTime 2021年08月11日 20:25:00
 */
public interface SysMenuMapper {

    /**
     * 添加菜单信息
     * @param menu 菜单数据
     */
    void insert(SysMenu menu);

    /**
     * 修改菜单信息
     * @param menu 菜单数据
     */
    void update(SysMenu menu);

    /**
     * 删除菜单数据
     * @param id
     */
    void delete(Long id);

    /**
     * 分页查询
     * @param queryString
     * @return
     */
    Page<SysMenu> findPage(String queryString);

    /**
     * 查询所有父级菜单
     * @return
     */
    List<SysMenu> findParent();

    /**
     * 根据角色ID查询菜单信息
     * @param roleId
     * @return
     */
    List<SysMenu> findByRoleId(@Param("roleId") Long roleId);

    /**
     * 根据角色ID和父级ID查询所有的子级菜单
     * @param parentId
     * @param roleId
     * @return
     */
    List<SysMenu> findByRoleIdAndParentId(@Param("parentId") Long parentId, @Param("roleId") Long roleId);
}
