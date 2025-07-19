# Simple Java Application

Esta é uma aplicação Java simples com Spring Boot, criada para fins de estudo de pipelines de CI/CD com GitHub Actions.

## Pré-requisitos

- Java 17 (ou superior)
- Maven 3.8 (ou superior)
- Docker

## Como Compilar e Empacotar

Use o Maven para compilar o projeto e gerar o arquivo `.jar`:
```bash
mvn clean package
```

## Como Construir e Executar com Docker

1. Construa a imagem Docker:
   ```bash
   docker build -t simple-java-app .
   ```
2. Execute o container:
   ```bash
   docker run -p 8080:8080 simple-java-app
   ```

Após executar, a aplicação estará disponível em `http://localhost:8080`.

## Autor
Bruno Oliveira 
