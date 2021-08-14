package  ${config.domain}.${config.groupId}.${config.projectName};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;

import ${config.domain}.${config.groupId}.${config.projectName}.${config.common}.AuthoritiesConstants;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.User;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.Role;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.UserService;


@SpringBootApplication
public class ${config.mainClass} {
public static ConfigurableApplicationContext ctx;

public static void main(String[] args) {
    ctx=SpringApplication.run(${config.mainClass}.class, args);
}

public static ConfigurableApplicationContext getCtx() {
    return ctx;
}

    @Bean
    public CommandLineRunner demo(UserService userService, RoleService roleService) {
		return (args) -> {
			Role role = new Role();
			role.setAuthority(AuthoritiesConstants.super_admin);
//			roleService.save(role);
			User SuperAdmin = new User();
			SuperAdmin.setFirstName("Super");
			SuperAdmin.setLastName("Admin");
			SuperAdmin.setEmail("admin@admin.com");
			SuperAdmin.setUsername("admin");
			SuperAdmin.setPassword("admin");
			SuperAdmin.setRoles(Arrays.asList(role));
            userService.save(SuperAdmin);
		};
	}

}
