package ma.zs.generator.engine.service.facade;

import ma.zs.generator.engine.bean.Role;

import java.util.List;

/**
 * @author MoiseGui
 */
public interface RoleService {
    public int save(Role role);
    public int deleteById(Long id);
    public List<Role> findAll();
    public Role findById(Long id);
    public Role findByName(String name);
    public List<Role> findAllByPermissionName(String namePermission);
}
