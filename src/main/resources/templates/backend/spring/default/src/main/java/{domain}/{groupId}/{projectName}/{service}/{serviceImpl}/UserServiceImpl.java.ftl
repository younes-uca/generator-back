package ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceImpl};

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import  ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.Role;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.User;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.dao}.UserDao;

import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.RoleService;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.UserService;

@Service(value = "userService")
public class UserServiceImpl implements UserService, UserDetailsService {

@Autowired
private UserDao userDao;

@Autowired
private RoleService roleService;

@Autowired
BCryptPasswordEncoder bCryptPasswordEncoder;

@Override
public List<User> findAll() {
    return userDao.findAll();
    }

    @Override
    public User findByUsername(String username) {
    if (username == null)
    return null;
    return userDao.findByUsername(username);
    }

    @Override
    public User findByUsernameWithRoles(String username) {
    if (username == null)
    return null;
    return userDao.findByUsername(username);
    }

    @Override
    @Transactional
    public int deleteByUsername(String username) {
    return userDao.deleteByUsername(username);
    }

    @Override
    public User findById(Long id) {
    if (id == null)
    return null;
    return userDao.getOne(id);
    }

    @Transactional
    public void deleteById(Long id) {
    userDao.deleteById(id);
    }

    @Override
    public User save(User user) {
    User foundedUserByUsername = findByUsername(user.getUsername());
    User foundedUserByEmail = userDao.findByEmail(user.getEmail());
    if (foundedUserByUsername != null || foundedUserByEmail != null)
    return null;
    else {
    if (user.getPassword() == null || user.getPassword().isEmpty()) {
    user.setPassword((user.getUsername()));
    }
    user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));

    user.setAccountNonExpired(true);
    user.setAccountNonLocked(true);
    user.setCredentialsNonExpired(true);
    user.setEnabled(true);
    user.setPasswordChanged(false);
    user.setCreatedAt(new Date());

    if (user.getRoles() != null) {
    Collection<Role> roles = new ArrayList<Role>();
            for (Role role : user.getRoles()) {
            roles.add(roleService.save(role));
            }
            user.setRoles(roles);

            }
            User mySaved = userDao.save(user);

            return mySaved;
            }
            }

            @Override
            public User update(User user) {
            User foundedUser = findById(user.getId());
            if (foundedUser == null)
            return null;
            else {
            foundedUser.setEmail(user.getEmail());
            foundedUser.setUsername(user.getUsername());
            foundedUser.setEnabled(user.isEnabled());
            foundedUser.setCredentialsNonExpired(user.isCredentialsNonExpired());
            foundedUser.setAccountNonLocked(user.isAccountNonLocked());
            foundedUser.setAccountNonExpired(user.isAccountNonExpired());
            foundedUser.setAuthorities(new ArrayList<>());
            return userDao.save(foundedUser);
            }

            }

            @Override
            @Transactional
            public int delete(User user) {

            if (user.getUsername() == null)
            return -1;

            User foundedUser = findByUsername(user.getUsername());
            if (foundedUser == null)
            return -1;
            userDao.delete(foundedUser);
            return 1;
            }

            @Override
            public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
            return findByUsernameWithRoles(username);
            }

            }