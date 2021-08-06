package ma.zs.generator.engine.service.impl;

import freemarker.template.TemplateException;
import ma.zs.generator.engine.bean.Permission;
import ma.zs.generator.engine.bean.Pojo;
import ma.zs.generator.engine.bean.RoleConfig;
import ma.zs.generator.engine.service.facade.FreeMarkerService;
import ma.zs.generator.engine.service.facade.TemplateEngineService;
import ma.zs.generator.engine.service.util.EngineUtil;
import ma.zs.generator.engine.service.util.FileUtil;
import ma.zs.generator.engine.service.util.StringFormatterUtil;
import ma.zs.generator.engine.service.util.StringUtil;
import ma.zs.generator.project.config.ProjectConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Qada
 */
@Service
public class TemplateEngineServiceImpl implements TemplateEngineService {

    @Autowired
    private FreeMarkerService freeMarkerService;

    @Override
    public void generate(File templateFolder, String generatedFolder, List<Pojo> pojos, ProjectConfig config, List<RoleConfig> roleConfigs)
            throws IOException, TemplateException {
        FileUtil.createDirectory(generatedFolder);
        scanTemplate(templateFolder, templateFolder.getPath(), pojos, generatedFolder, config, roleConfigs);
    }

    @Override
    public void scanTemplate(File template, String projectTemplatePath, List<Pojo> pojos, String outputFolder, ProjectConfig config, List<RoleConfig> roleConfigs)
            throws IOException, TemplateException {

        List<File> childs = Arrays.asList(template.listFiles());
        for (File file : childs) {
            if (file.isDirectory()) {


                // System.out.println("paaaath roooooooole name *******************"+file.getName());

                FileUtil.createDirectory(replaceAllPlaceHoldersInPath(file.getPath(), config).replace(projectTemplatePath, outputFolder));
                scanTemplate(file, projectTemplatePath, pojos, outputFolder, config, roleConfigs);


            } else {
                if (EngineUtil.isPermissionRole(file.getName())) {
                    for (RoleConfig roleConfig : roleConfigs) {
                        generateForAllPermission(file, roleConfig.getPermissions(), projectTemplatePath, outputFolder, config, roleConfig.getName());
                    }
                } else {
                    if (EngineUtil.isAuthorities(file.getName())) {
                        generateAuthorities(file, roleConfigs, projectTemplatePath, outputFolder, config);

                    } else {
                        if (!EngineUtil.isTemplate(file.getName()))
                            copyFile(file, projectTemplatePath, outputFolder, config);
                        else {
                            if (EngineUtil.isTemplateForMany(file.getName())) {
                                generateForAllPojos(file, pojos, projectTemplatePath, outputFolder, config);

                            } else if (EngineUtil.isOptional(file.getName()))
                                generateOptional(file, pojos, projectTemplatePath, outputFolder, config);
                            else
                                generateOne(file, pojos, projectTemplatePath, outputFolder, config);

                        }
                    }
                }
            }

        }

    }

    private void generateAuthorities(File file, List<RoleConfig> roleConfigs, String projectTemplatePath, String outputFolder, ProjectConfig config)
            throws IOException, TemplateException {
        String fileName = EngineUtil.getSuffixOrName(file.getName());
        String extension = EngineUtil.getExtension(file.getName());

        String outputDirectory = replaceAllPlaceHoldersInPath(file.getParent().replace(projectTemplatePath, outputFolder), config);
        freeMarkerService.genereteFileAuthorities(roleConfigs, file.getName(), fileName,extension,outputDirectory,
                file.getParent() + File.separator,config);



    }


    private void copyFile(File file, String src, String dest, ProjectConfig config) throws IOException {
        System.out.println(
                "copy " + file.getName() + " from " + file.getParent() + " to " + file.getParent().replace(src, dest));

        FileUtil.copyFile(file.getPath(), replaceAllPlaceHoldersInPath(file.getParent().replace(src, dest), config) + File.separator + file.getName());

    }

    //file = template src\main\resources\templates\backend\spring\default\src\main\java\{domain}\{groupId}\{projectName}\{ws}\{rest}\{provided}\roles
    //  src************ src\main\resources\templates\backend\spring\default
    // des outputFoldel C:\Users\a\generated\1627578176949\backend
    private void generateForAllPojos(File file, List<Pojo> pojos, String src, String dest, ProjectConfig config)
            throws IOException, TemplateException {
        System.out.println("generate all " + file.getName());
        String suffix = EngineUtil.getSuffixOrName(file.getName());
        if (EngineUtil.isPlaceHolder(suffix))
            suffix = replacePlaceholderWithTheEquivalentValue(EngineUtil.getPlaceHolder(suffix), config);
        String extensions = EngineUtil.getExtension(file.getName());
        String outputDirectory = replaceAllPlaceHoldersInPath(file.getParent().replace(src, dest), config);
        System.out.println("out derectory " + dest);
        System.out.println("out derectory " + src);

        if (!EngineUtil.isComponent(file.getName())) {
            System.out.println("file name = " + file.getName() + "extention  " + suffix + " " + extensions);
//file parent = src\main\resources\templates\backend\spring\default\src\main\java\{domain}\{groupId}\{projectName}\{ws}\{rest}\{provided}\roles
            for (Pojo pojo : pojos) {
                freeMarkerService.generateFileWithOnePojo(pojo, file.getName(), file.getParent() + File.separator, pojo.getName() + suffix + "." + extensions, outputDirectory, config);
            }
        } else {
            for (Pojo pojo : pojos) {
                generateFilesInFolders(pojo, file.getName(), suffix, extensions, outputDirectory,
                        file.getParent() + File.separator, config);
            }

        }

    }

    private void generateForAllPermission(File file, List<Permission> permissions, String src, String dest, ProjectConfig config, String roleName)
            throws IOException, TemplateException {

        String outputDirectory = replaceAllPlaceHoldersInPath(file.getParent().replace(src, dest), config);
        outputDirectory = outputDirectory + File.separator + roleName;
        FileUtil.createDirectory(outputDirectory);
        List<String> pojoName = new ArrayList<>();

        for (int i = 0; i < permissions.size(); i++) {
            if (!pojoName.contains(permissions.get(i).getPojo().getName())) {
                pojoName.add(permissions.get(i).getPojo().getName());
            }
            for (String nom : pojoName) {
                List<Permission> p = permissions.stream()
                        .filter(permission -> permission.getPojo().getName().equals(nom))
                        .collect(Collectors.toList());
                freeMarkerService.generateFileWithPermissions(p, roleName, file.getName(), file.getParent() + File.separator, StringFormatterUtil.lowerCaseTheFirstLetter(nom) + "Rest.java", outputDirectory, config);

            }

        }


    }

    private void generateOptional(File file, List<Pojo> pojos, String src, String dest, ProjectConfig config)
            throws IOException, TemplateException {
        String fileName = file.getName();
        if (isValidOptional(EngineUtil.getCondition(fileName), config)) {
            fileName = EngineUtil.cutCondition(fileName);
            if (EngineUtil.isPlaceHolder(fileName))
                fileName = replacePlaceholderWithTheEquivalentValue(EngineUtil.getPlaceHolder(EngineUtil.getSuffixOrName(fileName)), config);
            else
                fileName = EngineUtil.getSuffixOrName(fileName);
            String extension = EngineUtil.getExtension(EngineUtil.cutCondition(file.getName()).replaceAll("[{}]", ""));
            String outputDirectory = replaceAllPlaceHoldersInPath(file.getParent().replace(src, dest), config);
            System.out.println(" generate " + fileName + "." + extension + " in " + outputDirectory);

             freeMarkerService.generateFile(pojos, file.getName(), fileName, extension, outputDirectory,
                    file.getParent() + File.separator, config);

        }

    }


    private void generateOne(File file, List<Pojo> pojos, String src, String dest, ProjectConfig config)
            throws IOException, TemplateException {
        String fileName = file.getName();
        if (EngineUtil.isPlaceHolder(fileName))
            fileName = replacePlaceholderWithTheEquivalentValue(EngineUtil.getPlaceHolder(EngineUtil.getSuffixOrName(fileName)), config);
        else
            fileName = EngineUtil.getSuffixOrName(fileName);
        String extension = EngineUtil.getExtension(file.getName().replaceAll("[{}]", ""));
        String outputDirectory = replaceAllPlaceHoldersInPath(file.getParent().replace(src, dest), config);
        System.out.println(" generate " + fileName + "." + extension + " in " + outputDirectory);

        freeMarkerService.generateFile(pojos, file.getName(), fileName, extension, outputDirectory,
                file.getParent() + File.separator, config);
    }

    private void generateFilesInFolders(Pojo pojo, String templateName, String suffix, String extensions,
                                        String outputDirectory, String templatePath, ProjectConfig config) throws IOException, TemplateException {
        outputDirectory += File.separator + StringFormatterUtil.lowerCaseTheFirstLetter(pojo.getName());

        FileUtil.createDirectory(outputDirectory);
        if (EngineUtil.inFolder(templateName)) {
            // frontend component folder like commandes
            outputDirectory += File.separator + EngineUtil.getFolder(templateName);
            FileUtil.createDirectory(outputDirectory);
            freeMarkerService.generateFileWithOnePojo(pojo, templateName, templatePath, StringFormatterUtil.lowerCaseTheFirstLetter(pojo.getName()) + "-" + suffix + "." + extensions, outputDirectory, config);
        } else {
            if (StringUtil.isEmpty(suffix))
                freeMarkerService.generateFileWithOnePojo(pojo, templateName, templatePath, StringFormatterUtil.lowerCaseTheFirstLetter(pojo.getName()) + "." + extensions, outputDirectory, config);
            else
                freeMarkerService.generateFileWithOnePojo(pojo, templateName, templatePath, suffix + "." + extensions, outputDirectory, config);

        }


    }


    private String replaceAllPlaceHoldersInPath(String path, ProjectConfig projectConfig) {
        if (!path.contains("{") || !path.contains("}"))
            return path;
        else {
            String[] names = path.split(File.separator + File.separator);
            String newPath = names[0];
            for (int i = 1; i < names.length; i++) {
                if (EngineUtil.isPlaceHolder(names[i]))
                    newPath += File.separator + replacePlaceholderWithTheEquivalentValue(EngineUtil.getPlaceHolder(names[i]), projectConfig);
                else
                    newPath += File.separator + names[i];

            }
            return newPath;
        }
    }

    private String replacePlaceholderWithTheEquivalentValue(String name, ProjectConfig projectConfig) {
        Class clazz = projectConfig.getClass();
        String fieldValue;

        Field field;
        try {
            field = clazz.getDeclaredField(name);
            fieldValue = (String) field.get(projectConfig);
            return fieldValue;
        } catch (NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return name;
        }

    }

    private boolean isValidOptional(String condition, ProjectConfig projectConfig) {
        Class clazz = projectConfig.getClass();
        boolean fieldValue;

        Field field;
        try {
            field = clazz.getDeclaredField(condition);
            fieldValue = (boolean) field.get(projectConfig);
            return fieldValue;
        } catch (NoSuchFieldException | SecurityException | IllegalArgumentException | IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            return false;
        }

    }
}
