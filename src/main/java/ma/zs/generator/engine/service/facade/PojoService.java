package ma.zs.generator.engine.service.facade;

import ma.zs.generator.engine.bean.Pojo;

import java.util.List;

/**
 * @author Ouiam
 */
public interface PojoService {

    List<Pojo> prepare(List<Pojo> pojos);

    List<Pojo> validatePojos(List<Pojo> pojos);
}
