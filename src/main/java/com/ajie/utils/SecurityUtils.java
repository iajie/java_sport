package com.ajie.utils;

import com.ajie.entity.SysUser;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * 用于获取当前登录用户的基本信息
 * @author ajie
 * @createTime 2021年07月31日 22:41:00
 */
public class SecurityUtils {

    /**
     * 从Security主体信息中获取用户信息
     * @return
     */
    public static SysUser getUser() {
        SysUser user = (SysUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        user.setPassword(null);
        user.setName(user.getUsername());
        return user;
    }

    /**
     * 在security中获取用户名
     * @return
     */
    public static String getUsername() {
        return getUser().getUsername();
    }

    /**
     * 在security中获取用户ID
     * @return
     */
    public static Long getUserId() {
        return getUser().getId();
    }
}
