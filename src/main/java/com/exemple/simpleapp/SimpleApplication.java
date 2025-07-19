package com.example.simpleapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SimpleApplication {

    @GetMapping("/")
    public String home() {
        return "Olá! Esta é uma aplicação Java simples rodando em um container Docker.";
    }

    public static void main(String[] args) {
        SpringApplication.run(SimpleApplication.class, args);
    }
}
