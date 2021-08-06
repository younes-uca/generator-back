package ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade};

import java.util.List;

import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.User;

public interface UserService {

List<User> findAll();


    User findByUsername(String username);


    User findById(Long id);


    void deleteById(Long id);



    User save(User user);


    User update(User user);


    int delete(User user);


    User findByUsernameWithRoles(String username);


    int  deleteByUsername(String username);



    }
