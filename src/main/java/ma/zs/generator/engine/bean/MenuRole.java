package ma.zs.generator.engine.bean;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class MenuRole {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;
	@ManyToOne
	private Menu menu;
	@ManyToOne
	private RoleConfig role;
<<<<<<< HEAD

	private String order;
=======
	
	private String ordre;
>>>>>>> da1e42665b32f6dc17c3f98afd8edb87c5ef5e3d

	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getOrdre() {
		return ordre;
	}
<<<<<<< HEAD

	public void setOrder(String order) {
		this.order = order;
=======
	public void setOrdre(String ordre) {
		this.ordre = ordre;
>>>>>>> da1e42665b32f6dc17c3f98afd8edb87c5ef5e3d
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public RoleConfig getRole() {
		return role;
	}

	public void setRole(RoleConfig role) {
		this.role = role;
	}

}
