package com.ajie.config.security;

import com.ajie.config.security.contents.SecurityContents;
import com.ajie.config.security.handler.JwtAccessDeniedHandler;
import com.ajie.config.security.handler.JwtAuthenticationEntryPoint;
import com.ajie.config.security.handler.JwtAuthenticationFilter;
import com.ajie.config.security.service.UserDetailServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * 权限基本配置
 * @author ajie
 * @createTime 2021年07月23日 21:53:00
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private UserDetailServiceImpl userDetailService;

    @Autowired
    private JwtAuthenticationEntryPoint authenticationEntryPoint;

    @Autowired
    private JwtAccessDeniedHandler accessDeniedHandler;

    @Autowired
    private JwtAuthenticationFilter authenticationFilter;

    /**
     * 一般用于配置白名单
     * 白名单：可以没有权限也可以访问的资源
     * @param web
     * @throws Exception
     */
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring()
            .mvcMatchers(SecurityContents.WHITE_LIST);
    }

    /**
     * Security的核心配置
     * @param http
     * @throws Exception
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        //1. 使用jwt，首先关闭跨域攻击
        http.csrf().disable();
        //2. 关闭session
        http.sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
        //3. 请求都需要进行认证之后才能访问，除白名单以外的资源
        http.authorizeRequests().anyRequest().authenticated();
        //4. 关闭缓存
        http.headers().cacheControl();
        //5. token过滤器，校验token
        http.addFilterBefore(authenticationFilter, UsernamePasswordAuthenticationFilter.class);
        //6. 没有登录、没有权限访问资源自定义返回结果
        http.exceptionHandling().authenticationEntryPoint(authenticationEntryPoint).accessDeniedHandler(accessDeniedHandler);
    }

    /**
     * 自定义登录逻辑的配置
     * 也即是配置到security中进行认证
     * @param auth
     * @throws Exception
     */
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailService).passwordEncoder(passwordEncoder());
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
