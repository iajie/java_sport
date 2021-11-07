package com.ajie.entity;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * 食物类型
 * @author ajie
 * @createTime 2021年06月14日 18:40:00
 */
@Data
public class FoodType {
    @ApiModelProperty("主键")
    private Long id;

    @ApiModelProperty("分类标题")
    private String title;

    @ApiModelProperty("图标")
    private String icon;

    @ApiModelProperty("分类下的食物")
    private List<Food> foods;
}
