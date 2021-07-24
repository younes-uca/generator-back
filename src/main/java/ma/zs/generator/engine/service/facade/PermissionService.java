package ma.zs.generator.engine.service.facade;

import ma.zs.generator.engine.bean.Permission;

import java.util.List;

/**
 * @author MoiseGui
 */
public interface PermissionService {
    public Permission save(Permission permission);
    public int deleteById(Long id);
    public List<Permission> findAll();
    public Permission findById(Long id);
    public Permission findByName(String name);
    public List<Permission> findAllByRoleName(String nameRole);
}
