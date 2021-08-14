
package  ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.restFacade};

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import ${config.domain}.${config.groupId}.${config.projectName}.${config.common}.AuthoritiesConstants;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.User;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.UserService;

@RequestMapping("/api/users")
@RestController
// @PreAuthorize("hasRole(AuthoritiesConstants.super_admin)")
public class UserRest {
    @Autowired
    private UserService userService;

    @PreAuthorize("hasRole(AuthoritiesConstants.super_admin)")
    @GetMapping("/")
    public List<User> findAll(){
        return this.userService.findAll();
    }

    public User findByUsername(String username) {
        return userService.findByUsername(username);
    }

    @GetMapping("/{id}")
    public User findById(@PathVariable Long id) {
        return userService.findById(id);
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id) {
        userService.deleteById(id);
    }

    @PostMapping("/save")
    public User save(@RequestBody User user) {
        return userService.save(user);
    }

    @PutMapping("/")
    public User update(@RequestBody User user) {
        return userService.update(user);
    }

    @DeleteMapping("/id/{id}")
    public int delete(@PathVariable Long id) {
        return userService.delete(id);
    }

    @GetMapping("/username/{username}")
    public User findByUsernameWithRoles(@PathVariable String username) {
        return userService.findByUsernameWithRoles(username);
    }

    @DeleteMapping("/username/{username}")
    public int deleteByUsername(@PathVariable String username) {
        return userService.deleteByUsername(username);
    }

}

