package com.ajie.controller;

import com.ajie.service.SysUserService;
import com.ajie.utils.RedisUtils;
import com.ajie.utils.Result;
import com.ajie.utils.SecurityUtils;
import com.ajie.vo.LoginVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

/**
 * 登录
 * 退出
 * 获取当前登录用户的基本信息
 * 相关的接口
 * @author ajie
 * @createTime 2021年07月18日 18:54:00
 */
@RestController
@RequestMapping("/user")
@Api(value = "用户使用接口")
public class LoginController {

    @Autowired
    private SysUserService userService;

    @Autowired
    private RedisUtils redisUtils;

    @ApiOperation(value = "登录接口")
    @PostMapping("/login")
    public Result login(@RequestBody LoginVo loginVo) {
        return userService.login(loginVo);
    }

    @ApiOperation(value = "短信登录")
    @PostMapping("/sms/login")
    public Result smsLogin(@RequestBody LoginVo loginVo) {
        return userService.login(loginVo);
    }

    @ApiOperation(value = "获取用户基本信息")
    @GetMapping("/getInfo")
    public Result getUserInfo() {
        return Result.success("获取用户信息成功", SecurityUtils.getUser());
    }

    @ApiOperation(value = "用户退出登录")
    @GetMapping("/logout")
    public Result logout() {
        // 清除缓存
        redisUtils.delKey("userInfo_" + SecurityUtils.getUsername());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return Result.success("退出成功！");
    }

}
