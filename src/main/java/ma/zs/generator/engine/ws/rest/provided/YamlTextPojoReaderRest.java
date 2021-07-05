package ma.zs.generator.engine.ws.rest.provided;

import ma.zs.generator.engine.bean.Pojo;
import ma.zs.generator.engine.service.facade.YamlTextPojoReader;
import ma.zs.generator.engine.vo.RequestVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("generator/style/yaml")
public class YamlTextPojoReaderRest {
    @Autowired
    private YamlTextPojoReader yamlTextPojoReader;

    @PostMapping("/convert/")
    public List<Pojo> convert(@RequestBody RequestVo requestVo) throws IOException {
        List<Pojo> result = yamlTextPojoReader.convert(requestVo.getYamlText());
        for (Pojo pojo : result) {
            System.out.println("pojo = " + pojo);
        }
        return result;

    }


}
