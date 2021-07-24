package ma.zs.generator.engine.dao;

import ma.zs.generator.engine.bean.RoleConfig;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author MoiseGui
 */
@Repository
public interface RoleConfigDao extends JpaRepository<RoleConfig, Long> {
    public RoleConfig findByName(String name);
    public List<RoleConfig> findAllByPermissionName(String namePermission);
}
