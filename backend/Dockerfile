# 上海如静知华信息科技有限公司 · https://www.zhuatech.cn/
FROM maven:3.9.11-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -q -DskipTests package

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/target/zhuatech-competitorai.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
