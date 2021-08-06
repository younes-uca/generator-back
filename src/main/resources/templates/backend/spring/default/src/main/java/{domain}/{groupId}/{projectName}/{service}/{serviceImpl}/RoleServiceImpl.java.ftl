package ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceImpl};

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import  ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.Role;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.dao}.RoleDao;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.RoleService;



@Service
public class RoleServiceImpl  implements RoleService {

@Autowired
private RoleDao roleDao;

@Override
public List<Role> findAll() {
    return roleDao.findAll();
    }

    @Override
    public Role findByAuthority(String authority) {
    if (authority == null)
    return null;
    return roleDao.findByAuthority(authority);
    }


    @Override
    @Transactional
    public int deleteByAuthority(String authority) {
    return roleDao.deleteByAuthority(authority);
    }



    @Override
    public Role findById(Long id) {
    if (id == null)
    return null;
    return roleDao.getOne(id);
    }

    @Transactional
    public void deleteById(Long id) {
    roleDao.deleteById(id);
    }



    @Override
    public List<Role> create(List<Role> roles) {
            List<Role>  resultat = new ArrayList<>();
                roles.forEach(r->resultat.add(save(r)));
                return resultat;
                }

                @Override
                public Role update(Role role) {
                Role foundedRole = findById(role.getId());
                if (foundedRole == null)
                return null;
                return roleDao.save(role);

                }

                @Override
                @Transactional
                public int delete(Role role) {

                if (role.getAuthority() == null)
                return -1;

                Role foundedRole = findByAuthority(role.getAuthority());
                if (foundedRole == null)
                return -1;
                roleDao.delete(foundedRole);
                return 1;
                }

                @Override
                public Role save(Role role) {
                Role r =  findByAuthority(role.getAuthority());
                if(r != null) return r;
                return roleDao.save(role);
                }

                @Override
                public List<Role> findByUserName(String username) {

                    return null;
                    }



                    }
