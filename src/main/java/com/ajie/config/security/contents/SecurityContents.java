package com.ajie.config.security.contents;

/**
 * 白名单
 * @author ajie
 * @createTime 2021年07月31日 15:30:00
 */
public class SecurityContents {
    public static final String[] WHITE_LIST = {
            //后端登录接口
            "/user/login",

            //swagger相关
            "/favicon.ico",
            "/swagger-ui.html",
            "/doc.html",
            "/webjars/**",
            "/swagger-resources/**",
            "/v2/**",
            "/configuration/ui",
            "/configuration/security",
            "/tool/forget/password",
            "/tool/sms",
            "/user/sms/login",
            "/goods/batchExport",

            // 小程序相关
            "/mini/login",
    };
}
