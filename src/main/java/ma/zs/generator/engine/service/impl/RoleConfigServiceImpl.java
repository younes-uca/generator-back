package ma.zs.generator.engine.service.impl;

import ma.zs.generator.engine.bean.RoleConfig;
import ma.zs.generator.engine.dao.RoleConfigDao;
import ma.zs.generator.engine.service.facade.RoleConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author MoiseGui
 */
@Service
public class RoleConfigServiceImpl implements RoleConfigService {
    @Autowired
    private RoleConfigDao dao;

    @Override
    public RoleConfig save(RoleConfig role) {
        return this.dao.save(role);
    }

    @Override
    public int deleteById(Long id) {
        this.dao.deleteById(id);
        return 1;
    }

    @Override
    public List<RoleConfig> findAll() {
        return this.dao.findAll();
    }

    @Override
    public RoleConfig findById(Long id) {
        return this.dao.findById(id).orElse(null);
    }

    @Override
    public RoleConfig findByName(String name) {
        return this.dao.findByName(name);
    }

    @Override
    public List<RoleConfig> findAllByPermissionName(String namePermission) {
        return this.dao.findAllByPermissionsName(namePermission);
    }
}
