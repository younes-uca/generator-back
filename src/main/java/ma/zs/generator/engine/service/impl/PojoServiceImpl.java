package ma.zs.generator.engine.service.impl;

import ma.zs.generator.engine.bean.*;
import ma.zs.generator.engine.service.facade.PojoService;
import ma.zs.generator.engine.service.util.PojoUtil;
import ma.zs.generator.engine.service.util.StringUtil;
import ma.zs.generator.project.config.FrontendConfig;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Ouiam
 */
@Service
public class PojoServiceImpl implements PojoService {

    private FrontendConfig frontendConfig = new FrontendConfig();

    public List<Pojo> validatePojos(List<Pojo> pojos) {
        fillPojoLists(pojos);
        return prepare(pojos);
    }

    public List<Permission> validatePojosForPermissions(List<Permission> permissions) {
        for(Permission permission : permissions){
            prepareRefAndId(permission.getPojo());
        }
        return permissions;
    }

    public List<Pojo>
    prepare(List<Pojo> pojos) {
        for (Pojo pojo : pojos) {
            prepareRefAndId(pojo);
            findFieldSimple(pojo);
            findFieldCompositeList(pojo);
            findFieldGeneric(pojo);
            setFieldsSimpleMinMaxAndSimple(pojo);
            setNestedPojo(pojo, pojos);
            preparePojoBoolean(pojo);
            preparePojoComplex(pojo);
        }
        return pojos;
    }

    private List<Pojo> fillPojoLists(List<Pojo> pojos) {
        for (Pojo pojo : pojos) {
            List<Field> fields = pojo.getFields();
            fields.parallelStream().forEach(field -> {
                if (field.isGeneric())
                    pojo.getFieldsGeneric().add(field);
                else if (field.isList()) {
                    if (StringUtil.isEmpty(field.getMappedBy()))
                        field.setMappedBy(pojo.getName().toLowerCase());
                    pojo.getFieldsList().add(field);

                } else if (field.isSimple())
                    pojo.getFieldsSimple().add(field);
            });
        }
        return pojos;
    }

    private Pojo findPojoByName(String pojoName, List<Pojo> pojos) {
        return pojos.stream().filter(p -> p.getName().equals(pojoName)).findFirst().orElse(null);
    }

    private void setNestedPojo(Pojo pojo, List<Pojo> pojos) {
        List<Field> fieldGenerics = pojo.getFieldsGeneric();
        List<Field> fieldLists = pojo.getFieldsList();
        if (fieldGenerics != null) {
            fieldGenerics.forEach(field -> {
                Pojo nestedPojo = findPojoByName(field.getType().getSimpleName(), pojos);
                pojo.getTypes().add(field.getType());
                field.setPojo(nestedPojo);
            });
        }
        if (fieldLists != null) {
            fieldLists.forEach(field -> {
                Pojo nestedPojo = findPojoByName(field.getType().getSimpleName(), pojos);
                pojo.getTypes().add(field.getType());
                field.setPojo(nestedPojo);
            });
        }
    }

    private void preparePojoBoolean(Pojo pojo) {
        List<Field> simpleFields = pojo.getFieldsSimple();
        for (Field field : simpleFields) {
            if (field.getType().getSimpleName().equals("Date"))
                pojo.setHasDate(true);
            if (field.getType().getSimpleName().equals("BigDecimal"))
                pojo.setHasBigDecimal(true);
        }
        if (pojo.getId().getType().getSimpleName().equals("String"))
            pojo.setIdString(true);
        if (pojo.getFieldsList().size() > 0)
            pojo.setHasList(true);
    }

    private void setFieldsSimpleMinMaxAndSimple(Pojo pojo) {
        List<Field> fields = pojo.getFieldsSimple();
        List<Field> fieldsSimpleMinMax = new ArrayList<>();
        List<Field> fieldsSimpleStringBolean = new ArrayList<>();
        for (Field field : fields) {
            System.out.println(field.getName() + " in " + pojo.getName());
            if (PojoUtil.isNumberOrDate(field.getType().getSimpleName())) {
                fieldsSimpleMinMax.add(field);
            } else {
                fieldsSimpleStringBolean.add(field);
            }
        }
        if (!fieldsSimpleMinMax.isEmpty()) {
            pojo.setFieldsSimpleNumberOrDate(fieldsSimpleMinMax);
        }
        if (!fieldsSimpleStringBolean.isEmpty()) {
            pojo.setFieldsSimpleStringOrBoolean(fieldsSimpleStringBolean);
        }

    }

    private void preparePojoComplex(Pojo pojo) {
        if (pojo.getFields().size() >= frontendConfig.getMaxFields()) {
            pojo.setCompactView(false);
        }
    }


    private void findFieldSimple(Pojo pojo) {
        List<Field> fields = pojo.getFields();
        for (Field field : fields) {
            if (PojoUtil.isPrimitif(field.getType().getSimpleName())) {
                field.setSimple(true);
                field.setGeneric(false);
                field.setList(false);
                pojo.getFieldsSimple().add(field);
            } else {
                field.setSimple(false);
            }
        }
    }

    private void findFieldGeneric(Pojo pojo) {
        List<Field> fields = pojo.getFields();
        for (Field field : fields) {
            if (!field.isSimple() && !field.isList()) {
                field.setGeneric(true);
                // added by MoiseGui
                field.setPojo(pojo);
                field.setList(false);
                pojo.getFieldsGeneric().add(field);
            }
        }
    }

    private void findFieldCompositeList(Pojo pojo) {
        List<Field> fields = pojo.getFields();
        for (Field field : fields) {
            String type = field.getType().getName();
            if (type.contains(" ")) {
                String[] types = type.split(" ");
                if (PojoUtil.isList(types[1])) {
                    field.setType(new Type(types[0]));
                    field.setList(true);
                    field.setGeneric(false);
                    if (StringUtil.isEmpty(field.getMappedBy())) {
                        field.setMappedBy(StringUtil.upperCaseFirstLetter(pojo.getName()));
                    }
                    pojo.getFieldsList().add(field);
                }
            }

        }
    }


    private void prepareRefAndId(Pojo pojo) {
        for (Field field : pojo.getFields()) {
            String type = field.getType().getSimpleName();
            String name = field.getName();
            if (type.contains(" ")) {
                String[] typesWithIdOrRef = type.split(" ");
                type = typesWithIdOrRef[0];
                field.getType().setSimpleName(type);
                Field myField = new Field(name, type);
                if (typesWithIdOrRef[1].equals(PojoConfig.getIdDefaultName())) {
                    myField.setId(true);
                    field.setId(true);
                    pojo.setId(myField);
                } else if (typesWithIdOrRef[1].equals(PojoConfig.getReference())) {
                    myField.setReference(true);
                    field.setReference(true);
                    pojo.setReference(myField);
                }
            }
        }
    }

}
