# Estágio 1: Build da aplicação com Maven
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Otimização de cache: Copia o pom.xml e baixa as dependências primeiro.
# Esta camada só será reconstruída se o pom.xml mudar.
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Agora copia o código-fonte. Se apenas o código mudar, as dependências não serão baixadas novamente.
COPY src ./src

# Executa o build do Maven para gerar o arquivo .jar. -DskipTests pula os testes.
# O -B executa o Maven em modo "batch", ideal para automação.
RUN mvn clean package -DskipTests -B

# Estágio 2: Imagem final de execução
# Usamos uma imagem JRE (Java Runtime Environment) que é menor que o JDK completo.
FROM eclipse-temurin:17-jre-jammy
WORKDIR /app

# Prática de segurança: Crie um usuário não-root para executar a aplicação
RUN addgroup --system appuser && adduser --system --ingroup appuser appuser
USER appuser

# Copia o arquivo .jar gerado no estágio de build para a imagem final
COPY --from=build /app/target/*.jar app.jar

# Expõe a porta 8080 para que a aplicação possa ser acessada de fora do container
EXPOSE 8080

# Comando para iniciar a aplicação quando o container for executado
ENTRYPOINT ["java", "-jar", "app.jar"]

