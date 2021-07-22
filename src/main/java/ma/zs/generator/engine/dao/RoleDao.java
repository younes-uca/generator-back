package ma.zs.generator.engine.dao;

import ma.zs.generator.engine.bean.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author MoiseGui
 */
public interface RoleDao extends JpaRepository<Role, Long> {
    public Role findByName(String name);
    public List<Role> findAllByPermissionName(String namePermission);
}
