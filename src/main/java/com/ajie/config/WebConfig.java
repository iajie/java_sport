package com.ajie.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 跨域处理的配置类
 * @author ajie
 * @createTime 2021年07月16日 22:04:00
 */
@Configuration
@Slf4j
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry
                //过滤所有请求
                .addMapping("/**")
                //配置跨域来源
                .allowedOrigins("http://localhost:8888")
                //是否支持跨域Cookie
                .allowCredentials(true)
                //最大响应时间
                .maxAge(3600)
                //设置允许访问的方法
                .allowedMethods("GET", "POST", "PUT", "DELETE");
    }

}
