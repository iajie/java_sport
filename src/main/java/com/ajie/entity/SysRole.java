package com.ajie.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * 角色信息实体
 * @author ajie
 * @createTime 2021年07月19日 21:42:00
 */
@Data
public class SysRole {
    /**
     * 主键
     */
    @ApiModelProperty(value = "主键")
    private Long id;

    /**
     * 标签名称
     */
    @ApiModelProperty(value = "角色标签")
    private String label;

    /**
     * 标签值
     */
    @ApiModelProperty(value = "角色值")
    private String code;

    @ApiModelProperty(value = "显示状态(0不显示、1显示)")
    private boolean status;

    @ApiModelProperty(value = "菜单列表")
    private List<SysMenu> menus;

    @ApiModelProperty(value = "权限列表")
    private List<SysPermission> permissions;
}
