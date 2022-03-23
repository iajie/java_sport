package com.ajie.entity;

import lombok.Data;

/**
 * @CreateAuthor ajie
 * @createTime 2022/3/23 19:10
 **/
@Data
public class Motion {

    /**
     * 主键
     */
    private Long id;
    /**
     * 运动名称
     */
    private String name;
    /**
     * 适用年龄
     */
    private String applicableAge;
    /**
     * 身体收益部位
     */
    private String beneficialPosition;
    /**
     * 运动科普
     */
    private String introduction;

}
