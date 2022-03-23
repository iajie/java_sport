package com.ajie.service;

import com.ajie.entity.Goods;
import com.ajie.utils.QueryInfo;
import com.ajie.utils.Result;

import java.util.List;

/**
 * @Author 阿杰
 * @create 2021-04-01 11:14
 */
public interface GoodsService {
    /**
     * 分页查询
     * @param queryInfo 查询条件
     * @return
     */
    Result findPage(QueryInfo queryInfo);

    /**
     * 查询所有商品信息
     * @return
     */
    List<Goods> findAll();

    /**
     * 添加商品信息
     * @param goods
     * @return
     */
    Result add(Goods goods);

    /**
     * 修改商品信息
     * @param goods
     * @return
     */
    Result edit(Goods goods);

    /**
     * 根据ID删除商品信息
     * @param id
     * @return
     */
    Result delete(Long id);

    /**
     * 批量导入数据
     * @param list
     * @return
     */
    Result batchImport(List<Goods> list);
}
