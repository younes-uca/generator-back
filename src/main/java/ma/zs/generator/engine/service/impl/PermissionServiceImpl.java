package ma.zs.generator.engine.service.impl;

import ma.zs.generator.engine.bean.Permission;
import ma.zs.generator.engine.dao.PermissionDao;
import ma.zs.generator.engine.service.facade.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MoiseGui
 */
@Service
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionDao dao;

    @Override
    public Permission save(Permission permission) {
        return this.dao.save(permission);
    }

    @Override
    public int deleteById(Long id) {
        this.dao.deleteById(id);
        return 1;
    }

    @Override
    public List<Permission> findAll() {
        return this.dao.findAll();
    }

    @Override
    public Permission findById(Long id) {
        return this.dao.findById(id).orElse(null);
    }

    @Override
    public Permission findByName(String nom) {
        return this.dao.findByName(nom);
    }

    @Override
    public List<Permission> findAllByRoleName(String nameRole) {
         //this.dao.findAllByRoleName(nameRole);
    	return null;
    }
}
