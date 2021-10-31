package com.ajie;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.ajie.mapper")
@SpringBootApplication
public class JavaSportApplication {

    public static void main(String[] args) {
        SpringApplication.run(JavaSportApplication.class, args);
    }

}
