package com.test.project.spring;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ExampleController
{

	@RequestMapping("/")
	public String helloWorld()
	{
		return "Hello World!";
	}
}
