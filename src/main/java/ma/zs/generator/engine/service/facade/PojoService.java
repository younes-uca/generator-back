package ma.zs.generator.engine.service.facade;

import ma.zs.generator.engine.bean.Permission;
import ma.zs.generator.engine.bean.Pojo;

import java.util.List;

/**
 * @author MoiseGui
 */
public interface PojoService {

    List<Pojo> prepare(List<Pojo> pojos);

    List<Pojo> validatePojos(List<Pojo> pojos);

    List<Permission> validatePojosForPermissions(List<Permission> permissions);
}
