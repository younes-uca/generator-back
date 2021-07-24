package ma.zs.generator.engine.service.facade;

import ma.zs.generator.engine.bean.RoleConfig;

import java.util.List;

/**
 * @author MoiseGui
 */
public interface RoleConfigService {
    public RoleConfig save(RoleConfig role);
    public int deleteById(Long id);
    public List<RoleConfig> findAll();
    public RoleConfig findById(Long id);
    public RoleConfig findByName(String name);
    public List<RoleConfig> findAllByPermissionName(String namePermission);
}
