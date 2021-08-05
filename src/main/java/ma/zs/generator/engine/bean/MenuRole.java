package ma.zs.generator.engine.bean;

public class MenuRole {
	private long id;
	private Menu menu;
	private RoleConfig role;

	private String ordre;


	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getOrdre() {
		return ordre;
	}
	public void setOrdre(String ordre) {
		this.ordre = ordre;
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
