package ma.zs.generator.engine.service.facade;

import freemarker.template.Configuration;
import freemarker.template.TemplateException;
import ma.zs.generator.engine.bean.Permission;
import ma.zs.generator.engine.bean.Pojo;
import ma.zs.generator.engine.bean.RoleConfig;
import ma.zs.generator.project.config.ProjectConfig;

import java.io.IOException;
import java.util.List;

/**
 * @author Ouiam
 */
public interface FreeMarkerService {
    Configuration initConfiguration() throws IOException;

    void generateFile(List<Pojo> pojos, String templateName, String fileName, String extension, String outputDirectory,
                      String templatePath, ProjectConfig config) throws IOException, TemplateException;

    void generateFileWithOnePojo(Pojo pojo, String templateName, String templatePath, String generatedFileName,
                                 String outputDirectory, ProjectConfig config) throws IOException, TemplateException;

    void generateFileWithOnePojo(Pojo pojo, String fileName, String generatedFolder, String template) throws IOException, TemplateException;

    void generateFile(List<Pojo> pojos, String fileName, String generatedFolder, String template) throws IOException, TemplateException;
    void generateFileWithPermissions(List<Permission> permissions, String roleName , String templateName, String templatePath, String generatedFileName,
                                       String outputDirectory, ProjectConfig config) throws IOException, TemplateException ;

}
