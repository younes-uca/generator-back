package ma.zs.generator.engine.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class MenuRole {
	@ManyToOne
	private Menu menu;
	@ManyToOne
	private RoleConfig role;
	
	private String order;


	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
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
