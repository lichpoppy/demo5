package com.great.springboot;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


public class ServletInitializer extends SpringBootServletInitializer
{
     @Override
     protected SpringApplicationBuilder configure(SpringApplicationBuilder applicationBuilder){
     	return  applicationBuilder.sources(SpringbootApplication.class);
     }

}
