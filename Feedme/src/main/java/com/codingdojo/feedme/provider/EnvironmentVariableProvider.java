package com.codingdojo.feedme.provider;

import io.github.cdimascio.dotenv.Dotenv;
import org.springframework.stereotype.Component;

@Component
public class EnvironmentVariableProvider {
    private final Dotenv dotenv;

    public EnvironmentVariableProvider(Dotenv dotenv) {
        this.dotenv = dotenv;
    }

    public String getApiKey() {
        return dotenv.get("API_KEY");
    }
}

