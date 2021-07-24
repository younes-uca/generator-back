package ma.zs.generator.engine.bean;

import javax.persistence.*;
import java.util.List;

/**
 * @author MoiseGui
 */
@Entity
public class Permission {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    @ManyToMany
    private List<RoleConfig> roles;

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

    public List<RoleConfig> getRoles() {
        return roles;
    }

    public void setRoles(List<RoleConfig> roles) {
        this.roles = roles;
    }
}
