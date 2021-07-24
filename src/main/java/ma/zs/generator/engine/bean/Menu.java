package ma.zs.generator.engine.bean;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

@Entity
public class Menu {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	private String libelle;
	private String icone;
	@OneToMany(mappedBy = "menu")
	List<MenuRole> menuRoles;
    @Transient
	private Pojo pojo;
	@ManyToMany
	List<Menu> menuItems;

}
