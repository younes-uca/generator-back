
package  ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.restFacade}.${roleName};

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.bean}.${permissions[0].pojo.name?cap_first};
import ${config.domain}.${config.groupId}.${config.projectName}.${config.service}.${config.serviceFacade}.${permissions[0].pojo.name?cap_first}Service;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.converter}.${permissions[0].pojo.name?cap_first}Converter;
import ${config.domain}.${config.groupId}.${config.projectName}.${config.ws}.${config.rest}.${config.provided}.${config.vo}.${permissions[0].pojo.name?cap_first}Vo;

@Api("Manages ${permissions[0].pojo.name?uncap_first} services")
@RestController
@RequestMapping("${config.projectName}/${roleName}/${permissions[0].pojo.name?uncap_first}")
public class  ${permissions[0].pojo.name?cap_first}Rest${roleName?cap_first} {

@Autowired
private  ${permissions[0].pojo.name?cap_first}Service  ${permissions[0].pojo.name?uncap_first}Service;

@Autowired
private  ${permissions[0].pojo.name?cap_first}Converter  ${permissions[0].pojo.name?uncap_first}Converter;
<#list permissions as permission>
    <#if permission.name?contains("add")>
        @ApiOperation("Saves the specified  ${permissions[0].pojo.name?uncap_first}")
        @PostMapping("/")
        public ${permissions[0].pojo.name?cap_first}Vo save(@RequestBody ${permissions[0].pojo.name?cap_first}Vo  ${permissions[0].pojo.name?uncap_first}Vo){
        ${permissions[0].pojo.name?cap_first}  ${permissions[0].pojo.name?uncap_first}=  ${permissions[0].pojo.name?uncap_first}Converter.toItem( ${permissions[0].pojo.name?uncap_first}Vo);
        ${permissions[0].pojo.name?uncap_first}=     ${permissions[0].pojo.name?uncap_first}Service.save( ${permissions[0].pojo.name?uncap_first});
        return  ${permissions[0].pojo.name?uncap_first}Converter.toVo( ${permissions[0].pojo.name?uncap_first});
        }
    </#if>
    <#if permission.name?contains("delete")>
        @ApiOperation("Delete the specified  ${permissions[0].pojo.name?uncap_first}")
        @DeleteMapping("/")
        public int delete(@RequestBody  ${permissions[0].pojo.name?cap_first}Vo  ${permissions[0].pojo.name?uncap_first}Vo){
        ${permissions[0].pojo.name?cap_first} ${permissions[0].pojo.name?uncap_first} =  ${permissions[0].pojo.name?uncap_first}Converter.toItem( ${permissions[0].pojo.name?uncap_first}Vo);
        return  ${permissions[0].pojo.name?uncap_first}Service.delete( ${permissions[0].pojo.name?uncap_first});
        }

    </#if>
    <#if permission.name?contains("edit")>
        @ApiOperation("Updates the specified  ${permissions[0].pojo.name?uncap_first}")
        @PutMapping("/")
        public  ${permissions[0].pojo.name?cap_first}Vo update(@RequestBody  ${permissions[0].pojo.name?cap_first}Vo  ${permissions[0].pojo.name?uncap_first}Vo){
        ${permissions[0].pojo.name?cap_first}  ${permissions[0].pojo.name?uncap_first} =  ${permissions[0].pojo.name?uncap_first}Converter.toItem( ${permissions[0].pojo.name?uncap_first}Vo);
        ${permissions[0].pojo.name?uncap_first} =  ${permissions[0].pojo.name?uncap_first}Service.update( ${permissions[0].pojo.name?uncap_first});
        return  ${permissions[0].pojo.name?uncap_first}Converter.toVo( ${permissions[0].pojo.name?uncap_first});
        }
    </#if>
    <#if permission.name?contains("list") >
        @ApiOperation("Finds a list of all  ${permissions[0].pojo.name?uncap_first}s")
        @GetMapping("/")
        public List< ${permissions[0].pojo.name?cap_first}Vo> findAll(){
        return  ${permissions[0].pojo.name?uncap_first}Converter.toVo( ${permissions[0].pojo.name?uncap_first}Service.findAll());
        }
    </#if>
<#--    <#if permission.name?contains("view") >-->
<#--        @ApiOperation("Finds a ${permissions[0].pojo.name?uncap_first} by ${permissions[0].pojo.id.name}")-->
<#--        @GetMapping("/${permissions[0].pojo.id.name}}/{${permissions[0].pojo.id.name}}")-->
<#--        public  ${permissions[0].pojo.name}Vo findBy${permissions[0].pojo.id.name}?cap_first}(@PathVariable ${permissions[0].pojo.id.type.simpleName} ${permissions[0].pojo.id.name}){-->
<#--        return ${permissions[0].pojo.name?uncap_first}Converter.toVo(${permissions[0].pojo.name?uncap_first}Service.findBy${permissions[0].pojo.id.name}?cap_first}(${permissions[0].pojo.id.name}));-->
<#--        }-->
<#--    </#if>-->


</#list>
}
