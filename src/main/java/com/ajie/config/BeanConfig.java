package com.ajie.config;

import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author ajie
 * @createTime 2021年09月02日 21:40:00
 */
@Configuration
public class BeanConfig {

    @Bean
    public UploadManager uploadManager() {
        com.qiniu.storage.Configuration cfg = new com.qiniu.storage.Configuration(Region.region2());
        return new UploadManager(cfg);
    }

}
