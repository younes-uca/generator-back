/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.zs.generator.engine.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.File;
import java.io.Serializable;

/**
 * @author gouss
 */
@Entity
public class PojoConfig implements Serializable {

    private static String reference = "REF";
    private static String idDefaultName = "ID";
    private static String idDefaultType = "Long";
    private static String beanPath = "main" + File.separator + "java" + File.separator + "ma" + File.separator + "zs" + File.separator + "generator" + File.separator + "bean";
    private static String packageRoot = "ma.zs.generator";
    private static String packageBean = packageRoot + ".bean";
    @Id
    private Long id;

    public static String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public static String getIdDefaultName() {
        return idDefaultName;
    }

    public void setIdDefaultName(String idDefaultName) {
        this.idDefaultName = idDefaultName;
    }

    public static String getIdDefaultType() {
        return idDefaultType;
    }

    public void setIdDefaultType(String idDefaultType) {
        this.idDefaultType = idDefaultType;
    }

    public static String getBeanPath() {
        return beanPath;
    }

    public static void setBeanPath(String beanPath) {
        PojoConfig.beanPath = beanPath;
    }

    public static String getPackageRoot() {
        return packageRoot;
    }

    public static void setPackageRoot(String packageRoot) {
        PojoConfig.packageRoot = packageRoot;
    }

    public static String getPackageBean() {
        return packageBean;
    }

    public static void setPackageBean(String packageBean) {
        PojoConfig.packageBean = packageBean;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


}
