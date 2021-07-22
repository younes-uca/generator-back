package ma.zs.generator.engine.service.facade;

import java.util.List;

import ma.zs.generator.engine.bean.Menu;

public interface MenuService {
	public List<Menu> findAll();
	public Menu save(Menu menu);
	public void delete(Long id);
	//public Menu update(long id, Menu menu);

}
