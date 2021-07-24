package ma.zs.generator.engine.bean;

import javax.persistence.*;
import java.util.List;

/**
 * @author MoiseGui
 */
@Entity
public class RoleConfig {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    @ManyToMany
    private List<Permission> permissions;
    
    @OneToMany
    private List<MenuRole> menuRoles;
    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Permission> getPermissions() {
        return permissions;
    }

    public void setPermissions(List<Permission> permissions) {
        this.permissions = permissions;
    }
}
