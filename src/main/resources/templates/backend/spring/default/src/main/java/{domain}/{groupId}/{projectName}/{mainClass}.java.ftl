package  ${config.domain}.${config.groupId}.${config.projectName};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;


@SpringBootApplication
public class ${config.mainClass} {

public static ConfigurableApplicationContext ctx;
public static void main(String[] args) {
ctx=SpringApplication.run(${config.mainClass}.class, args);
}
public static ConfigurableApplicationContext getCtx() {
return ctx;
}
-

}
