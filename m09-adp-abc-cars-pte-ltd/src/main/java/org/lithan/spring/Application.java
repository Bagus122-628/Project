package org.lithan.spring;

import javax.annotation.Resource;

import org.lithan.spring.services.FilesStorageServiceImpl;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Application implements CommandLineRunner {

	@Resource
	FilesStorageServiceImpl storageService;

	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);

	}

	@Override
	public void run(String... arg) throws Exception {
		// storageService.deleteAll();
		storageService.init();
	}

}
