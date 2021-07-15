package ma.zs.generator.engine.service.impl;

import ma.zs.generator.engine.bean.Field;
import ma.zs.generator.engine.bean.Pojo;
import ma.zs.generator.engine.service.facade.PojoService;
import ma.zs.generator.engine.service.facade.YamlTextPojoReader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.yaml.snakeyaml.Yaml;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;

import static java.util.stream.Collectors.toList;
import static java.util.stream.Collectors.toMap;

/**
 * @author Ouiam & Zouani
 */
@Service
public class YamlTextPojoReaderImpl implements YamlTextPojoReader {
    @Autowired
    PojoService pojoService;

    public List<Pojo> convert(String yamlAsText) throws IOException {
        Map<String, Map<String, String>> yamlPojos = parseYaml(yamlAsText);
        List<Pojo> pojos = linkPojoToField(yamlPojos);
//        pojoService.prepare(pojos);
        return pojos;
    }

    private Map<String, Map<String, String>> parseYaml(String yamlAsText) {
        Yaml yaml = new Yaml();
        // key: pojoName , Map : fieldName, fieldType
        Map<String, Map<String, String>> yamlPojos = (Map<String, Map<String, String>>) yaml.load(yamlAsText);
        return yamlPojos;
    }

    private List<Pojo> linkPojoToField(Map<String, Map<String, String>> yamlPojos) {
        if (yamlPojos == null)
            yamlPojos = new HashMap<>();
        final Map<String, List<Field>> pojoField = yamlPojos.entrySet().stream()
                .collect(toMap(this::pojoName, this::fields));
        return pojoField.entrySet().stream().map(e -> new Pojo(e.getKey(), e.getValue())).collect(toList());
    }

    private String pojoName(Entry<String, Map<String, String>> yamlOuterMapEntry) {
        return yamlOuterMapEntry.getKey();
    }

    private List<Field> fields(Entry<String, Map<String, String>> yamlOuterMapEntry) {
        Map<String, String> yamlFields = yamlOuterMapEntry.getValue();
        if (yamlFields == null)
            return new ArrayList<>();
        return yamlFields.entrySet().stream().map(e -> new Field(e.getKey(), e.getValue()))
                .collect(Collectors.toList());
    }
}
