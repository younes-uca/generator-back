import {Component, OnInit} from '@angular/core';
import {${pojo.name}Service} from '../../../controller/service/${pojo.name}.service';
import {${pojo.name}Vo} from '../../../controller/model/${pojo.name}.model';
<#list pojo.types as type>
  <#if pojo.name != type.simpleName>
import {${type.simpleName}Vo} from '../../../controller/model/${type.simpleName}.model';
    </#if>
</#list>

@Component({
  selector: 'app-${pojo.name?uncap_first}-edit',
  templateUrl: './${pojo.name?uncap_first}-edit.component.html',
  styleUrls: ['./${pojo.name?uncap_first}-edit.component.css']
})
export class ${pojo.name}EditComponent  {

constructor(private ${pojo.name?uncap_first}Service: ${pojo.name?cap_first}Service) { }
// methods 

public edit(){ 
    this.${pojo.name?uncap_first}Service.edit().subscribe(updated${pojo.name} => {
          const indexOfUpdated = this.${pojo.name?uncap_first}s.findIndex(
           (${pojo.name}) => ${pojo.name}.id === updated${pojo.name}.id
            );
            indexOfUpdated > -1 ? this.${pojo.name?uncap_first}s[indexOfUpdated] = updated${pojo.name} : false;
                });
                  this.edit${pojo.name}Dialog = false;
    this.selected${pojo.name} = new ${pojo.name}Vo();
            }

// getters and setters 

get ${pojo.name?uncap_first}s(): Array<${pojo.name}Vo> {
    return this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}s;
       }
set ${pojo.name?uncap_first}s(value: Array<${pojo.name}Vo>) {
        this.${pojo.name?uncap_first}Service.${pojo.name?uncap_first}s = value;
       } 

 get selected${pojo.name}():${pojo.name}Vo {
           return this.${pojo.name?uncap_first}Service.selected${pojo.name};
       }
    set selected${pojo.name}(value: ${pojo.name}Vo) {
        this.${pojo.name?uncap_first}Service.selected${pojo.name} = value;
       }
  
   get edit${pojo.name}Dialog():boolean {
           return this.${pojo.name?uncap_first}Service.create${pojo.name}Dialog;
       }
    set edit${pojo.name}Dialog(value: boolean) {
        this.${pojo.name?uncap_first}Service.create${pojo.name}Dialog= value;
       }


}