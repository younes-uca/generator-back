package ma.zs.generator.engine.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ma.zs.generator.engine.bean.Menu;

@Repository
public interface MenuDao extends JpaRepository<Menu, Long>{
public Menu findByLibelle(String libelle);
public List<Menu> findAllByRoleName(String name);
}
