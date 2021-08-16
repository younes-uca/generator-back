package ${config.domain}.${config.groupId}.${config.projectName}.${config.dao};

import org.springframework.data.jpa.repository.JpaRepository;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.Permission;

public interface PermissionDao extends JpaRepository<Permission, Long> {
    public Permission findByName(String name);
}