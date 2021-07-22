package ma.zs.generator.engine.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ma.zs.generator.engine.bean.Menu;
import ma.zs.generator.engine.dao.MenuDao;
import ma.zs.generator.engine.service.facade.MenuService;

@Service
public class MenuServiceImpl implements MenuService {
     @Autowired
     private MenuDao  menuDao;
	@Override
	public List<Menu> findAll() {
		return menuDao.findAll();
	}

	@Override
	public Menu save(Menu menu) {
		return menuDao.save(menu);
	}

	@Override
	public void delete(Long id) {
       menuDao.deleteById(id);		
	}

	
}
