package com.itheima.ai;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.itheima.ai.mapper")
//@EnableCanalClient
public class CampusAiApplication {

    public static void main(String[] args) {
        SpringApplication.run(CampusAiApplication.class, args);
    }

}
