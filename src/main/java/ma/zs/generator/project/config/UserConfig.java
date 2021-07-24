package ma.zs.generator.project.config;

import ma.zs.generator.engine.bean.Pojo;
import ma.zs.generator.engine.bean.RoleConfig;
import ma.zs.generator.project.bean.ProjectTemplate;

import java.util.List;

/**
 * @author MoiseGui
 */
public class UserConfig {

    private List<Pojo> pojos;

    private ProjectTemplate backend;
    private boolean wantBackend = true;
    private List<RoleConfig> roles;
    private ProjectTemplate frontend;
    private boolean wantFrontend = true;

    private ProjectConfig config;

    public UserConfig() {
        super();
        this.config = new ProjectConfig();
    }

    public List<Pojo> getPojos() {
        return pojos;
    }

    public void setPojos(List<Pojo> pojos) {
        this.pojos = pojos;
    }

    public ProjectTemplate getBackend() {
        return backend;
    }

    public void setBackend(ProjectTemplate backend) {
        this.backend = backend;
    }

    public boolean isWantBackend() {
        return wantBackend;
    }

    public void setWantBackend(boolean wantBackend) {
        this.wantBackend = wantBackend;
    }

    public ProjectTemplate getFrontend() {
        return frontend;
    }

    public void setFrontend(ProjectTemplate frontend) {
        this.frontend = frontend;
    }

    public boolean isWantFrontend() {
        return wantFrontend;
    }

    public void setWantFrontend(boolean wantFrontend) {
        this.wantFrontend = wantFrontend;
    }

    public ProjectConfig getConfig() {
        return config;
    }

    public void setConfig(ProjectConfig config) {
        this.config = config;
    }

    public List<RoleConfig> getRoles() {
        return roles;
    }

    public void setRoles(List<RoleConfig> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "UserConfig{" +
                "pojos=" + pojos +
                ", backend=" + backend +
                ", wantBackend=" + wantBackend +
                ", frontend=" + frontend +
                ", wantFrontend=" + wantFrontend +
                ", config=" + config +
                '}';
    }
}
