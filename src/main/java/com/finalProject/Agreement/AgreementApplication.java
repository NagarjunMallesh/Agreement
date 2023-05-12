package com.finalProject.Agreement;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"com.finalProject.controllers","com.finalProject.pojo","com.finalProject.util","com.finalProject.dao"})
public class AgreementApplication {

	public static void main(String[] args) {
		System.setProperty("server.servlet.context-path", "/FinalProject_SpringBoot");
		SpringApplication.run(AgreementApplication.class, args);
	}

}
