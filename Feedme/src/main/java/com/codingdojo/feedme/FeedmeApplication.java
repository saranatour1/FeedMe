package com.codingdojo.feedme;

import org.springframework.beans.factory.annotation.Value;
// import org.springframework.beans.factory.annotation.Value;
// import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class FeedmeApplication {


	@Value("${API_KEY}")
	private String apiKey;
	public static void main(String[] args) {
		SpringApplication.run(FeedmeApplication.class, args);
	}



}
