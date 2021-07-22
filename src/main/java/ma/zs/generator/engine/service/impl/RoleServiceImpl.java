package ma.zs.generator.engine.service.impl;

import ma.zs.generator.engine.bean.Role;
import ma.zs.generator.engine.dao.RoleDao;
import ma.zs.generator.engine.service.facade.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MoiseGui
 */
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao dao;

    @Override
    public int save(Role role) {
        this.dao.save(role);
        return 1;
    }

    @Override
    public int deleteById(Long id) {
        this.dao.deleteById(id);
        return 1;
    }

    @Override
    public List<Role> findAll() {
        return this.dao.findAll();
    }

    @Override
    public Role findById(Long id) {
        return this.dao.findById(id).orElse(null);
    }

    @Override
    public Role findByName(String name) {
        return this.dao.findByName(name);
    }

    @Override
    public List<Role> findAllByPermissionName(String namePermission) {
        return this.dao.findAllByPermissionName(namePermission);
    }
}
