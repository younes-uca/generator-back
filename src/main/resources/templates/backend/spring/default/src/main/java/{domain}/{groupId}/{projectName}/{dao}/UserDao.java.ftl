package ${config.domain}.${config.groupId}.${config.projectName}.${config.dao};

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.User;

@Repository
public interface UserDao  extends JpaRepository<User, Long>{
User findByUsername(String username);
int deleteByUsername(String username);

User findByEmail(String email);

}
