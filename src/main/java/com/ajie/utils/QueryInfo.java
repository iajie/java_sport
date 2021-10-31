package com.ajie.utils;

import lombok.Data;

/**
 * @author ajie
 * @createTime 2021年07月17日 10:39:00
 */
@Data
public class QueryInfo {
    /**
     * 第几页
     */
    private Integer pageNumber;

    /**
     * 一页多少条数据
     */
    private Integer pageSize;

    /**
     * 查询的内容
     */
    private String queryString;
}
