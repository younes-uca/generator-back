package ma.zs.generator.engine.dao;

import ma.zs.generator.engine.bean.RoleConfig;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @author MoiseGui
 */
public interface RoleDao extends JpaRepository<RoleConfig, Long> {
    public RoleConfig findByName(String name);
    public List<RoleConfig> findAllByPermissionName(String namePermission);
}
