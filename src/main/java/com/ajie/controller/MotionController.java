package com.ajie.controller;

import com.ajie.entity.Motion;
import com.ajie.service.MotionService;
import com.ajie.utils.QueryInfo;
import com.ajie.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * @CreateAuthor ajie
 * @createTime 2022/3/23 19:23
 **/
@RestController
@RequestMapping("/motion")
public class MotionController {

    @Autowired
    private MotionService motionService;

    @PostMapping("/findPage")
    public Result findAll(@RequestBody QueryInfo queryInfo) {
        return motionService.findPage(queryInfo);
    }

    @PostMapping("/add")
    public Result add(@RequestBody Motion sport) {
        return motionService.add(sport);
    }

    @PostMapping("/edit")
    public Result edit(@RequestBody Motion sport) {
        return motionService.edit(sport);
    }

    @DeleteMapping("delete")
    public Result delete(Long id) {
        return motionService.delete(id);
    }

    @GetMapping("/{id}")
    public Result findInfo(@PathVariable Long id) {
        return motionService.findInfo(id);
    }


}
