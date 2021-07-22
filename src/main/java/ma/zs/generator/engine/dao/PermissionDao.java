package ma.zs.generator.engine.dao;

import ma.zs.generator.engine.bean.Permission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author MoiseGui
 */
public interface PermissionDao extends JpaRepository<Permission, Long> {
    public Permission findByName(String name);
    public List<Permission> findAllByRoleName(String nameRole);
}
