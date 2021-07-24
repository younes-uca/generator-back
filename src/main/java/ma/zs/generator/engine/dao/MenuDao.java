package ma.zs.generator.engine.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import ma.zs.generator.engine.bean.Menu;

@Repository
public interface MenuDao extends JpaRepository<Menu, Long>{
public Menu findByLibelle(String libelle);

//@Query("SELECT m FROM Menu m, Role r, Menu_Role mr  WHERE m.id = mr.menu and mr.role = r.id and r.name = ?1")
//public List<Menu> findAllByRoleName(String name);
}
