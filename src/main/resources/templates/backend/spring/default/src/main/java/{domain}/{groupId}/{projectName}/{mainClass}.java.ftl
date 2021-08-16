package  ${config.domain}.${config.groupId}.${config.projectName};

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import java.util.stream.Stream;
import java.util.Arrays;
import java.util.List;
import java.util.HashMap;
import java.util.ArrayList;

import ${config.domain}.${config.groupId}.${config.projectName}.${config.common}.AuthoritiesConstants;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.User;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.Permission;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.Role;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.UserService;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.RoleService;


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
		    Role role;
		    List<Permission> permissions;
		    List<Role> roles = new ArrayList<>();
            <#list roles as role>

            // Role ${role.name}
            role = new Role();
            role.setAuthority("${role.name}");
            permissions = new ArrayList<>();
            <#list role.permissions as permission>
            permissions.add(new Permission("${permission.name}"));
            </#list>
            role.setPermissions(permissions);
            roles.add(role);
            </#list>

            roles.forEach(roleService::save);

			Role adminRole = new Role();
			adminRole.setAuthority(AuthoritiesConstants.super_admin);
			User SuperAdmin = new User();
			SuperAdmin.setFirstName("Super");
			SuperAdmin.setLastName("Admin");
			SuperAdmin.setEmail("admin@admin.com");
			SuperAdmin.setUsername("admin");
			SuperAdmin.setPassword("admin");
			SuperAdmin.setRoles(Arrays.asList(adminRole));
            userService.save(SuperAdmin);
		};
	}

}
