<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from './${type.simpleName}.model';
    </#if>
</#list>

export class ${pojo.name}Vo {
   <#if pojo.id??> 
    public ${pojo.id.name}: number;
    <#else> </#if>
   <#list pojo.fieldsSimple as fieldSimple>
   <#if fieldSimple.type.simpleName == "String">
    public ${fieldSimple.name}: string;
   </#if>
    <#if fieldSimple.type.simpleName == "BigDecimal">
    public ${fieldSimple.name}: number;
   </#if>
   <#if fieldSimple.type.simpleName == "Double">
    public ${fieldSimple.name}: number;
   </#if>
   <#if fieldSimple.type.simpleName == "Boolean">
    public ${fieldSimple.name}: boolean;
   </#if>
  </#list>
    <#list pojo.fieldsSimpleNumberOrDate as fieldSimpleNumberOrDate>
        <#if pojo.id.name != fieldSimpleNumberOrDate.name>
    public ${fieldSimpleNumberOrDate.name}Max: string ;
    public ${fieldSimpleNumberOrDate.name}Min: string ;
        </#if>
    </#list>
    <#list pojo.fieldsGeneric as fieldGeneric>
    <#if fieldGeneric.pojo??> 
    public ${fieldGeneric.name}Vo: ${fieldGeneric.pojo.name}Vo = new ${fieldGeneric.pojo.name}Vo();
        <#else> </#if>
    </#list>
    <#list pojo.fieldsList as fieldList>
    public ${fieldList.name}Vo: Array<${fieldList.pojo.name}Vo> = new Array<${fieldList.pojo.name}Vo>();
    </#list>


}