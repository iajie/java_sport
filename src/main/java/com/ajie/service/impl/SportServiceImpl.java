package com.ajie.service.impl;

import com.ajie.entity.Sport;
import com.ajie.entity.SysMenu;
import com.ajie.mapper.SportMapper;
import com.ajie.service.SportService;
import com.ajie.utils.*;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author 阿杰
 * @create 2021-12-09 20:27
 */
@Slf4j
@Service
public class SportServiceImpl implements SportService {

    @Autowired
    private SportMapper sportMapper;

    @Override
    public Result delete(Long id) {
        if (id == null) {
            return Result.fail("请传递删除ID");
        }
        sportMapper.delete(id);
        return Result.success("删除成功");
    }

    @Override
    public Result update(Sport sport) {
        sport.setUpdateName(SecurityUtils.getUsername());
        sport.setUpdateTime(DateUtils.getDateTime());
        sportMapper.update(sport);
        return Result.success("修改成功");
    }

    @Override
    public Result insert(Sport sport) {
        sport.setCreateName(SecurityUtils.getUsername());
        sport.setCreateTime(DateUtils.getDateTime());
        sportMapper.insert(sport);
        return Result.success("添加成功");
    }

    @Override
    public Result findPage(QueryInfo queryInfo) {
        log.info("开始数据分页-->页码{}, --->{}页数--->查询内容{}", queryInfo.getPageNumber(), queryInfo.getPageSize(), queryInfo.getQueryString());
        PageHelper.startPage(queryInfo.getPageNumber(), queryInfo.getPageSize());
        Page<Sport> sports = sportMapper.findPage(queryInfo.getQueryString());
        long total = sports.getTotal();
        List<Sport> result = sports.getResult();
        log.info("查询的总条数-->{}", total);
        log.info("分页列表-->{}", result);
        return new PageResult(total, result);
    }
}
