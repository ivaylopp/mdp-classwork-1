package com.test.project.spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan
public class ProjectSpringApplication
{

	public static void main(String[] args)
	{
		SpringApplication application = new SpringApplication(ProjectSpringApplication.class);
		application.run(args);
	}
}
