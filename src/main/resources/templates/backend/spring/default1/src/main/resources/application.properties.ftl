# ===============================
# = DATA SOURCE
# ===============================
# Set here configurations for the database connection
spring.datasource.url=jdbc:mysql://localhost/${config.projectName}?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC
spring.main.allow-bean-definition-overriding=true
spring.application.name=${config.projectName}


spring.datasource.username=${config.backend.dataSourceUserName}
spring.datasource.password=${config.backend.dataSourcePassword}
spring.datasource.driver-class-name=com.mysql.jdbc.Driver

# Keep the connection alive if idle for a long time (needed in production)
spring.datasource.testWhileIdle=true
spring.datasource.validationQuery=SELECT 1
# ===============================
# = JPA / HIBERNATE
# ===============================
# Show or not log for each sql query
spring.jpa.show-sql=true
# Hibernate ddl auto (create, create-drop, update): with "create-drop" the database
# schema will be automatically created afresh for every start of application
spring.jpa.hibernate.ddl-auto=update
# Naming strategy
spring.jpa.hibernate.naming.implicit-strategy=org.hibernate.boot.model.naming.ImplicitNamingStrategyLegacyHbmImpl
spring.jpa.hibernate.naming.physical-strategy=org.springframework.boot.orm.jpa.hibernate.SpringPhysicalNamingStrategy
# Allows Hibernate to generate SQL optimized for a particular DBMS
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL5Dialect

server.port = #{config.backend.port}



