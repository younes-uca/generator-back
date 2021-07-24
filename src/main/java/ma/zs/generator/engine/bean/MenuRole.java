package ma.zs.generator.engine.bean;

public class MenuRole {
	private long id;
	private Menu menu;
	private RoleConfig role;
<<<<<<< HEAD
<<<<<<< HEAD

	private String order;
=======
	
=======
>>>>>>> f2f3edb5ce2b4a85d71b8e88a1aa0e19662535dc
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
