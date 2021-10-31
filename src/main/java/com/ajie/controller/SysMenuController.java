package com.ajie.controller;

import com.ajie.entity.SysMenu;
import com.ajie.entity.SysPermission;
import com.ajie.service.SysMenuService;
import com.ajie.service.SysPermissionService;
import com.ajie.utils.QueryInfo;
import com.ajie.utils.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 菜单数据控制层
 * @author ajie
 * @createTime 2021年08月11日 20:53:00
 */
@RestController
@Api(tags = "菜单数据")
@RequestMapping("/menu")
public class SysMenuController {

    @Autowired
    private SysMenuService menuService;

    @ApiOperation(value = "查询所有的父级菜单")
    @GetMapping("/findParent")
    public Result findParent() {

        return menuService.findParent();
    }

    @ApiOperation(value = "分页查询")
    @PostMapping("/findPage")
    public Result findPage(@RequestBody QueryInfo queryInfo) {
        return menuService.findPage(queryInfo);
    }

    @ApiOperation(value = "添加菜单")
    @PostMapping("/insert")
    public Result insert(@RequestBody SysMenu menu) {
        return menuService.insert(menu);
    }

    @ApiOperation(value = "修改菜单")
    @PutMapping("/update")
    public Result update(@RequestBody SysMenu menu) {
        return menuService.update(menu);
    }

    @ApiOperation(value = "删除菜单")
    @DeleteMapping("/delete/{id}")
    public Result delete(@PathVariable("id") Long id) {
        return menuService.delete(id);
    }

}
